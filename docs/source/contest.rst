Contest
-------

Contest API provides you with all the info availiable about the past, current and upcoming contests. It can be used to submit solutions and manage upcoming events.

[GET] /contests
	- Parameters 
	
	.. csv-table::
		:header: "Parameter", "Format", "Default", "Description"

		show_hidden, boolean, false, "If set to true by non-admin, error is raised. Admins can view all the contests."
		fields, , ,
		limit, , ,
		offset, , ,
		sort, , ,

	- Example

	- Response

[GET] /contests/:contest/tournaments
	- Parameters 

	.. csv-table::
		:header: "Parameter", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[GET] /contests/:contest/results
	- Parameters 

	.. csv-table::
		:header: "Parameter", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[GET] /contests/:contest/participants
	- Parameters 

	.. csv-table::
		:header: "Parameter", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[GET] /contests/:contest/authors
	- Parameters 

	.. csv-table::
		:header: "Parameter", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[GET] /contests/:contest/managers
	- Parameters 

	.. csv-table::
		:header: "Parameter", "Format", "Default", "Description"

		, , ,

	- Example

	- Response

[GET] /contests/:contest/sandbox
	- Parameters 

	.. csv-table::
		:header: "Parameter", "Format", "Default", "Description"

		, , ,

	- Example

	- Response
