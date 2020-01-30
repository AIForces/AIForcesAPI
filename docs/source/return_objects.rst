Return objects
--------------

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

.. _score-label:

Score
^^^^^
When interpreted as an array, each item is itself an array of two elements:
a datetime code and the score at that point. Example::

   [
      [ "2018-11-13T20:20:39+00:00", 0 ],
      [ "2018-11-13T21:21:54+00:00", 10 ],
      [ "2018-11-14T13:12:21+00:00", 21 ]
   ]
