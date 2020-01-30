.. _user-settings-label:

User settings
-------------

Coding settings
^^^^^^^^^^^^^^^
Stores users preferred language and compiler options.
Also can save the file template for the in-browser editor.

Privacy settings
^^^^^^^^^^^^^^^^
By default, each field from the metadata can be either public or private.
Additionally, they can limit the ability of other people to add them into contests.

Endpoints
^^^^^^^^^
GET PUT PATCH /users/me/settings
   Access to the account and privacy settings

GET PUT PATCH /users/me/templates?lang=*language*
   Change a coding template for a particular language
