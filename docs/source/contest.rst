Contest
-------

Contest API provides you with all the info availiable about the past, current and upcoming contests. It can be used to submit solutions and manage upcoming events.

[GET] /contests
    Retrieve general information of the contests. 

    Returns
        list of ``Contest`` objects.
    Arguments 
        .. csv-table::
            :header: "Argument", "Format", "Default", "Description"

            show_hidden, boolean, false, "If set to true by non-admin, Forbidden error is returned. Admins can view all the contests."
            fields, "list of strings", "All ``Contest`` object fields", "Fields, which will be retrieved. Must be a subset of ``Contest`` object fields"
            filter, "list of strings", "Filtering is not used", "If present, only contests with given identifiers will be in the response."
            limit, integer, 20, "Maximum number of recources, which will be returned."
            offset, integer, 0, "Index of first resource, which should be returned (used for pagination)."
            sort, string, "-start_time", "One of the ``Contest`` object fields, which should be used for sorting the items. Order is **ascending**, to reverse the order, use ``-`` at the begining of the string." 

    Example
        Request
            .. code-block:: bash

                curl https://api.aiforces.com/v1/contests/ \
                    -X GET \
                    -G \
                    -d show_hidden=false \
                    -d fields=id \
                    -d fields=name \
                    -d limit=2 \
                    -d sort=-start_time \
        Response
            .. code-block:: js

                [
                    {
                        "id": 0,
                        "name": "New contest."
                    },

                    {
                        "id": 1,
                        "name": "Old contest."
                    }
                ]

[GET] /contests/:contest-short-name
    Retrieve general information about given contest.

    Returns
        Contest object

    Arguments
        .. csv-table::
            :header: "Argument", "Format", "Default", "Description"

            fields, "list of strings", "All ``Contest`` object fields", "Fields, which will be retrieved. Must be a subset of ``Contest`` object fields"

    Example
        Request
            .. code-block:: bash

                curl https://api.aiforces.com/v1/contests/tron_contest \
                    -X GET \
                    -G \ 
                    -d fields=id \
                    -d fields=decription \
                    -d fields=authors \

        Response


            .. code-block:: js

                {
                    "id": 105,
                    "description": "Lorem ipsum dolor sit amet.",
                    "authors": {
                        "testers": [
                            "user_tester_1",
                            "user_tester_2",
                        ],
                        "front-enders": [
                            "front-end-god"
                        ],
                        "problemsetters": [
                            "icpc-person"
                        ],
                        "coordinators": [
                            "300iq"
                        ]
                    }
                }








[PUT] /contests/:contest-short-name
    Creates new contest, managed by the current user.
    If such contest already exists and managed by the current user, replaces it with the new one.

    Returns
        If the contest was successfully replaced, ``200 (OK)``.
        
        If the contest was successfully created, ``201 (Created)``.
    Arguments
        Send a Contest object with all the neccessary fields.
        You may add optional fields. Exclude ``id`` and ``status`` fields.
    
    Example

        Request
            .. code-block:: bash

                curl https://api.aiforces.com/v1/contests/tron_contest \
                    -X PUT \
                    -H "Content-Type: application/json" \
                    -d '{ \
                        "name": "First awesome AIForces contest.", \
                        "hidden": false, \
                        "description": "Lorem ipsum dolor sit amet.", \
                        "difficulty": 1, \
                        "start_time": "2019-01-24T23:02:40+00:00", \
                        "duration": 86400, \
                        "has_sandbox": true, \
                        "frozen_after": 82800 \
                    }'

        Response
            ``200 (OK)``

[PATCH] /contests/:contest-short-name
    Change general contest settings.

    Returns
        ``200 OK``

    Arguments 
        Subset of fields of Contest object(excluding ``id`` and ``status``), which needs to be changed.

    Example
        Request
            .. code-block:: bash

                curl https://api.aiforces.com/v1/contests/tron_contest \
                    -X PATCH \
                    -H "Content-Type: application/json" \
                    -d '{ \
                        "name": "First awesome AIForces contest.", \
                        "frozen_after": 82800 \
                    }'

        Response
            ``200 OK``

[DELETE] /contests/:contest-short-name
    Deletes the contest, which must be managed by the current user.

    Returns
        ``200 OK``

    Arguments
        None

    Example
        Request
            .. code-block:: bash

                curl https://api.aiforces.com/v1/contests/tron_contest -X DELETE
        Response
            ``200 OK``


[GET] /contests/:contest/results
    Retrieve results table based on the final tournaments.

    Return
        list of Achievement objects.

    Arguments 

    .. csv-table::
        :header: "Argument", "Format", "Default", "Description"

        fields, "list of strings", "All ``Achievement`` object fields", "Fields, which will be retrieved. Must be a subset of ``Achievement`` object fields"
        filter, "list of strings", "Filtering is not used", "If present, only contests with given identifiers will be in the response."
        filter_friends, "boolean", false, "Exclude users, who are not your friends."
        limit, integer, 20, "Maximum number of resources, which will be returned."
        offset, integer, 0, "Index of first resource, which should be returned (used for pagination)."
        sort, string, "place", "One of the ``Achievement`` object fields, which should be used for sorting the items. Order is **ascending**, to reverse the order, use ``-`` at the begining of the string." 

    Example
        Request
            .. code-block:: bash

                curl https://api.aiforces.com/v1/contests/:contest/results \
                    -X GET \
                    -G \
                    -d fields=user \
                    -d fields=place \
                    -d fields=rating_before \
                    -d fields=rating_after \
                    -d limit=2 \
        Response
            .. code-block:: js

                [
                    {
                        "user": "lifetime_winner",
                        "place": 1
                        "rating_before": 1500,
                        "rating_after": 1543,
                        "achieved_at" = "2019-01-24T23:02:40+00:00",
                    },

                    {
                        "user": "lifetime_loser",
                        "place": 2,
                        "rating_before": 1500,
                        "rating_after": 1478,
                        "achieved_at" = "2019-03-24T23:02:40+00:00",
                    }
                ]

[GET] /contests/:contest/participants
    Works same way as ``[GET] /users``, but returns users registered for the contest.
