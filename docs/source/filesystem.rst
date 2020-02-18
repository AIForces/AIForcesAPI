.. _filesystem-label:

File System
***********

Folder structure
================
Since almost every file is visible to the content delivery service, they should
be structured in folders in such a way that there would be logical,
human-understandable separation. Firstly there is the SMB server identifier.
Because all servers have the same internal structure, it only impacts sharding.
Next are the big categories: user-media, tasks, submissions, user logs
and the judging sandbox. Out of those, only the judging sandbox is not exposed
via the Media API (See :ref:`media-api-label`)

User media
----------
In the ``user-media`` folder, there are broad categories like profile-pictures,
posts and so on. In each of them, each file is bound in its own folder with the
same name as its unique identifier. Example::

   /smb1/user-media/profile-picture/12e90b8e74f20fc0a7274cff9fcbae14592db12292757f1ea0d7503d30799fd2/cat.jpg

Tasks
-----
In the ``tasks`` folder, each task is contained in a folder, named as
``taskshortname-longidentifier``. There are several files in each folder.
Example::

   /smb3/tasks/Tron4000-3ecf001753640fa58a06d5515fa610388a4f1722647d5f9f8abe76e4ed8a61f9/statements/eng/statement-eng.pdf
   /smb3/tasks/Tron4000-3ecf001753640fa58a06d5515fa610388a4f1722647d5f9f8abe76e4ed8a61f9/public/data.csv
   /smb3/tasks/Tron4000-3ecf001753640fa58a06d5515fa610388a4f1722647d5f9f8abe76e4ed8a61f9/public/change_log.txt

Submissions
-----------
In the ``submissions folder``, each submission is contained in a folder named
as ``contestshortname-taskshortname-username-longidentifier``. Example::

   /smb2/submissions/tron4eva-tronagain-whoisthis-2be23c585f15e5fd3279d0663036dd9f6e634f4225ef326fc83fb874dbb81a0f/main.cpp

User logs
---------
There are many different types of user logs: task compilation logs, checker
logs, invocation logs and more. For each type there is a separate subfolder
where the logs are stored along with their unique long id.
Example::

   /smb5/user_logs/invocation_logs/dbff529b4154cabef35d4239dff6b2a2832d8b55a58a850cbacb1f375458775d/log1
   /smb2/user_logs/checker_logs/3c3eccdbd697d48ff412690d65fd4b722a4f8bee55d34763f552d2423cb0013c/error

Since all the inner folders have the unique identifier in their name, they
are guaranteed to be unique.
