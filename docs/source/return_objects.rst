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
   
.. _user-label:

User
^^^^
.. table:: User object

   ======================= ================== =================================================
   Field                   Format             Description
   ======================= ================== =================================================
   username                string             Unique username
   displayname             string             Display name
   role                    string             User role
   score                   integer/array*     | *integer* - a single score
                                              | *array* - score history array (See :ref:`score-label`)
   profile                 object             | Metadata fields.
                                              | Their quantity depends on the privacy settings of the user.
                                              | This field also includes the email and the realname
   participating_contests  array[contest_id]* List of all contests the user has participated in
   administrating_contests array[contest_id]* List of all contests the user has priviledged access to
   tasks                   array[task_id]*    List of all the tasks owned by the user
   friends                 array[username]*   List of all the friends the user has
   ======================= ================== =================================================

Rows marked with * are not sent by default, and instead should be requested by the caller.

Examples
""""""""
Simple object:

.. code:: json

   {
      "username": "coolguy",
      "displayname": "The coolest guy ever 笑",
      "role": "User",
      "score": 1336,
      "profile": {
         "profile-picture": "https://ourhosting.lol/media/1234beef/coolguy.png"
      }
   }

Complex object:

.. code:: json

   {
      "username": "SuperBoi",
      "displayname": "nеvеr gоnnа givе уоu uр",
      "role": "User",
      "score": [
         [ "2018-11-13T20:20:39+00:00", 0 ],
         [ "2018-12-21T12:46:34+00:00", 137 ],
         [ "2019-01-07T18:59:19+00:00", 235 ],
         [ "2019-01-24T23:02:40+00:00", 331 ]
      ],
      "profile": {
         "age": 11,
         "bio": "I love programming",
         "city": "Dublin",
         "country": "Ireland",
         "email": "bestboi09@gmail.cm",
         "gender": "Male",
         "organisation": "Junior High",
         "profile-picture": "https://ourhosting.lol/media/abcdead1/hot_girls.jpg"
      },
      "participating_contests": [ "entry", "easy", "tron1000" ],
      "administrating_contests": [ "my_playground" ],
      "friends": [ "PiccoloX" ]
   }

.. _score-label:

Score
^^^^^
When interpreted as an array, each item is itself an array of two elements:
a datetime code and the score at that point. Example:

.. code:: json

   [
      [ "2018-11-13T20:20:39+00:00", 0 ],
      [ "2018-11-13T21:21:54+00:00", 10 ],
      [ "2018-11-14T13:12:21+00:00", 21 ]
   ]
