#! /bin/bash -v

psql -U postgres postgres -f tables.sql

psql -U postgres mmtest -c "SELECT * from users_id_seq"
psql -U postgres mmtest2 -c "SELECT * from users_id_seq"
