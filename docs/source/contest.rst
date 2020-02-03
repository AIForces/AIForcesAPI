Contest
*******

General information
===================

Official contests
-----------------

Contest is the main event, happening in AIForces. This is a competition, which consist of several
problems and usually lasts for number of days.
If the contest is official (approved by AIForces admins), problems **must not** being used or known before.
Also, problems should be kept in secret. However, every person can create contest for his private purposes or for 
educational purposes.

Incompetetive contests
----------------------

Some contests may be created for research or educational purposes and the participants are not
going to compete with each other. They are called incompetetive and all submisssions made in the contest
are ``public``.

Infinite contest and Problem archive
------------------------------------

Contest may be infinite. They are usually made for practice. `Problem archive` is a special kind of contest,
where all public problems are included for fun and practice.

Hidden contests
---------------

Contest are usually hidden when they are not ready for production or time is not certain.

Sandbox
-------

Users can make their submissions ``protected`` (they are ``private`` by default).
From this point, they will be available for challenge in contest sandbox.
Contest sandbox is a place where people learn game mechanics and gain new ideas by creating challenges
between any ``protected`` and ``public`` submissions. Sandbox is closed as soon as contest is `frozen`.

Tournaments
-----------

Intermediate tournaments are generally used to motivate participants to upgrade their solutions. They produce standings,
which can be used as intermediate results of the contest. They **do not** affect the final score.

Final tournaments are used to determine the final results and the winner of the contest. After the tournaments are completed,
final standings table will be generated and published as soon as contest managers will review it (cheating protection also happens in this phase).


Rated contests
--------------

If the contest is ``rated`` (only official contest can be rated), final standings also has rating recalculation. 
User's rating are changed as soon as contest managers have reviewed and checked the final standings.


Contest API provides you with all the info availiable about the past, current and upcoming contests. It can be used to submit solutions, use sandbox, manage upcoming events and many more.

Endpoints
=========

[GET] /contests
---------------
   Retrieve general information of the contests. 

   Returns
      list of :ref:`contest-label` objects.
   Arguments
      .. table::

         ============= ================ ======================= ==============================
         Argument      Format           Default                 Description

         show_hidden   boolean          false                   If set to true by non-admin, Forbidden error is returned.
                                                                Admins can view all the contests.
         fields        list of strings  :ref:`contest-label`    Fields, which will be retrieved.
                                        fields      
                                                                Must be a subset of :ref:`contest-label` fields
         filter        list of strings  Filtering is not used   If present, only contests with given identifiers will be in the     
                                                                response.
         limit         integer          20                      Maximum number of recources, which will be returned.
         offset        integer          0                       Index of first resource, which should be returned
                                                                (used for pagination).
         sort          sort             -start_time             One of the :ref:`contest-label` object fields, which should be used
                                                                for sorting the items. Order is **ascending**, to reverse
                                                                the order, use ``-`` at the begining of the string.
         ============= ================ ======================= ==============================

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
         .. code-block:: json

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
-----------------------------------
   Retrieve general information about given contest.

   Returns
      Contest object

   Arguments
      .. table::
            
         ============= ================ ======================== ==============================
         Argument      Format           Default                  Description

         fields        list of strings  All :ref:`contest-label` Fields, which will be retrieved.
                                        fields                   Must be a subset of :ref:`contest-label` fields
         ============= ================ ======================== ==============================

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
         .. code-block:: json

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
-----------------------------------
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
                -d \
                '{ \
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

[POST] /contests
----------------
   Creates new problem. If short-name is not given, it will be automatically generated using Display name and returned in Response.

[PATCH] /contests/:contest-short-name
-------------------------------------
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
                -d \
                '{ \
                    "name": "First awesome AIForces contest.", \
                    "frozen_after": 82800 \
                }'

      Response
         ``200 OK``

[DELETE] /contests/:contest-short-name
--------------------------------------
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
--------------------------------
   Retrieve results table based on the final tournaments.

   Return
      list of Achievement objects.

   Arguments 
      .. table::
            
         ============== ================ ============================ ==============================
         Argument       Format           Default                      Description

         fields.        list of strings  All :ref:`achievement-label` Fields, which will be retrieved. 
                                         fields                       Must be a subset of :ref:`achievement-label` object fields.
         filter         list of strings  Filtering is not used        If present, only contests with given identifiers
                                                                      will be in the response.
         filter_friends boolean          false                        Exclude users, who are not your friends.
         limit          integer          20                           Maximum number of resources, which will be returned.
         offset         integer          0                            Index of first resource, which should be returned (used for
                                                                      pagination).
         sort           string           place                        One of the :ref:`achievement-label` fields, which should
                                                                      be used for sorting the items. Order is **ascending**,
                                                                      to reverse the order, use ``-`` at the begining of
                                                                      the string. 
         ============== ================ ============================ ==============================

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
            .. code-block:: json

               [
                   {
                       "user": "lifetime_winner",
                       "place": 1
                       "rating_before": 1500,
                       "rating_after": 1543,
                       "achieved_at": "2019-01-24T23:02:40+00:00",
                   },

                   {
                       "user": "lifetime_loser",
                       "place": 2,
                       "rating_before": 1500,
                       "rating_after": 1478,
                       "achieved_at": "2019-03-24T23:02:40+00:00",
                   }
               ]

[GET] /contests/:contest/participants
-------------------------------------
   Works same way as ``[GET] /users``, but returns users registered for the contest.

[PATCH] /contests/:contest/participants
---------------------------------------
   Manage contest's participants

[PATCH] /contests/:contest/register
---------------------------------------
   Add yourself to participants, if registration is open.