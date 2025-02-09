-- Project Privilege Management
-- Project privilege Management

-- 1. Create a user named Person2, 
--    give password 1234, give privilege CREATE SESSION to Person2; 
--    Create another user named Person1, give password 5678, give privilege CREATE SESSION, 
--    CREATE TABLE, CREATE VIEW, CREATE SYNONYM to Person1; create a table named NEWSPAPER under user Person1, 
--    insert data into NEWSPAPER table as user Person1, give privileges SELECT, insert ON NEWSPAPER table TO Person2 from user Person1; 
--    Show NEWSPAPER table and insert data into NEWSPAPER table from user Person2. 	

-- 1. Create a user named Person2, give password 1234, give privilege CREATE SESSION to Person2
CREATE USER c##Person2 IDENTIFIED BY 1234;
GRANT CREATE SESSION TO c##Person2;

-- 2. Create another user named Person1, give password 5678, give privilege CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE SYNONYM to Person1
CREATE USER c##Person1 IDENTIFIED BY 5678;
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE SYNONYM TO c##Person1;

-- 3. Create a table named NEWSPAPER under user Person1
CONNECT c##Person1/5678;
CREATE TABLE NEWSPAPER (
    ID NUMBER PRIMARY KEY,
    TITLE VARCHAR2(100),
    PUBLISHER VARCHAR2(100)
);

-- On linux system we use system as tablespace
-- alter user c##Person1
-- default tablespace users
-- quota 5m on users;

ALTER USER C##PERSON1 DEFAULT TABLESPACE SYSTEM QUOTA 100M ON SYSTEM;

-- 4. Insert data into NEWSPAPER table as user Person1
INSERT INTO NEWSPAPER (ID, TITLE, PUBLISHER) VALUES (1, 'The Times', 'Times Group');
INSERT INTO NEWSPAPER (ID, TITLE, PUBLISHER) VALUES (2, 'The Guardian', 'Guardian Media Group');

-- 5. Give privileges SELECT, INSERT ON NEWSPAPER table TO Person2 from user Person1
GRANT SELECT, INSERT ON NEWSPAPER TO c##Person2;

-- 6. Show NEWSPAPER table and insert data into NEWSPAPER table from user Person2
CONNECT c##Person2/1234;
SELECT * FROM c##Person1.NEWSPAPER;

INSERT INTO c##Person1.NEWSPAPER (ID, TITLE, PUBLISHER) VALUES (3, 'The Daily News', 'Daily News Corp');