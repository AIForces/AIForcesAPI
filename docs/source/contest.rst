Contest
-------

Contest API provides you with all the info availiable about the past, current and upcoming contests. It can be used to submit solutions and manage upcoming events.

[GET] /contests
	Retrieve general information of the contests. 

	Returns
		list of ``Contest`` objects.
	Arguments 
		.. csv-table::
			:header: "Argument", "Format", "Default", "Description"

			show_hidden, boolean, false, "If set to true by non-admin, Forbidden error is returned. Admins can view all the contests."
			fields, list of strings, "All ``Contest`` object fields", "Fields, which will be retrieved. Must be a subset of ``Contest`` object fields"
			limit, integer, 20, Maximum number of recources, which will be returned.
			offset, integer, 0, Index of first resource, which should be returned (used for pagination).
			sort, string, "-start_time", One of the ``Contest`` object fields, which should be used for sorting the items. Order is **ascending**, to reverse the order, use ``-`` at the begining of the string. 

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
			.. code-block:: js

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

[POST] /contests
	Creates new contest, managed by the current user.

	- Returns error or new contest's id in the case of success.
	- Arguments
	
	Send a Contest object with all the neccessary fields. You may add optional fields. Exclude ``id`` and ``status`` fields.
	
	- Example

	Request
		.. code-block:: bash

			curl https://api.aiforces.com/v1/contests/ \
				-X POST \
				-H "Content-Type: application/json" \
				-d '{ \
				    "short_name": "tron_contest", \
				    "name": "First awesome AIForces contest.", \
				    "hidden": false, \
				    "description": "Lorem ipsum dolor sit amet.", \
				    "difficulty": 1, \
				    "start_time": "2019-01-24T23:02:40+00:00", \
				    "duration": 86400, \
				    "has_sandbox": true, \
				    "frozen_time": 82800 \
				}'

	Success Response
		.. code-block:: js

			{
				"id": 257
			}

	Error Response
		.. code-block:: js

			{
				"error": "AuthencticationRequired",
				"description": "Please, login to perform this operation."
			}			

[GET] /contests/:contest
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[PUT] /contests/:contest
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[PATCH] /contests/:contest
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[DELETE] /contests/:contest
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

- Response

[GET] /contests/:contest/results
	Returns results table based on final tournaments.
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[GET] /contests/:contest/participants
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[GET] /contests/:contest/authors
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[PUT] /contests/:contest/authors
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[PATCH] /contests/:contest/authors
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[GET] /contests/:contest/managers
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[GET] /contests/:contest/sandbox
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response