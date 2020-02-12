Authentication
--------------

Basic auth handling will be done via `djoser <https://github.com/sunscrapers/djoser>`_
with `drf JWT <https://github.com/davesque/django-rest-framework-simplejwt>`_.
Djoser supports both in-app users and integration with social services.

User manipulation
^^^^^^^^^^^^^^^^^

`Standard endpoints implemented by djoser <https://djoser.readthedocs.io/en/latest/base_endpoints.html#base-endpoints>`_
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

- /users/ (POST = registration)
- /users/me/
- /users/confirm/
- /users/resend_activation/
- /users/set_password/
- /users/reset_password/
- /users/reset_password_confirm/
- /users/set_username/
- /users/reset_username/
- /users/reset_username_confirm/

They implement basic registration and account manipulation. They are dependent on the default `user objects <https://docs.djangoproject.com/en/3.0/topics/auth/default/#user-objects>`_ (`custom objects <https://docs.djangoproject.com/en/3.0/topics/auth/customizing/#extending-the-existing-user-model>`_) and `user managers <https://docs.djangoproject.com/en/3.0/topics/auth/customizing/#writing-a-manager-for-a-custom-user-model>`_

Custom endpoints
""""""""""""""""

- /users/me/settings
- /users/me/templates?lang=*language*

From :ref:`user-settings-label`

JWT
^^^
The JWT has to contain a list of groups for every user, so that it would be
easier for the backend to manage permissions. (See `custom serializers <https://github.com/davesque/django-rest-framework-simplejwt#customizing-token-claims>`_)

A response may have a ``X-Refresh-Token: 1`` header in order to prompt the
user application to update the token with the new groups.

`Djoser JWT endpoints <https://djoser.readthedocs.io/en/latest/jwt_endpoints.html#jwt-endpoints>`_
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

- /auth/jwt/create/
- /auth/jwt/refresh/
- /auth/jwt/verify/
