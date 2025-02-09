-- Project Password Management
-- 1. 
--     a. Create a PROFILE named Password_Management where PASSWORD LIFE TIME will be 10 days, 
--        PASSWORD GRACE TIME will be 8 days, PASSWORD REUSE MAX will be 3, PASSWORD LOCK TIME will be for 1 day, 
--        FAILED LOGIN ATTEMPTS for 2 times, PASSWORD REUSE TIME 10 days. Prove each profile by appropriate 
--        comment execution. Submit the consequent execution comment in text file. Also show the comment for 
--        showing your created profile.   							
--     b. To prevent a password from being reused, you can use one of two profile parameters: PASSWORD_REUSE_MAX 
--        or PASSWORD_REUSE_TIME. ‘These two parameters are mutually exclusive; if you set a value for one of them, 
--        the other must not be set to UNLIMITED’ - justify the statement.

-- a. Create the PROFILE named Password_Management
CREATE PROFILE c##Password_Management 
LIMIT 
    PASSWORD_LIFE_TIME 10 
    PASSWORD_GRACE_TIME 8 
    PASSWORD_REUSE_MAX 3 
    PASSWORD_LOCK_TIME 1 
    FAILED_LOGIN_ATTEMPTS 2 
    PASSWORD_REUSE_TIME 10;
ALTER USER c##Tester ACCOUNT UNLOCK;

-- PASSWORD_LOGIN_ATTEMPTS check --

-- creating an user to test the profile
CREATE USER c##Tester IDENTIFIED BY 12345 PROFILE c##Password_Management;
GRANT CREATE SESSION TO c##Tester;

-- connect to the user
CONNECT c##Tester/12345;

-- trying wrong password
CONNECT c##Tester/1;
-- ERROR:
-- ORA-01017: invalid credential or not authorized; logon denied
-- Help: https://docs.oracle.com/error-help/db/ora-01017/
CONNECT c##Tester/2;
-- ERROR:
-- ORA-01017: invalid credential or not authorized; logon denied
-- Help: https://docs.oracle.com/error-help/db/ora-01017/


-- account locked if we try once more
CONNECT c##Tester/2;
-- ERROR:
-- ORA-28000: The account is locked; login denied.
-- Help: https://docs.oracle.com/error-help/db/ora-28000/

-- PASSWORD_LOCK_TIME check
-- we can wait 1 day to unlock the account

-- PASSWORD_LIFE_TIME check
-- we can jump to 10 days in future
-- connect to the user
CONNECT c##Tester/12345;

