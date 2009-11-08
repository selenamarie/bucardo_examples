CREATE OR REPLACE FUNCTION bucardo.plperlu_test()
RETURNS TEXT
LANGUAGE plperlu
AS $bc$
return 'Had a conflict';
$bc$;
