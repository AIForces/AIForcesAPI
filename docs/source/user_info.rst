User info
---------

.. note:: This section might be moved into a more general article on the User model

This chapter concerns itself about the information that will be associated with any particular user in the application. It may not exactly be stored as a column in the DB table but in one way or the other it *is* correlated to a user.

Properties
^^^^^^^^^^
username
   A unique user identifier. Must be ``^[a-zA-Z0-9_\-=+.,!]{4,20}$``

   A list of reserved usernames includes
    - admin
    - administrator
    - moderator
    - current

   .. warning:: List to be expanded

realname
   User's disclosed name and is shared according to the user's privacy settings. Is subject to unicode sanitization.

displayname
   The name to be used for display. Is also unicode-sanitized.

email
   Email is disclosed only in accordance with the user's privacy settings. May be used as the primary login key.

role
   Global permission role for this user. Either `Administrator` or `User`.

metadata
   Aggregate property of non-crucial information about the user

    - Country
    - City
    - Organisation
    - Gender
    - Age
    - Bio
    - Profile picture

   No field is required and the privacy of each field is controlled independently in the privacy settings.

score
   Aggregate property of the current score, parts required to compute it, and score history.

`settings` and `privacy-settings`
   *See user-settings*

Relations
^^^^^^^^^
Tasks
   Each task is owned by a particular user - its author. The task may be private, protected or public. Private tasks can only be used in private contests by the user themself. Protected tasks can be used by anyone in any contest, but the task source is only available to the author. Public tasks expose the original source files and can be forked by other users who may wish to edit them.

Contests
   Each user can own, administrate, participate in and finish contests (owners automatically administrate, and they are required to participate in order to finish a contest). So thus there are two distinct sets of contests: responsibilities (ownerships and administrations) and participations (planned contests, current contests, results and doreshka).

Submissions
   Each submission is identified by a user, contest and a task. The user who uploaded the solution

Friends
   Self-explanatory. The user has to confirm the friend invite before the other person gets added to the friends list.

Endpoints
^^^^^^^^^
As per Djoser, there are some basic endpoints exposed. By default, only `/users/me` returns data about a particular user. 

GET /users/:username
   Returns the public information about that user

GET /users/me
   Returns all information about the authenticated user.

.. table:: Query variables

   ======================= ==== =========================
   Variable                Type Definition
   ======================= ==== =========================
   full_score              bool Return the score as a history array (See :ref:`score-label`)
   participating_contests  bool Return the participating contests array
   administrating_contests bool Return the administrating contests array
   friends                 bool Return the friends array
   ======================= ==== =========================
