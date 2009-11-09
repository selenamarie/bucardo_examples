CREATE DATABASE mstest;

\c mstest;

CREATE TABLE users ( 
	id SERIAL NOT NULL PRIMARY KEY,
	username TEXT NOT NULL,
	firstname TEXT NOT NULL,
	lastname TEXT NOT NULL
);

COPY users (id, username, firstname, lastname) FROM stdin;
1	adam	adam	one
2	eve	eve	two
3	bart	bart	three
4	colleen	colleen	four
5	damon	damon	five
6	frank	frank	six
7	george	george	seven
\.

SELECT setval('users_id_seq', 7);

CREATE DATABASE mstest2;

\c mstest2

CREATE TABLE users ( 
	id SERIAL NOT NULL PRIMARY KEY,
	username TEXT NOT NULL,
	firstname TEXT NOT NULL,
	lastname TEXT NOT NULL
);
