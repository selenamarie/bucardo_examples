#!/bin/bash -v

bucardo_ctl add db mmtest name=master1
bucardo_ctl add all tables

## Show what we've done so far
bucardo_ctl list tables

## Add the second master
bucardo_ctl add db mmtest2 name=master2

## Show both databases that we've added to our cluster
bucardo_ctl list db

## Show status (will not be pretty, cuz we haven't started bucardo daemon yet)
bucardo_ctl status

