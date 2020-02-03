Return objects
**************

.. _contest-label:

Contest
=======
Represents general info about one competition.

.. table::

   ============= ===================== ===========================================
   Field         Format                Description
   ============= ===================== ===========================================
   id            integer               Contest ID
   short_name    string                Contest unique short name
   name          string                Name of the contest. May be localized
   official      boolean               If contest is official, it is approved by admins
   reg_open      boolean               If contest is used in a private group, registration may be restricted.
   hidden        boolean               If true, contest is not visible for public
   rated         boolean               After rating contests, rating is recalculated
   competetive   boolean               If the contest is competetive, submissions are ``private`` by default,
                                       otherwise they are ``public``.
   description   string                Description of the contest. May be localized
   difficulty    integer from 1 to 5   Estimated difficulty. 5 is the most difficult
   start_time    integer               Start of the contest (ISO 8601 format)
   duration      integer               Duration of contest in seconds. `-1` if contest is infinite.
   status        string                Describes status of the contest

                                       - before
                                       - in_progress
                                       - pending_results
                                       - finished
   has_sandbox   boolean               If true, contest has a sandbox and corresponding API can be used
   frozen_after  integer               If contest has sandbox, it will be turned off after number of seconds, set in this variable.  
                                       Otherwise, `-1`.
   authors       (see example)         Authors of the contest
   managers      (see example)         Managers of the contest
   problems      (see example)         Problems, used in the contest
   created_at    string                Time, contest was created. (ISO 8601 format)
   updated_at    string                Time, contest was last updated. (ISO 8601 format)
   ============= ===================== ===========================================

Example
   .. code-block:: json

      {
          "id": 105,
          "short_name": "tron_contest",
          "name": "First awesome AIForces contest.",
          "official": true,
          "reg_open": true,
          "hidden": false,
          "rated": true,
          "competetive": true,
          "description": "Lorem ipsum dolor sit amet.",
          "difficulty": 1,
          "start_time": "2019-01-24T23:02:40+00:00",
          "duration": 86400,
          "status": "finished",
          "has_sandbox": true,
          "frozen_after": 82800,
          "authors": {
              "testers": [
                  "user_tester_1",
                  "user_tester_2",
              ],
              "front-enders": [
                  "front-end-god"
              ],
              "problemsetters": [
                  "icpc-person"
              ],
              "coordinators": [
                  "300iq"
              ]
          },
          "managers": {
              "read": [
                  "tester_meshanya",
                  "tester_sanya",
              ],
              "write": [
                  "problemwriter_anton"
              ]
          },
          "problems": {
              "A": "tron",
              "B": "chess",
              "C": "go"
          },
          "created_at": "2019-01-24T23:02:40+00:00",
          "updated_at": "2019-01-24T23:02:40+00:00",
      }

.. _tournament-label:

Tournament
==========
Represents general info about one tournament.
(contest may include several intermediate tournament and one final tournament per problem)

.. table::

   ================ ======== ===================================================
   Field            Format   Description
   ================ ======== ===================================================
   id               integer  Tournament ID
   name             string   Name of the tournament. May be localized
   hidden           boolean  If true, tournament is not visible for public
   start_time       integer  Start of the tournament (ISO 8601 format)
   tournament_type  string   One of the built-in tournament types. Check the corresponding documentation
   status           string   Describes status of the tournament

                             - before
                             - in_progress
                             - pending_results
                             - finished
   created_at       string   Time, tournament was created. (ISO 8601 format)
   updated_at       string   Time, tournament settings was last updated. (ISO 8601 format)
   ================ ======== ===================================================

Example
   .. code-block:: json

      {
          "id": 123,
          "name": "first blood",
          "hidden": false,
          "start_time": "2019-01-24T23:02:40+00:00",
          "tournament_type": "swiss",
          "status": "in_progress",
          "created_at": "2019-01-24T23:02:40+00:00",
          "updated_at": "2019-01-24T23:02:40+00:00",
      }

.. _submission-label:

Submission
==========

Represnts one code submission.

.. table::

   ============= ======== ======================================================
   Field         Format   Description
   ============= ======== ======================================================
   id            integer  Submission ID
   user          string   Username of the person, who made the submission
   contest       string   Contest the submission is attached to.
   access        string   Submission access modifier. Either ``private``, ``public`` and ``protected``.
   problem       string   Problem, which solution is presented
   name          string   Short name (may be given by the user to identify submissions in a quick way)
   source_file   string   URL, which can be used to download the source. Read Media docs.
   lang          string   Identifier of the programming language. Read the corresponding documentation
   submitted_at  string   Submission time (ISO 8601 format)
   pretest       list     List of challenge ids - submission pretests.
   ============= ======== ======================================================


Example
   .. code-block:: json

      {
          "id": 278,
          "user": "patrick",
          "contest": "tron_test_contest",
          "access": "public",
          "problem": "tron",
          "name": "tron_megasolver2000",
          "source_file": "/media/submission_278.py",
          "lang": "pypy3",
          "submitted_at": "2019-01-24T23:02:40+00:00"
          "pretest": [109, 110, 111]
      }

.. _achievement-label:

Achievement
===========

Represents one user's participation score in the given contest

.. table::

   ==================== ============== =========================================
   Field                Format         Description
   ==================== ============== =========================================
   id                   integer        Achievement ID
   contest              string         Contest short name
   rating_before        integer        Rating before the contest
   rating_after         integer        Rating after the contest
   problem_scores       object (dict)  Score per problem
   total_score          integer        Sum of scores
   user                 string         Username
   place                integer        Place, that user takes
   participants_number  integer        Contest's participants number
   achieved_at          string         Achievement time (ISO 8601 format)
   ==================== ============== =========================================

Example
   .. code-block:: json

      {
          "id": 105,
          "contest": "tron_contest",
          "rating_before": 1500,
          "rating_after": 1549,
          "problem_scores": {
              "A": 700,
              "B": 1000,
              "C": 800
          },
          "total_score": 2500,
          "user": "meshanya",
          "place": 3,
          "participants_number": 1000,
          "achieved_at": "2019-01-24T23:02:40+00:00"
      }

.. _problem-label:

Problem
=======

Represents one problem.

.. table::

   ==================== ==================== =========================================
   Field                Format               Description
   ==================== ==================== =========================================
   id                   integer              Problem ID.
   short_name           string               Problem unique short name.
   name                 string               Problem name. May be localized.
   access               string               Problem access modifier. Either ``private``, ``public`` or ``protected``.
   description          string               Description of the problem. May be localized.
   difficulty           integer from 1 to 5  Estimated difficulty. 5 is the most difficult.
   statements           string               URL, which can be used to download statements pdf. Read Media docs. May be localized.
   visualizer           object (dict)        Contains URL of visualizer files: html, css, js. Read Media docs. May be localized.
   managers             object (dict)        Managers of the contest.
   authors              object (dict)        Authors of the contest.
   minimal_players      integer              Minimal number of players in one challenge.
   maximal_players      integer              Maximal number of players in one challenge.
   time-limit           integer              Per move time limit in microsends
   memory-limit         integer              RAM limit in bytes.              
   created_at           string               Time, problem was created. (ISO 8601 format)
   updated_at           string               Time, problem was last updated. (ISO 8601 format)
   ==================== ==================== =========================================

Example
   .. code-block:: json

      {
          "id": 190,
          "short_name": "chess",
          "name": "Chess",
          "access": "public",
          "description": "Classical indian game. Played on a checkered board with 64 squares arranged in an 8×8 grid."
          "difficulty": 4,
          "statements": "/media/tron/statements.pdf",
          "visualizer": {
              "html": "/media/tron/visualizer.html",
              "css": "/media/tron/visualizer.css",
              "js": "/media/tron/visualizer.js",
          },
          "authors": {
              "testers": [
                  "user_tester_1",
                  "user_tester_2",
              ],
              "front-enders": [
                  "front-end-god"
              ],
              "problemsetters": [
                  "icpc-person"
              ],
              "coordinators": [
                  "300iq"
              ]
          },
          "managers": {
              "read": [
                  "tester_meshanya",
                  "tester_sanya",
              ],
              "write": [
                  "problemwriter_anton"
              ]
          },
          "minimal_players": 2,
          "maximal_players": 2,
      }


.. _git-info-label:

Git info
========

Represents one problem's git settings

.. table::

   ==================== ==================== =========================================
   Field                Format               Description
   ==================== ==================== =========================================
   host                 string               Git hosting. At the moment, only github is supported.
   user                 string               Github user or organisation, who owns the repo
   repo                 string               Name of the repository.
   branch               string               Branch to use in AIForces
   auto_fetch           boolean              If set to true, cloned repo will be fetched automatically after every commit.
   commit               object (dict)        Name and Hash of the current commit.
   ==================== ==================== =========================================

Example
   .. code-block:: json

      {
          "host": "github",
          "user": "aalekseevx",
          "repo": "tron",
          "branch": "master",
          "auto_pull": true,
          "commit": {
              "hash": "2872f3cbf85bcb96196f6901d56df8d80b337c58",
              "name": "Refactoring checker."
          },
          "last_fetched": "2019-01-24T23:02:40+00:00"
      }