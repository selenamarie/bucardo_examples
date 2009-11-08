#!/bin/bash

bucardo_ctl stop
psql -U postgres mmtest -c "update users set lastname='ten' where id = 12;"
psql -U postgres mmtest2 -c "update users set lastname='eleven' where id = 12;"

bucardo_ctl start

# Check out log.bucardo:
#[Sun Nov  8 13:41:47 2009]  KID Conflict detected for public.users:12. Using standard conflict "source"
#[Sun Nov  8 13:41:47 2009]  KID Action summary: 1:1
#[Sun Nov  8 13:41:47 2009]  KID [1/1] public.users UPDATE source to target pk 12

