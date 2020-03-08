Debugger
********

General information
===================

Debugger is very similar to :ref:`sandbox-label`, but used for
creating private challenges between one user's submissions. Later, its functionality will
be expanded, so it's separated. 

Endpoints
=========

[GET] /contests/:contest/debugger/
----------------------------------
Will be developed by the ChallengeAPI assignee. Simple GET Challenges method, returns all your previous debugger
runs. Features like pagination, partial response, filters included.

[POST] /contests/:contest/debugger/
-----------------------------------
Will be developed by the ChallengeAPI assignee. Simple POST Challenges method. Checks that challenge is
allowed (between current user's submissions).