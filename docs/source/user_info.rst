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
   - current
   - everyone
   - moderator

   .. warning:: List to be expanded

realname
   User's disclosed name and is shared according to the user's privacy settings.
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
to appear. Contests have `contest-participant` and `contest-manager`
groups and so on for other entities.

Permissions
"""""""""""
A permission is represented as a union of users and groups thathave access to
this information. To avoid confusion, users are prefixed with ``u\`` and groups
with ``g\``.

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
   Each task has an owner group. Owners have the permission to edit source code
   directly. They also can set the access permission. Access permission lets
   that task be used in a contest. It also grants access to the source files
   and lets users fork that task.

Contests
   Each user can own, administrate, participate in and finish contests.
   Each contest has a ``-participant`` and a ``-manager`` groups, granting
   them access to different actions on the contest.

Submissions
   Each submission is identified by a user, contest and a task.
   The user who uploaded the solution is the author, and has access to the
   source code and logs that this submission produces.

Friends
   Self-explanatory. The user has to confirm the friend invite
   before the other person gets added to the friends list. Each user has their
   own ``-friend`` group.

.. _user-settings-label:

User settings
^^^^^^^^^^^^^

Coding settings
"""""""""""""""
Stores users preferred language and compiler options.
Also can save the file template for the in-browser editor.

Privacy settings
""""""""""""""""
By default, each field from the metadata can be either public or private.
Additionally, they can limit the ability of other people to add them into contests.


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
   owned_problems          bool List of all the tasks owned by the user
   friends                 bool Return the friends array
   ======================= ==== ================================================

GET PUT PATCH /users/me/settings
   Access to the account and privacy settings

GET PUT PATCH /users/me/templates?lang=*language*
   Change a coding template for a particular language
