#!/bin/bash -v

## Start bucardo
bucardo_ctl start

## Give Bucardo time to start up 
sleep 5;

## First test INSERT on master2
psql -U postgres mmtest2 -c "insert into users (username,firstname,lastname) values('henry', 'henry', 'eight');"

sleep 2;

## Check that an insert was detected
bucardo_ctl status

## Show both tables on both databases
psql -U postgres mmtest -c "select * from users;"
psql -U postgres mmtest2 -c "select * from users;"

## Next test INSERT on SOURCE: master1
psql -U postgres mmtest -c "insert into users (username,firstname,lastname) values('ian', 'ian', 'nine');"

sleep 2;

bucardo_ctl status

## Show both tables again
psql -U postgres mmtest -c "select * from users;"
psql -U postgres mmtest2 -c "select * from users;"
