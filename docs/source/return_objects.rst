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
   start_time, integer, Start of the contest (UNIX format).
   duration, integer, Duration of contest in seconds.
   status, string, "Describes status of the contest: ""before"", ""in_progress"", ""pending_results"", ""finished"""
   has_sandbox, boolean, "If true, contest has a sandbox and corresponding API can be used."
   frozen_time, integer, "May be absent. If contest has sandbox, it will be turned off at frozen_time (if set). UNIX format"
   
Tournament
^^^^^^^^^^

Represents general info about one tournament. (contest may include several intermediate tournament and one final tournament).

.. csv-table::
   :header: "Field", "Format", "Description"

   id, integer, Tournament ID
   name, string, Name of the tournament. May be localized.
   hidden, boolean, "If true, tournament is not visible for public."
   start_time, integer, Start of the tournament (UNIX format).
   tournament_type, string, One of the built-in tournament types. Check the corresponding documentation.
   status, string, "Describes status of the tournament: ""before"", ""in_progress"", ""pending_results"", ""finished""" 

.. _error-response-label:

Errors
^^^^^^
For every return code >=400 it is guaranteed that the response will contain an
``error`` field explaining the problem.

.. code:: json

   404 NOT FOUND
   {
      "error": "No file with this identifier"
   }
