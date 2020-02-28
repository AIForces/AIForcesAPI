Tournament
**********

General information
===================

Endpoints
=========

[GET] /contests/:contest/tournaments
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

[POST] /contests/:contest/tournaments/
--------------------------------------
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

[PATCH] /contests/:contest/confirm
-----------------------------------
   Publishes results of the currrent tournament.

[PATCH] /contests/:contest/tournaments/:tournament
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

[DELETE] /contests/:contest/tournaments/:tournament
   Deletes the tournament.
   
   .. warning:: Doesn't remove any dependencies.

   Example
      gg

    