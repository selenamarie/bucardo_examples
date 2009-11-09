#!/bin/bash -v

## Start bucardo
bucardo_ctl start

## Give Bucardo time to start up and copy stuff over
sleep 5;

## Show both tables on both databases
psql -U postgres mstest -c "select * from users;"
psql -U postgres mstest2 -c "select * from users;"

## First test INSERT on master2
psql -U postgres mstest -c "INSERT INTO users (username,firstname,lastname) VALUES('henry', 'henry', 'eight');"

sleep 2;

## Check that an insert was detected
bucardo_ctl status

## Show both tables on both databases
psql -U postgres mstest -c "select * from users;"
psql -U postgres mstest2 -c "select * from users;"

sleep 1

## Now do an UPDATE
psql -U postgres mstest -c "UPDATE users SET lastname='ten' WHERE username = 'henry';"

sleep 2

bucardo_ctl status

## Show both tables on both databases
psql -U postgres mstest -c "select * from users;"
psql -U postgres mstest2 -c "select * from users;"

sleep 1

# Check out log.bucardo:
tail -20 log.bucardo
