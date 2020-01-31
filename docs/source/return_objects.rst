Return objects
--------------

Contest
^^^^^^^
Represents general info about one competition.

.. csv-table::
   :header: "Field", "Format", "Description"

   id, integer, Contest ID.
   short_name, string, Contest unique short name.
   name, string, Name of the contest. May be localized.
   hidden, boolean, "If true, contest is not visible for public." 
   description, string, Description of the contest. May be localized.
   difficulty, integer from 1 to 5, Estimated difficulty. 5 is the most difficult.
   start_time, integer, Start of the contest (ISO 8601 format).
   duration, integer, Duration of contest in seconds.
   status, string, "Describes status of the contest: ""before"", ""in_progress"", ""pending_results"", ""finished"""
   has_sandbox, boolean, "If true, contest has a sandbox and corresponding API can be used."
   frozen_after, integer, "May be absent. If contest has sandbox, it will be turned off after number of seconds, set in this variable."

Example
   
    .. code-block:: js

        {
            "id": 105,
            "short_name": "tron_contest",
            "name": "First awesome AIForces contest.",
            "hidden": false,
            "description": "Lorem ipsum dolor sit amet.",
            "difficulty": 1,
            "start_time": "2019-01-24T23:02:40+00:00",
            "duration": 86400,
            "status": "finished",
            "has_sandbox": true,
            "frozen_after": 82800
        }

Tournament
^^^^^^^^^^

Represents general info about one tournament. (contest may include several intermediate tournament and one final tournament).

.. csv-table::
   :header: "Field", "Format", "Description"
   :widths: 30, 30, 20

   id, integer, Tournament ID
   name, string, Name of the tournament. May be localized.
   hidden, boolean, "If true, tournament is not visible for public."
   start_time, integer, Start of the tournament (ISO 8601 format).
   tournament_type, string, One of the built-in tournament types. Check the corresponding documentation.
   status, string, "Describes status of the tournament: ""before"", ""in_progress"", ""pending_results"", ""finished""" 

Example
   
.. code-block:: js

    {
        "id": 123,
        "name": "first blood",
        "hidden": false,
        "start_time" = "2019-01-24T23:02:40+00:00",
        "tournament_type": "swiss",
        "status": "in_progress"
    }

Submission
^^^^^^^^^^

Represnts one code submission.

.. csv-table::
   :header: "Field", "Format", "Description"

   id, integer, "Submission ID"
   user, string, "Username of the person, who made the submission"
   contest, string, "Contest the submission is attached to."
   problem, string, "Problem, which solution is presented."
   name, string, "Short name (may be given by the user to identify submissions in a quick way)"
   source, string, "Source code of the submission."
   lang, string, "Identifier of the programming language. Read the corresponding documentation."

Example
   
.. code-block:: js

   {
      "id": 278,
      "user": "patrick",
      "contest": "tron_test_contest",
      "problem": "tron",
      "name": "tron_megasovler2000",
      "source": "print(\"Hello world!\")",
      "lang": "pypy3"
   }