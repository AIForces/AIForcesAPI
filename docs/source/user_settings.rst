.. _user-settings-label:

User settings
-------------

Coding settings
^^^^^^^^^^^^^^^
Stores a starting template and editor configuration for each of the language
presets (See :ref:`languages-label`). It is used for the built-in editor and
other tools.

Privacy settings
^^^^^^^^^^^^^^^^
The privacy settings control the access to metadata and limit other user's
actions upon them like adding them into contests. All fields are controlled by
the groups and permissions (see :ref:`groups-label`).

Endpoints
^^^^^^^^^
GET PUT PATCH /users/me/settings
   Access to the account and privacy settings

GET PUT PATCH /users/me/templates?lang=*language*
   Change a coding template for a particular language
