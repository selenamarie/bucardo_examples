#!/bin/bash -v


bucardo_ctl stop

psql -U postgres postgres -f cleanup.sql
