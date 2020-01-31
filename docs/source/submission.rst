Submission
----------

[GET] /contests/:contest/submissions
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[POST] /contests/:contest/submissions
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[GET] /contests/:contest/submissions/:submission
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[PUT] /contests/:contest/submissions/:submission
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[PATCH] /contests/:contest/submissions/:submission
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[DELETE] /contests/:contest/submissions/:submission
	Deletes the submission, only for managers of the contest.

	.. warning:: Doesn't remove any dependencies.
	Example
		.. code-block:: bash

			curl https://api.aiforces.com/v1/contests/my-contest/submissions/121 -X DELETE

	Response