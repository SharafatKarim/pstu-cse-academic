-- show current user
show USER;

-- new profile with all the limits
create profile c##Combine
   failed_login_attempts 3
   password_lock_time 1
   password_life_time 10
   password_grace_time 8
   password_reuse_max 2
   password_reuse_time default;

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
create table logic_gates (
   id          number primary key,
   name        varchar2(50) not null,
   description varchar2(200)
);

-- list description of the table
DESCRIBE logic_gates;

alter profile c##Combine
   failed_login_attempts 3
   password_lock_time 1
   password_life_time 10
   password_grace_time 8
   password_reuse_max 2
   password_reuse_time 1;
   
alter user c##random identified by random;
alter user c##random identified by a;
alter user c##random identified by aa;
alter user c##random identified by aaa;
alter user c##random identified by b;
alter user c##random identified by bb;
alter user c##random identified by bbb;
alter user c##random identified by bbbb;

select *
  from dba_profiles
 where profile = 'C##RANDOM_PROFILE'
   and resource_name in ( 'PASSWORD_REUSE_MAX',
                          'PASSWORD_REUSE_TIME' );
                          
-- ‘These two parameters are mutually exclusive; if you set a value for one of them, the other must not be set to UNLIMITED’-justify the statement.
-- If I set one values to unlimited, then other one will have no effect, as that one will be filtered out. So the user will never be able to use the same 
-- password again. So we have to specify both term in order to enforce our users to be able to follow certine set of rules.
-- And if we set both values to be unlimited then there will be no restriction and we can reuse any password anytime without any limit.