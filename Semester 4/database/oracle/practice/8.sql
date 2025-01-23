-- show current user
show USER;

-- new profile with all the limits
create profile c##random_profile limit
   failed_login_attempts 3
   password_lock_time 1
   password_life_time 10
   password_grace_time 8
   password_reuse_max 2
   password_reuse_time 5;

-- list all profiles
select profile
  from dba_profiles;

-- create a new user with the new profile
create user c##random identified by random
   profile c##random_profile;

-- delete user
drop user c##random cascade;

-- grant the user the ability to create a session
grant
   create session
to c##random;

-- connect to the new user
connect c##random/random;

-- change the password to something else
alter user c##random identified by random2;

-- grant some privileges to the user
grant
   create session,
   create table,
   create view,
   create synonym
to c##random;

-- list tablespace
select tablespace_name
  from dba_tablespaces;

-- set tablespace
alter user c##random
   default tablespace users
   quota 5M on users;

-- create a new table
CREATE TABLE logic_gates (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    description VARCHAR2(200)
);

-- list description of the table
DESCRIBE logic_gates;