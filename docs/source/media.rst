Media API
---------

.. note:: This article may be moved to the general AIForces doc

Overview
^^^^^^^^
The Media API is designed to fetch user uploaded content in a predictable,
understandable and a secure way. It is also an abstraction layer between
the user and the internal storage scheme used in the application.

Front-end
^^^^^^^^^
All the urls handled by the user have this general shape::

   https://outhosting.com/media/:longidentifier/original_filename.ext

This method has several upsides

1. It stays the same for all file types and uses. From images to submissions
   and tasks, everything can be retrieved in the same way.
2. The identifier could be used in many places throughout the application,
   since it will uniquely map to a particular file.
3. It allows for pseudo-folders. If all filenames are unique and the
   circumstances call for that (for example, a task folder) those files can be
   kept together for ease of access.
4. It preserves the orignal filenames, which helps the user who uploaded It
   identify the file later.

Back-end
^^^^^^^^
There are basically four parts to the inner workings of this API. The check,
the database, the file server and the delivery service.

The check
"""""""""
Before even trying to find the file, the api has to check whether the user has
the rights to download that file.

   .. note:: Caching policy

      At this stage the api also decides the caching policy for the files.
      Private files should not be cached outside the in-app delivery service.
      Public files, however, should be set to cache.

The database
""""""""""""
It stores a simple lookup, for each identifier there is a path for the file in
the file server.

The file server
"""""""""""""""
To maximize efficiency, multiple SMB servers are sharded. They are all mounted
in the content delivery container, and all have the same top-level structure.

The delivery
""""""""""""
For that it is logical to use the `XSendfile <https://www.nginx.com/resources/wiki/start/topics/examples/xsendfile/>`_
feature. Since the file servers are mounted at some path to the nginx container
the sharding can be done in the database step, just by specifying a different
top level folder, corresponding to an SMB server instance.

Uploading
^^^^^^^^^
No file should be able to be uploaded directly, but rather through other more
specific endpoints (like a new task, or a new submission). Those endpoints
should return a 201 CREATED AT response with a corresponding
``/media/:longidentifier/filename.ext`` uri. For a folder-like upload, the
endpoint should retuen a uri corresponding to a manifest file, or any other
file deemed to be the most important. If there is none, it can return a link to
any file in the folder.

In order to ensure a unique identifier, it should be computed in the following
way for an individual file::

   sha-256( TIME_OF_UPLOAD + FILE_CONTENTS + AUTHOR_USERNAME + SECRET_SALT )
   FILE_CONTENTS = PLANNED_FS_PATH + REAL_FILE_CONTENTS

For a folder-like, all file contents should be concatenated in order to compute
the hash.

Folder structure
^^^^^^^^^^^^^^^^
Since almost every file is visible to the content delivery service, they should
be structured in folders in such a way that there would be logical,
human-understandable separation. Firstly there is the SMB server identifier.
Because all servers have the same internal structure, it only impacts sharding.
Next are the big categories: user-media, tasks, submissions and the judging
sandbox. The delivery system should only have access to the first three.

In the user-media folder, there are broad categories like profile-pictures,
posts and so on. In each of them, each file is bound in its own folder with the
same name as its unique identifier. Example::

   /smb1/user-media/profile-picture/12e90b8e74f20fc0a7274cff9fcbae14592db12292757f1ea0d7503d30799fd2/cat.jpg

In the tasks folder, each task is bounded in a folder, named as
``taskshortname-longidentifier``. There are several files in each folder.
Example::

   /smb3/tasks/Tron4000-3ecf001753640fa58a06d5515fa610388a4f1722647d5f9f8abe76e4ed8a61f9/statement.pdf

In the submissions folder, each submission is bounded by a folder named as
``contestshortname-taskshortname-username-longidentifier``. Example::

   /smb2/submissions/tron4eva-tronagain-whoisthis-2be23c585f15e5fd3279d0663036dd9f6e634f4225ef326fc83fb874dbb81a0f/main.cpp

Since all the last stage folders have the unique identifier in their name, they
are guaranteed to be unique.

Folder-likes
^^^^^^^^^^^^

A folder-like upload is just a grouping feature for the end user. Some actions
require multiple files uploaded at once (case study: tasks). In this case it is
convenient to provide access to said files in a consistent manner. One way to
achieve this might be to use the same long identifier for the whole group, only
leaving the filenames to differentiate them.

.. warning:: This method does not have any connection to a physical folder on
   a hard drive. It only lets multiple files to share the same long identifier.
   After that, they may have completely unrelated fs paths mapped to them.

Migration
"""""""""
Folder-likes are not incompatible with regular file uploads. They only add a
check on the provided filename, which should be done anyways. For example if
a regular file /id1/abc.txt is registered, the url /id1/def.txt should not
resolve, even if it has a correct id. So, a folder upload of abc.txt def.txt
and ghi.txt would look like this::

   As a regular upload:
   /id1/abc.txt
   /id2/def.txt
   /id3/ghi.txt

   As a folder-like upload:
   /id4/abc.txt
   /id4/def.txt
   /id4/ghi.txt

Mixing both styles is acceptable within the same database which makes migrating
from one to another easy.

Task uploads
""""""""""""
Task file inspection is the main use for this feature, so it is necessary to
discuss it in more depth. There is no access to the original source files, but
only to those that are the result of the task compilation. It should expose
both required files (like `statement.pdf`) and those listed in the maniefst
file by the uploader. Those files do not have to be in the same fs folder.
Example::

   task-folder
   ├── MANIFEST
   ├── check.py
   ├── statement
   │   ├── statement.tex
   │   ├── cat.jpg
   │   ├── data.csv
   │   └── statement.pdf
   ├── viewer
   │   ├── main.css
   │   ├── main.html
   │   └── main.js
   ├── run.sh
   └── favicon.ico

   Required file paths:
   /taskid/run.sh
   /taskid/statement.pdf
   /taskid/main.css
   /taskid/main.js
   /taskid/main.html

   Paths from manifest:
   /taskid/check.py
   /taskid/favicon.ico
   /taskid/data.csv
