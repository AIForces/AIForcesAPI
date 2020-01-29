Contest
-------

Contest API provides you with all the info availiable about the past, current and upcoming contests. It can be used to submit solutions and manage upcoming events.

/contests

Return a list of contests available.
Method: GET

Parameters

.. csv-table::
	:header: "Parameter", "Format", "Default", "Description"

	show_hidden, boolean, false, "If set to true by non-admin, error is raised. Admins can view all the contests."
	fields, , ,
	limit, , ,
	offset, , ,
	sort, , ,


Example

Response

/contests/:contest-short-name/tournaments

Returns 
Method: GET

Parameters

Example

Response

/contests/:contest-short-name/results

/contests/:contest-short-name/participants

/contests/:contest-short-name/authors

/contests/:contest-short-name/managers

/contests/:contest-short-name/sandbox

