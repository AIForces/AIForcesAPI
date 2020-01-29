Contest
-------

Contest API provides you with all the info availiable about the past, current and upcoming contests. It can be used to submit solutions and manage upcoming events.

[GET] /contests
	Retrieve general information of the contests. 

	- Returns list of ``Contest`` objects.
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		show_hidden, boolean, false, "If set to true by non-admin, Forbidden error is returned. Admins can view all the contests."
		fields, list of strings, "All ``Contest`` object fields", "Fields, which will be retrieved. Must be a subset of ``Contest`` object fields"
		limit, integer, 20, Maximum number of recources, which will be returned.
		offset, integer, 0, Index of first resource, which should be returned (used for pagination).
		sort, string, "-start_time", One of the ``Contest`` object fields, which should be used for sorting the items. Order is **ascending**, to reverse the order, use ``-`` at the begining of the string. 

	- Example

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
			.. code-block:: python

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
	Creates new contest.

[GET] /contests/:contest/tournaments
	- Arguments 

	.. csv-table::
		:header: "Argument", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[GET] /contests/:contest/results
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
