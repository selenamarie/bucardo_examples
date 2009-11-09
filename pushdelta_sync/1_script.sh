#! /bin/bash -v

psql -U postgres postgres -f tables.sql

psql -U postgres mstest -c "\d"
psql -U postgres mstest2 -c "\d"
