Authentication
--------------


Basic auth handling will be done via `djoser <https://github.com/sunscrapers/djoser>`_ with `drf JWT <https://github.com/davesque/django-rest-framework-simplejwt>`_. Djoser supports both in-app users and integration with social services.

`Standard enpoints implemented by djoser <https://djoser.readthedocs.io/en/latest/base_endpoints.html#base-endpoints>`_
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

 - /users/
   POST = registration
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

`Djoser JWT endpoints <https://djoser.readthedocs.io/en/latest/jwt_endpoints.html#jwt-endpoints>`_
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

 - /jwt/create/
 - /jwt/refresh/
 - /jwt/verify/
