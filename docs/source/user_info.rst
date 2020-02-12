User info
---------

.. note:: This section might be moved into a more general article on the User model

Properties
^^^^^^^^^^
username
   A unique user identifier. Must be `^[a-zA-Z0-9_\-=+.,!]{4,20}$ <https://regex101.com/r/OsZJss/1>`_

   A list of reserved usernames includes
    - admin
    - administrator
    - moderator
    - current

   .. warning:: List to be expanded

realname
   User's disclosed name and is shared according tothe user's privacy settings.
   Is subject to unicode sanitization.

displayname
   The name to be used for display. Is also unicode-sanitized.

email
   Email is disclosed only in accordance with the user's privacy settings.
   May be used as the primary login key.

groups
   A list of all groups this user is a part of. Does not include a corresponding
   ``u\`` group. See :ref:`groups-label`

metadata
   Aggregate property of non-crucial information about the user

    - Country
    - City
    - Organisation
    - Gender
    - Age
    - Bio
    - Profile picture

   No field is required and the privacy of each field
   is controlled independently in the privacy settings.

score
   Aggregate property of the current score,
   parts required to compute it, and score history.
   See :ref:`achievement-label`

`settings` and `privacy-settings`
   See :ref:`user-settings-label`

.. _groups-label:

Groups
^^^^^^
Permissions and relations are done through groups. Each object has some groups
attached to it. For example, a user `coolguy` causes a group `coolguy-friend`
to appear. Contests have `contest-participant` and `contest-administrator`
groups and so on for other entities.

Permissions
"""""""""""
Both the username and the group list are encoded in the JWT token so that
services could determine permissions without accessing the database for the
user object. A permission is determined as a union of users and groups that
have access to this information. To avoid confusion, users are prefixed with
``u\`` and groups with ``g\``.

For example, a file may have the following permissions::

   [ "u\coolguy", "g\coolguy-friend", "g\coolcontest-participant" ]

Any user who matches at least one constraint is granted access to that content.

There is a list of special groups not tied to any particular object.

g\\everyone
   Makes the described object public. An empty permission array is considered
   to be identical to `g\everyone`.

g\\administrator
   If held by a user, grants access to everything regardless of the permissions.

Relations
^^^^^^^^^
Tasks
   Each task is owned by a particular user - its author.
   They can set the use and read permissions. Use permission lets that task be
   used in a contest. Read permissions grants access to the source files and
   lets users fork that task.

Contests
   Each user can own, administrate, participate in and finish contests.
   Each contest has a ``-participant`` and a ``-administrator`` groups, granting
   them access to different actions on the contest.

Submissions
   Each submission is identified by a user, contest and a task.
   The user who uploaded the solution is the author, and has access to the
   source code and logs that this submission produces.

Friends
   Self-explanatory. The user has to confirm the friend invite
   before the other person gets added to the friends list. Each user has their
   own ``-friend`` group.

Endpoints
^^^^^^^^^
As per Djoser, there are some basic endpoints exposed.
By default, only `/users/me` returns data about a particular user.

GET /users/:username
   Provides the public information about that user

GET /users/me
   Provides unlimited information about the currently authenticated user.

Returns: :ref:`user-label`

.. table:: Query variables

   ======================= ==== ================================================
   Variable                Type Definition
   ======================= ==== ================================================
   full_score              bool Return the full achievement object (See :ref:`achievement-label`)
   participating_contests  bool Return the participating contests array
   administrating_contests bool Return the administrating contests array
   friends                 bool Return the friends array
   ======================= ==== ================================================
