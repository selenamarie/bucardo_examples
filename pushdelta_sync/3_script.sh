#!/bin/bash -v

bucardo_ctl add db mstest name=master
bucardo_ctl add all tables
bucardo_ctl add all sequences

## Show what we've done so far
bucardo_ctl list tables

## Add the second master
bucardo_ctl add db mstest2 name=slave

## Show both databases that we've added to our cluster
bucardo_ctl list db

## Show status (will not be pretty, cuz we haven't started bucardo daemon yet)
bucardo_ctl status
