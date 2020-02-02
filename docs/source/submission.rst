Submission
**********

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
