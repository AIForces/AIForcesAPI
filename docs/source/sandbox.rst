.. _sandbox-label:

Sandbox
*******

General information
===================

Some contests have a sandbox. It's a place, where participants learn
game mechanics and gain new ideas by creating challenges between submissions.
The submission appears in the sandbox as soon as it is made ``protected`` or ``public``.


Endpoints
=========

[GET] /contests/:contest/sandbox/
---------------------------------
Will be developed by the ChallengeAPI assignee. Simple GET Challenges method, returns all sandbox challenges. Can be filtered (show with me, show created by me). Features like pagination, partial response, filters included.

[POST] /contests/:contest/sandbox/
----------------------------------
Will be developed by the ChallengeAPI assignee. Simple POST Challenges method. Checks that challenge is
allowed.