Problem
*******

Endpoints
=========

[GET] /problems
---------------

    Retrieve general information of the problems.
    
    Returns
        list of :ref:`problem-label` objects.
    Arguments
        .. table::

            ============= ================ ======================= ==============================
            Argument      Format           Default                 Description

            show_private  boolean          false                   If set to true by non-admin, Forbidden error is returned.
                                                                   Admins can view all the problems.
            fields        list of strings  All fields              Fields, which will be retrieved.
                                                                   Must be a subset of :ref:`problem-label` fields
            filter        list of strings  Filtering is not used   If present, only problems with given identifiers will be in the     
                                                                   response.
            limit         integer          20                      Maximum number of recources, which will be returned.
            offset        integer          0                       Index of first resource, which should be returned
                                                                   (used for pagination).
            sort          sort             -created_at             One of the :ref:`problem-label` fields, which should be used
                                                                   for sorting the items. Order is **ascending**, to reverse
                                                                   the order, use ``-`` at the begining of the string.             
            ============= ================ ======================= ==============================
    Example
        Request
            .. code-block:: bash

                curl https://api.aiforces.com/v1/problems \
                    -X GET \
                    -G \
                    -d show_private=false \
                    -d fields=name \
                    -d fields=description \
        Response
            .. code-block:: json

                [
                    {
                        "name": "go",
                        "description": "Abstract strategy board game for two players, in which the aim is to surround more territory than the opponent"
                    },

                    {
                        "name": "chess",
                        "description": "Classical indian game. Played on a checkered board with 64 squares arranged in an 8×8 grid."
                    }
                ]

[GET] /problems/:problem-short-name
-----------------------------------

    Retrieve general information about given problem.

    Returns
        :ref:`problem-label` object

    Arguments
        .. table::
            
            ============= ================ ======================== ==============================
            Argument      Format           Default                  Description

            fields        list of strings  All :ref:`problem-label` fields  Fields, which will be retrieved.
                                                                    Must be a subset of :ref:`problem-label` fields
            ============= ================ ======================== ==============================

    Example
        Request
            .. code-block:: bash

                curl https://api.aiforces.com/v1/problems/tron \
                    -X GET \
                    -G \ 
                    -d fields=id \
                    -d fields=name \
                    -d fields=access \

        Response

            .. code-block:: json

                {
                    "id": 23,
                    "name": "Tron",
                    "access": "Public"
                }

[POST] /problems
----------------
    Creates a problem. If short-name is not given, it will be automatically generated using Display name and returned in Response.

[PUT] /problems/:problem-short-name
-----------------------------------
    Create problem.

[PATCH] /problems/:problem-short-name
-------------------------------------
    Changes problem's settings.

[DELETE] /problems/:problem-short-name
--------------------------------------
    Deletes the problem.

[GET] /problems/:problem-short-name/git
---------------------------------------

    Retrieve info about problem git configuration.

    Returns
        :ref:`git-info-label` object, describing git settings for the problem.
    Arguments
        .. table::

            ============= ================ ======================= ==============================
            Argument      Format           Default                 Description

            fields        list of strings  :ref:`git-info-label`   Fields, which will be retrieved.
                                           fields                  Must be a subset of :ref:`git-info-label` fields           
            ============= ================ ======================= ==============================
    Example
        Request
            .. code-block:: bash

                curl https://api.aiforces.com/v1/problems/tron/git \
                    -X GET \
                    -G \ 
                    -d fields=branch \
                    -d fields=commit \
        Response
            .. code-block:: json

                {
                    "branch": "master",
                    "commit": {
                        "hash": "2872f3cbf85bcb96196f6901d56df8d80b337c58",
                        "name": "Refactoring checker."
                    }
                }

[PATCH] /problems/:problem-short-name/git
-----------------------------------------
    
    Changes git settings for the problem.

[POST] /problems/:problem-short-name/git/webhooks
-------------------------------------------------

    Endpoint for receiving git webhooks about the problem's repository.