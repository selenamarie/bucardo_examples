#!/bin/bash

## First test on master2
psql -U postgres mmtest2 -c "insert into users (username,firstname,lastname) values('henry', 'henry', 'eight');"

bucardo_ctl status


psql -U postgres mmtest -c "select * from users;"
psql -U postgres mmtest2 -c "select * from users;"

## Next test on SOURCE: master1
psql -U postgres mmtest -c "insert into users (username,firstname,lastname) values('ian', 'ian', 'nine');"

bucardo_ctl status
psql -U postgres mmtest -c "select * from users;"
psql -U postgres mmtest2 -c "select * from users;"
