#!/bin/bash -v

bucardo_ctl add herd all_users public.users public.users_id_seq

bucardo_ctl add sync pushdelta_users source=all_users targetdb=slave type=pushdelta

## Now we'll see our new sync!
bucardo_ctl status

bucardo_ctl status pushdelta_users

## Need to do this because initially, our copies of the DB differ, and we want to bring them up to date
bucardo_ctl update sync pushdelta_users onetimecopy=2

## See how sync changed
bucardo_ctl status pushdelta_users
