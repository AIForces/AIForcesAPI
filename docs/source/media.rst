.. _media-api-label:

Media API
---------

Overview
^^^^^^^^
The Media API is designed to fetch user uploaded content in a predictable,
understandable and a secure way. It is also an abstraction layer between
the user and the internal storage scheme used in the application.

Front-end
^^^^^^^^^
All the urls handled by the user have this general shape::

   https://ourhosting.com/media/:longidentifier/original_filename.ext

This method has several upsides

1. It stays the same for all file types and uses. From images to submissions
   and tasks, everything can be retrieved in the same way.
2. The identifier could be used in many places throughout the application,
   since it together with the filename will uniquely map to a particular file.
3. It allows for pseudo-folders. If all filenames are unique and the
   circumstances call for that (for example, a task folder) those files can be
   kept together for ease of access under the same identifier.
4. It preserves the original filenames, which helps the user who uploaded it to
   identify the file later.

Back-end
^^^^^^^^
There are basically four parts to the inner workings of this API. The check,
the database, the file server and the delivery service.

The check
"""""""""
Before even trying to find the file, the api has to check whether the user has
the rights to download that file. Those are stored in a separate column in the
lookup database. See :ref:`permissions-label`.

   .. note:: Caching policy

      At this stage the api also decides the caching policy for the files.
      Private files should not be cached outside of the in-app delivery service.
      Public files, however, should be set to cache.

The database
""""""""""""
Each row has the identifier + the original filename as the primary key. For it,
it stores the fs path to the file (including the sharding key) and read and
modify permissions.

The file server
"""""""""""""""
To maximize efficiency, multiple SMB servers are sharded. They are all mounted
in the content delivery container, and all have the same top-level structure.
File system structure is described here :ref:`filesystem-label`.

The delivery
""""""""""""
It is logical to use the `XSendfile <https://www.nginx.com/resources/wiki/start/topics/examples/xsendfile/>`_
feature. Since the file servers are mounted at some path to the nginx container
the sharding can be done in the database step, just by specifying a different
top level folder, corresponding to an SMB server instance.

Uploading
^^^^^^^^^
No file should be able to be uploaded directly, but rather through other more
specific endpoints (like a new task, or a new submission). Those endpoints
should return a 201 CREATED AT response with a corresponding
``/media/:longidentifier/filename.ext`` uri. For a folder-like upload, the
endpoint should return a uri corresponding to a manifest file, or any other
file deemed to be the most important. If there is none, it can return a link to
any file in the folder.

In order to ensure a unique identifier, it should be computed in the following
way for an individual file::

   sha-256( TIME_OF_UPLOAD + FILE_CONTENTS + AUTHOR_USERNAME + SECRET_SALT )
   FILE_CONTENTS = PLANNED_FS_PATH + REAL_FILE_CONTENTS

For a folder-like, all file contents should be concatenated in order to compute
the hash.

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

.. warning:: Consult with the main problemsetting doc :ref:`problemsetting-label`

Task file inspection is the main use for this feature, so it is necessary to
discuss it in more depth. Not all files are exposed, there is a list of
predetermined files and the uploader can also specify a set of public files.
This also flattens all the exported files into one folder-like.
Example::

   task-folder
   ├── lib
   │   ├── olymp.sty
   │   ├── problem.tex
   │   └── statements.ftl
   ├── private
   ├── problem.yaml
   ├── public
   │   ├── change_log.txt
   │   ├── favicon.ico
   ├── scripts
   │   ├── build.sh
   │   ├── check.sh
   │   └── validator.sh
   ├── solutions
   │   ├── ermolin.cpp
   │   ├── starkov.cpp
   │   └── useless.cpp
   ├── src
   │   ├── check.py
   │   ├── test_generator.py
   │   ├── tron.tex
   │   └── validator.cpp
   ├── statements
   │   ├── eng
   │   └── rus
   ├── tests
   └── visualizer
      ├── eng
      │   ├── visualizer-eng.css
      │   ├── visualizer-eng.html
      │   └── visualizer-eng.js
      └── rus
         ├── visualizer-rus.css
         ├── visualizer-rus.html
         └── visualizer-rus.js

   Guaranteed file paths:
   /taskid/statement.pdf
   /taskid/main.css
   /taskid/main.js
   /taskid/main.html

   Paths from problem.yaml:
   /taskid/change_log.txt
   /taskid/favicon.ico

Endpoints
^^^^^^^^^

There is only one endpoint available

GET /media/:longid/:filename
   .. table:: Parameters

      ============= ============================================================
      Parameter     Description
      ============= ============================================================
      ``:longid``   64 hex chars
      ``:filename`` complies to `^[a-zA-Z0-9_\-()\[\]{}!@#$%^&*:,.?]{3,}\.[a-z]{1,16}$ <https://regex101.com/r/O89x4V/1>`_
      ============= ============================================================

   .. table:: Return codes. See :ref:`error-response-label`

      ===== ====================================================================
      Code  Description
      ===== ====================================================================
      200   Request successful, file in the body
      301   This file is considered to be replaced by another
      401   User must log in before accessing this file
      403   user does not have sufficient permissions to access this file
      404   File does not exist or the user does not have sufficient permissions
      ===== ====================================================================

   Examples::

      GET /media/0bcee7d9d61e050c32682a527bcf721d0a05149dabf9bbca7e09fae6f1dd089b/main.c
      200 OK
      #include<stdio.h>
      ...

      GET /media/63c90b247a3c836d678d2a4a5a2678c0e9df2bd44675fd0c035c028984847b11/statement.pdf
      301 MOVED PERMANENTLY
      Location: https://ourhosting.com/media/805cb05bbe3102db8359564091bed769e0875aecc529787768663570cea75a14/statement.pdf

      GET /media/1b27cf60245964a7e5a7ce09030cc63d9909120e9d2391219e464469c6f2176a/answers.txt
      404 NOT FOUND
      {
         "error": "No file with this identifier"
      }
