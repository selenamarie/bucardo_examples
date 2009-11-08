#!/bin/bash -v

bucardo_ctl add herd all_users public.users

## Set standard conflict to default to preferring the source
psql -U postgres postgres -f set_standard_confict.sql

bucardo_ctl add sync swap_users source=all_users targetdb=master2 type=swap

#ERROR if you don't set the standard conflict type: 

#NOTICE:  Issuing rollback() for database handle being DESTROY'd without explicit disconnect() at line 29.
#CONTEXT:  SQL function "validate_sync" statement 1
#SQL statement "SELECT validate_sync('swap_users')"
#Failed to add sync: DBD::Pg::st execute failed: ERROR:  error from Perl function "validate_sync": error from Perl function "validate_sync": Table "public.users" must specify a way to handle conflicts at line 285. at line 30. at /usr/local/bin/bucardo_ctl line 3349.
#

## Now we'll see our new sync!

bucardo_ctl status

bucardo_ctl status swap_users

## Need to do this because initially, our copies of the DB differ, and we want to bring them up to date
bucardo_ctl update sync swap_users onetimecopy=2

## TODO: make the initial database loads the same!

## Initial setting of the sequence
psql -U postgres mmtest2 -c "select setval('users_id_seq', 10);"


