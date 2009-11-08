#!/bin/bash -v

bucardo_ctl stop
psql -U postgres mmtest -c "update users set lastname='ten' where id = 12;"
psql -U postgres mmtest2 -c "update users set lastname='eleven' where id = 12;"

bucardo_ctl start
sleep 2

# Check out log.bucardo:
tail -20 log.bucardo
