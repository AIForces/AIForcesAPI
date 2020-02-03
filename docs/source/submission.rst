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
             
         ============= ================ ======================= ==============================
    
   Example
      .. code-block:: bash

         gg
   Response
      gg


[POST] /contests/:contest/submissions
-------------------------------------
   Returns
      ``200 (OK)``

   Arguments
      .. table::

         ============= ================ ======================= ==============================
         Argument      Format           Default                 Description
             
         ============= ================ ======================= ==============================

   Example
      .. code-block:: bash

         gg
   Response
      gg


[GET] /contests/:contest/submissions/:submission
------------------------------------------------
   Returns
      ``200 (OK)``

   Arguments
      .. table::

         ============= ================ ======================= ==============================
         Argument      Format           Default                 Description
             
         ============= ================ ======================= ==============================

   Example
      .. code-block:: bash

         gg
   Response
      gg


[PUT] /contests/:contest/submissions/:submission
------------------------------------------------
   Returns
      ``200 (OK)``

   Arguments
      .. table::

         ============= ================ ======================= ==============================
         Argument      Format           Default                 Description
             
         ============= ================ ======================= ==============================

   Example
      .. code-block:: bash

         gg
   Response
      gg


[PATCH] /contests/:contest/submissions/:submission
--------------------------------------------------
   Returns
      ``200 (OK)``

   Arguments
      .. table::

         ============= ================ ======================= ==============================
         Argument      Format           Default                 Description
             
         ============= ================ ======================= ==============================

   Example
      .. code-block:: bash

         gg
   Response
      gg

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
      gg
