Submission
**********

General information
===================

Source code
-----------

Submission is generally a source code, which users submit to AIForces. All source code must be included in one file.
You should use one of the supported programming languages (reference). Every submission is attached to the contest and the problem.

Access
------

Submission may be ``private``, ``protected`` or ``public``.


Private submissions are availiable only to its author.
It's outside the contest sandbox.

Protected submissions are played with in sandbox, but the source code is available only to its author.

Public submissions are opened for both challenges in sandbox and viewing the source code.

Names
-----

You can attach names to submissions to identify them faster.

Pretests
--------

When submission is made, its challenged with some solutions, created by the problemsetters, to check that your submission
works fine. Complete log of this challenges are available for debugging. If the problem didn't passed the pretest
(finished with non-OK verdict), it can't be used in tournaments and sandbox.

Endpoints
=========

[GET] /contests/:contest/submissions
------------------------------------
   Returns
      ``200 (OK)``

   Arguments
      .. table::

         ============= ================ ======================= ==============================
         Argument      Format           Default                 Description

         fields        list of strings  :ref:`submission-label` Fields, which will be retrieved.
                                        fields      
                                                                Must be a subset of :ref:`submission-label` fields
         filter        list of strings  Filtering is not used   If present, only submissions with given identifiers will be in the     
                                                                response.
         limit         integer          20                      Maximum number of recources, which will be returned.
         offset        integer          0                       Index of first resource, which should be returned
                                                                (used for pagination).
         sort          sort             -submitted_at           One of the :ref:`submission-label` object fields,
                                                                which should be used
                                                                for sorting the items. Order is **ascending**, to reverse
                                                                the order, use ``-`` at the begining of the string.
         ============= ================ ======================= ==============================
    
   .. Example
   ..    .. code-block:: bash

   ..       gg
   .. Response
   ..    gg


[POST] /contests/:contest/submissions
-------------------------------------
   Returns
      ID of the new submission and mapped pretest challenges.

   Arguments
      .. table::

         ============= ================ ======================= ==============================
         Argument      Format           Default                 Description
         name          string           "Submission {ID}"       Short name
         access        string           private                 Either ``private``, ``public`` and ``protected``.
         problem       string           No default              Problem literal, which solution is presented
         source        string           No default              Solution
         lang          string           No default              Identifier of the programming language.
                                                                Read the corresponding documentation
         ============= ================ ======================= ==============================

   .. Example
   ..    .. code-block:: bash

   ..       gg
   .. Response
   ..    gg


[GET] /contests/:contest/submissions/:submission
------------------------------------------------
   Returns
      :ref:`submission-label` object

   Arguments
      .. table::

         ============= ================ ======================= ==============================
         Argument      Format           Default                 Description
         fields        list of strings  :ref:`submission-label` Fields, which will be retrieved.
                                        fields      
                                                                Must be a subset of :ref:`contest-label` fields
         ============= ================ ======================= ==============================

   .. Example
   ..    .. code-block:: bash

   ..       gg
   .. Response
   ..    gg

[DELETE] /contests/:contest/submissions/:submission
---------------------------------------------------
   Deletes the submission, only for managers of the contest.

   .. warning:: Doesn't remove any dependencies.

   Returns
      ``200 (OK)``

   Arguments
      None

   Example
      .. code-block:: bash

         curl https://api.aiforces.com/v1/contests/my-contest/submissions/121 -X DELETE
   Response
      ``200 (OK)``
