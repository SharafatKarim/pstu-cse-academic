-- Tables for Oracle Database 10g:The Complete Reference, by Kevin Loney and George Koch, 
-- copyright Osborne/McGraw-Hill

-- Tables Used in this Book

-- This appendix contains the complete listings of all the tables used in the examples
-- throughout this book. They can be keyed in to a start file as is to load into a
-- database using SQL*Plus. If these tables are a part of your Oracle database, you 
-- can easily work your way through the examples in this book and experiment with the 
-- many techniques that are illustrated.

-- For ease of use, set up a user named practice, with a password of practice. Give 
-- this user CONNECT and RESOURCE roles (or similar system privileges) so that new 
-- users can access it to learn Oracle. If you are a new user on an existing Oracle 
-- installation, check with your DBA to see if this has already been done. If not, 
-- you might request it, or at least request that the tables and start files be 
-- available to you through public synonyms. Whatever damage is done on the 
-- practice id can always be repaired simply by reloading the tables from their start 
-- files.


-- Using the Scripts and Tables in this Book

-- This file is made available so you can access these tables without retyping. You can
-- use these tables to easily work your way through the examples and experiment with 
-- the many techniques that are illustrated in the book.

-- The scripts in this section are the activity.sql file (see Chapter 6) and the 
-- math.sql file (for Chapter 9) followed by the table creation scripts.


rem ***************************
rem The activity.sql Start File
rem ***************************

rem  Bookshelf activity report
set headsep OFF

ttitle 'Checkout Log for 1/1/02-3/31/02'
btitle 'from the Bookshelf'

column Name format a20
column Title format a20 word_wrapped
column DaysOut format 999.99
column DaysOut heading 'Days!Out'

break on Name skip 1 on report
compute avg of DaysOut on Name
compute avg of DaysOut on report

set linesize 80
set pagesize 60
set newpage 0

spool activity.lst

select Name, Title, CheckoutDate, ReturnedDate,
       ReturnedDate-CheckoutDate as DaysOut /*Count days*/
  from BOOKSHELF_CHECKOUT
 order by Name, CheckoutDate;

spool off


rem ***********************
rem The math.sql Start File
rem ***********************

rem         Name: math.sql       Type: start file report
rem   Written by: G. Koch
rem
rem  Description: Illustrates ORACLE math functions. Produces
rem               an output file named MATH.LST
set echo off
set pagesize 32000
set linesize 132
column Plus format 99.999
column Subtr format 999.999
column Times format 9999.999999
column Divided format .999999
column VSIZE(Above) heading 'VSIZE|(Above)'
column VSIZE(Below) heading 'VSIZE|(Below)'
column VSIZE(Empty) heading 'VSIZE|(Empty)'
column NVL(Above,11) heading 'NVL|(Above,11)'
column NVL(Below,11) heading 'NVL|(Below,11)'
column NVL(Empty,11) heading 'NVL|(Empty,11)'
column ROUND(Above,2) heading 'ROUND|(Above,2)'
column ROUND(Below,2) heading 'ROUND|(Below,2)'
column TRUNC(Above,2) heading 'TRUNC|(Above,2)'
column TRUNC(Below,2) heading 'TRUNC|(Below,2)'
column ROUND(Above,0) heading 'ROUND|(Above,0)'
column ROUND(Below,0) heading 'ROUND|(Below,0)'
column TRUNC(Above,0) heading 'TRUNC|(Above,0)'
column TRUNC(Below,0) heading 'TRUNC|(Below,0)'
column ROUND(Above,-1) heading 'ROUND|(Above,-1)'
column ROUND(Below,-1) heading 'ROUND|(Below,-1)'
column TRUNC(Above,-1) heading 'TRUNC|(Above,-1)'
column TRUNC(Below,-1) heading 'TRUNC|(Below,-1)'
set echo on
set numwidth 7
set numformat ""
spool math.lst
select Name, Above, Below, Empty from MATH;

select Name, Above, Below, Empty,
       Above + Below "Plus",
       Above - Below "Subtr",
       Above * Below "Times",
       Above / Below "Divided"
  from MATH where Name = 'HIGH DECIMAL';

select Name, Above, Below, Empty,
       Above + Empty "Plus",
       Above - Empty "Subtr",
       Above * Empty "Times",
       Above / Empty "Divided"
  from MATH where Name = 'HIGH DECIMAL';

select Name, Above, Below, Empty,
       ABS(Above),
       ABS(Below),
       ABS(Empty)
  from MATH where Name = 'HIGH DECIMAL';

select Name, Above, Below, Empty,
       VSIZE(Above),
       VSIZE(Below),
       VSIZE(Empty)
  from MATH;

select Name, Above, Below, Empty,
       NVL(Above,11),
       NVL(Below,11),
       NVL(Empty,11)
  from MATH where Name = 'HIGH DECIMAL';

select Name, Above, Below,
       CEIL(Above),
       CEIL(Below)
  from MATH;

select Name, Above, Below,
       FLOOR(Above),
       FLOOR(Below)
  from MATH;

select Name, Above, Below,
       MOD(Above,11),
       MOD(Below,11)
  from MATH where Name = 'HIGH DECIMAL';

set numformat 9999.999999
select Name, Above, Below,
       POWER(Above,2),
       POWER(Below,2)
  from MATH where Name = 'HIGH DECIMAL';

select Name, Above, Below,
       POWER(Above,2.9),
       POWER(Below,2.9)
  from MATH;

set numformat ""
select Name, Above, Below,
       SQRT(Above),
       SQRT(Below)
  from MATH where Name = 'HIGH DECIMAL';

select Name, Above, Below,
       ROUND(Above,2),
       ROUND(Below,2),
       TRUNC(Above,2),
       TRUNC(Below,2)
  from MATH;

select Name, Above, Below,
       ROUND(Above,0),
       ROUND(Below,0),
       TRUNC(Above,0),
       TRUNC(Below,0)
  from MATH;

select Name, Above, Below,
       ROUND(Above,-1),
       ROUND(Below,-1),
       TRUNC(Above,-1),
       TRUNC(Below,-1)
  from MATH;


select Name, Above, Below,
       SIGN(Above),
       SIGN(Below)
  from MATH where Name = 'HIGH DECIMAL';

spool off


rem *******************
rem The ADDRESS_TY Type
rem *******************

create or replace type ADDRESS_TY as object
(Street  VARCHAR2(50),
 City    VARCHAR2(25),
 State   CHAR(2),
 Zip     NUMBER);
/


rem ******************
rem The ANIMAL_TY Type
rem ******************

create or replace type ANIMAL_TY as object
(Breed      VARCHAR2(25),
 Name       VARCHAR2(25),
 BirthDate  DATE,
member function AGE (BirthDate IN DATE) return NUMBER);
/

create or replace type body ANIMAL_TY as
member function Age (BirthDate DATE) return NUMBER is
begin
  RETURN ROUND(SysDate - BirthDate);
end;
end;
/

rem  For the Nested Table examples:
create type ANIMALS_NT as table of ANIMAL_TY;
/


rem ******************
rem The PERSON_TY Type
rem ******************

rem  Requires that the ADDRESS_TY type already exist.

create type PERSON_TY as object
(Name      VARCHAR2(25),
 Address   ADDRESS_TY);
/


rem *****************
rem The TOOLS_VA Type
rem *****************

rem  Creates a varying array datatype.

create or replace type TOOLS_VA as varray(5) of VARCHAR2(25);
/


rem *****************
rem The ADDRESS Table
rem *****************

drop table ADDRESS;
create table ADDRESS (
LastName   VARCHAR2(25),
FirstName  VARCHAR2(25),
Street     VARCHAR2(50),
City       VARCHAR2(25),
State      CHAR(2),
Zip        NUMBER,
Phone      VARCHAR2(12),
Ext        VARCHAR2(5)
);

insert into ADDRESS values ('BAILEY', 'WILLIAM',
     null,null,null,null,'213-555-0223',null);
insert into ADDRESS values ('ADAMS', 'JACK',
     null,null,null,null,'415-555-7530',null);
insert into ADDRESS values ('SEP', 'FELICIA',
     null,null,null,null,'214-555-8383',null);
insert into ADDRESS values ('DE MEDICI', 'LEFTY',
     null,null,null,null,'312-555-1166',null);
insert into ADDRESS values ('DEMIURGE', 'FRANK',
     null,null,null,null,'707-555-8900',null);
insert into ADDRESS values ('CASEY', 'WILLIS',
     null,null,null,null,'312-555-1414',null);
insert into ADDRESS values ('ZACK', 'JACK',
     null,null,null,null,'415-555-6842',null);
insert into ADDRESS values ('YARROW', 'MARY',
     null,null,null,949414302,'415-555-2178',null);
insert into ADDRESS values ('WERSCHKY', 'ARNY',
     null,null,null,null,'415-555-7387',null);
insert into ADDRESS values ('BRANT', 'GLEN',
     null,null,null,null,'415-555-7512',null);
insert into ADDRESS values ('EDGAR', 'THEODORE',
     null,null,null,null,'415-555-6252',null);
insert into ADDRESS values ('HARDIN', 'HUGGY',
     null,null,null,null,'617-555-0125',null);
insert into ADDRESS values ('HILD', 'PHIL',
     null,null,null,null,'603-555-2242',null);
insert into ADDRESS values ('LOEBEL', 'FRANK',
     null,null,null,null,'202-555-1414',null);
insert into ADDRESS values ('MOORE', 'MARY',
     null,null,null,601262460,'718-555-1638',null);
insert into ADDRESS values ('SZEP', 'FELICIA',
     null,null,null,null,'214-555-8383',null);
insert into ADDRESS values ('ZIMMERMAN', 'FRED',
     null,null,null,null,'503-555-7491',null);


rem ***************
rem The AREAS Table
rem ***************

drop table AREAS;
create table AREAS
(Radius      NUMBER(5),
 Area        NUMBER(14,2)
);

REMARK No inserts. This table is empty.


rem ****************
rem The AUTHOR Table
rem ****************

drop table AUTHOR;
create table AUTHOR
(AuthorName  VARCHAR2(50) primary key,
Comments  VARCHAR2(100));

Insert into AUTHOR values
('DIETRICH BONHOEFFER', 'GERMAN THEOLOGIAN, KILLED IN A WAR CAMP');
Insert into AUTHOR values
('ROBERT BRETALL','KIERKEGAARD ANTHOLOGIST');
Insert into AUTHOR values
('ALEXANDRA DAY','AUTHOR OF PICTURE BOOKS FOR CHILDREN');
Insert into AUTHOR values
('STEPHEN JAY GOULD','SCIENCE COLUMNIST, HARVARD PROFESSOR');
Insert into AUTHOR values
('SOREN KIERKEGAARD','DANISH PHILOSOPHER AND THEOLOGIAN');
Insert into AUTHOR values
('HARPER LEE','AMERICAN NOVELIST, PUBLISHED ONLY ONE NOVEL');
Insert into AUTHOR values
('LUCY MAUD MONTGOMERY','CANADIAN NOVELIST');
Insert into AUTHOR values
('JOHN ALLEN PAULOS','MATHEMATICS PROFESSOR');
Insert into AUTHOR values
('J. RODALE', 'ORGANIC GARDENING EXPERT');
Insert into AUTHOR values
('DANIEL BOORSTIN', 'LIBRARIAN OF CONGRESS');
Insert into AUTHOR values
('CHRIS VAN ALLSBURG', 'ILLUSTRATOR');
Insert into AUTHOR values
('MARGARET WISE BROWN', 'EDITOR AND AUTHOR');
Insert into AUTHOR values
('CLEMENT HURD', 'ILLUSTRATOR');
Insert into AUTHOR values
('G. B. TALBOT', 'FAMOUS LEDGERIST');
Insert into AUTHOR values
('JOHN KEATS', 'ROMANTIC POET');
Insert into AUTHOR values
('JOHN BARNARD', 'KEATS EDITOR');
Insert into AUTHOR values
('CHRISTOPHER NOLAN', 'POET AND AUTHOR');
Insert into AUTHOR values
('DAVID MCCULLOUGH', 'HISTORIAN');
Insert into AUTHOR values
('MERIWETHER LEWIS', 'EXPLORER AND JOURNALIST');
Insert into AUTHOR values
('WILLIAM CLARK', 'EXPLORER AND JOURNALIST');
Insert into AUTHOR values
('STEPHEN AMBROSE',NULL);
Insert into AUTHOR values
('BERNARD DE VOTO', 'EDITOR');
Insert into AUTHOR values
('WILTON BARNHARDT', 'AMERICAN AUTHOR');
Insert into AUTHOR values
('AVI', 'PROLIFIC AUTHOR OF BOOKS FOR CHILDREN');
Insert into AUTHOR values
('J. K. ROWLING', 'AUTHOR OF HARRY POTTER SERIES');
Insert into AUTHOR values
('W. P. KINSELLA', 'AUTHOR AND WRITING PROFESSOR');
Insert into AUTHOR values
('E. B. WHITE', 'AUTHOR AND ESSAYIST');
Insert into AUTHOR values
('BERYL MARKHAM', 'AVIATOR AND ADVENTURESS');
Insert into AUTHOR values
('PETER GOMES', 'HARVARD THEOLOGIAN');
Insert into AUTHOR values
('THOMAS SWEARS', 'PASTOR AND AUTHOR');
Insert into AUTHOR values
('E. ANNIE PROULX,NULL);

commit;


rem ******************
rem The BIRTHDAY Table
rem ******************

drop table BIRTHDAY;
create table BIRTHDAY (
FirstName     VARCHAR2(15),
LastName      VARCHAR2(15),
BirthDate     DATE,
Age           NUMBER,
constraint PK_BIRTHDAY primary key (FirstName, LastName)
);

insert into BIRTHDAY values ('GEORGE','SAND',
        TO_DATE('12-MAY-1946','DD-MON-YYYY'),42);
insert into BIRTHDAY values ('ROBERT','JAMES',
        TO_DATE('23-AUG-1937','DD-MON-YYYY'),52);
insert into BIRTHDAY values ('NANCY','LEE',
        TO_DATE('02-FEB-1947','DD-MON-YYYY'),42);
insert into BIRTHDAY values ('VICTORIA','LYNN',
        TO_DATE('20-MAY-1949 3:27','DD-MON-YYYY HH24:MI'),42);
insert into BIRTHDAY values ('FRANK','PILOT',
        TO_DATE('11-NOV-1942','DD-MON-YYYY'),42);


rem ********************
rem The BOOK_ORDER Table
rem ********************

drop table BOOK_ORDER;
create table BOOK_ORDER
(Title       VARCHAR2(100) primary key,
Publisher    VARCHAR2(20),
CategoryName VARCHAR2(20));


Insert into BOOK_ORDER values
('SHOELESS JOE','MARINER','ADULTFIC');
Insert into BOOK_ORDER values
('GOSPEL','PICADOR','ADULTFIC');
Insert into BOOK_ORDER values
('SOMETHING SO STRONG','PANDORAS','ADULTNF');
Insert into BOOK_ORDER values
('GALILEO''S DAUGHTER','PENGUIN','ADULTNF');
Insert into BOOK_ORDER values
('LONGITUDE','PENGUIN','ADULTNF');
Insert into BOOK_ORDER values
('ONCE REMOVED','SANCTUARY PUB','ADULTNF');

commit;


rem *****************************
rem The BOOK_REVIEW_CONTEXT Table
rem *****************************

create table BOOK_REVIEW_CONTEXT
(Title       VARCHAR2(100) primary key,
Reviewer     VARCHAR2(25),
Review_Date  DATE,
Review_Text  VARCHAR2(4000));

insert into BOOK_REVIEW_CONTEXT values
('MY LEDGER', 'EMILY TALBOT', '01-MAY-02',
'A fascinating look into the transactions and finances of G. B. Talbot and Dora Talbot as they managed a property in New Hampshire around 1900.  The stories come through the purchases  for medicine, doctor visits and gravesites  for workers during harvests  for gifts at the general store at Christmas.  A great read. ');


rem ****************************
rem The BOOK_REVIEW_CTXCAT Table
rem ****************************

create table BOOK_REVIEW_CTXCAT
(Title       VARCHAR2(100) primary key,
Reviewer     VARCHAR2(25),
Review_Date  DATE,
Review_Text  VARCHAR2(4000));

insert into BOOK_REVIEW_CTXCAT values
('MY LEDGER', 'EMILY TALBOT', '01-MAY-02',
'A fascinating look into the transactions and finances of G. B. Talbot and Dora Talbot as they managed a property in New Hampshire around 1900.  The stories come through the purchases  for medicine, doctor visits and gravesites  for workers during harvests  for gifts at the general store at Christmas.  A great read. ');

rem *******************
rem The BOOKSHELF Table
rem *******************

REM  The CATFK foreign key requires that the CATEGORY table
REM  is created and populated before BOOKSHELF.

drop table BOOKSHELF;
create table BOOKSHELF
(Title       VARCHAR2(100) primary key,
Publisher    VARCHAR2(20),
CategoryName VARCHAR2(20),
Rating       VARCHAR2(2), 
constraint CATFK foreign key (CategoryName) 
references CATEGORY(CategoryName));

Insert into BOOKSHELF values
('TO KILL A MOCKINGBIRD','HARPERCOLLINS','ADULTFIC','5');
Insert into BOOKSHELF values
 ('WONDERFUL LIFE','W.W.NORTON','ADULTNF','5');
Insert into BOOKSHELF values
 ('INNUMERACY','VINTAGE BOOKS','ADULTNF','4');
Insert into BOOKSHELF values
 ('KIERKEGAARD ANTHOLOGY','PRINCETON UNIV PR','ADULTREF','3');
Insert into BOOKSHELF values
 ('ANNE OF GREEN GABLES','GRAMMERCY','CHILDRENFIC','3');
Insert into BOOKSHELF values
 ('GOOD DOG, CARL','LITTLE SIMON','CHILDRENPIC','1');
Insert into BOOKSHELF values
 ('LETTERS AND PAPERS FROM PRISON','SCRIBNER','ADULTNF','4');
Insert into BOOKSHELF values
 ('THE DISCOVERERS','RANDOM HOUSE','ADULTNF','4');
Insert into BOOKSHELF values
 ('THE MISMEASURE OF MAN','W.W. NORTON','ADULTNF','5');
Insert into BOOKSHELF values
 ('EITHER/OR','PENGUIN','ADULTREF','3');
Insert into BOOKSHELF values
 ('POLAR EXPRESS','HOUGHTON MIFFLIN','CHILDRENPIC','1');
Insert into BOOKSHELF values
('RUNAWAY BUNNY','HARPERFESTIVAL','CHILDRENPIC','1');
Insert into BOOKSHELF values
('MY LEDGER','KOCH PRESS','ADULTNF','5');
Insert into BOOKSHELF values
('COMPLETE POEMS OF JOHN KEATS','VIKING','ADULTREF','2');
Insert into BOOKSHELF values
('UNDER THE EYE OF THE CLOCK','ARCADE PUB','CHILDRENNF','3');
Insert into BOOKSHELF values
('JOHN ADAMS','SIMON SCHUSTER','ADULTNF','4');
Insert into BOOKSHELF values
('TRUMAN','SIMON SCHUSTER','ADULTNF','4');
Insert into BOOKSHELF values
('JOURNALS OF LEWIS AND CLARK','MARINER','ADULTNF','4');
Insert into BOOKSHELF values
('GOSPEL','PICADOR','ADULTFIC','4');
Insert into BOOKSHELF values
('EMMA WHO SAVED MY LIFE','ST MARTIN''S PRESS','ADULTFIC','3');
Insert into BOOKSHELF values
('MIDNIGHT MAGIC','SCHOLASTIC','CHILDRENFIC','1');
Insert into BOOKSHELF values
('HARRY POTTER AND THE GOBLET OF FIRE','SCHOLASTIC','CHILDRENFIC','4');
Insert into BOOKSHELF values
('SHOELESS JOE','MARINER','ADULTFIC','3');
Insert into BOOKSHELF values
('BOX SOCIALS','BALLANTINE','ADULTFIC','3');
Insert into BOOKSHELF values
('TRUMPET OF THE SWAN','HARPERCOLLINS','CHILDRENFIC','3');
Insert into BOOKSHELF values
('CHARLOTTE''S WEB','HARPERTROPHY','CHILDRENFIC','3');
Insert into BOOKSHELF values
('WEST WITH THE NIGHT','NORTH POINT PRESS','ADULTNF','3');
Insert into BOOKSHELF values
('THE GOOD BOOK','BARD','ADULTREF','4');
Insert into BOOKSHELF values
('PREACHING TO HEAD AND HEART','ABINGDON PRESS','ADULTREF','4');
Insert into BOOKSHELF values
('THE COST OF DISCIPLESHIP','TOUCHSTONE','ADULTREF','3');
Insert into BOOKSHELF values
('THE SHIPPING NEWS','SIMON SCHUSTER','ADULTFIC','4');

commit;


rem *************************
rem The BOOKSHELF_AUDIT Table
rem *************************

drop table BOOKSHELF_AUDIT;
create table BOOKSHELF_AUDIT
(Title       VARCHAR2(100),
Publisher    VARCHAR2(20),
CategoryName VARCHAR2(20),
Old_Rating   VARCHAR2(2),
New_Rating   VARCHAR2(2),
Audit_Date   DATE); 


rem **************************
rem The BOOKSHELF_AUTHOR Table
rem **************************

REM    The AUTHOR, CATEGORY, and BOOKSHELF tables 
REM    must be created before BOOKSHELF_AUTHOR.

drop table BOOKSHELF_AUTHOR;
create table BOOKSHELF_AUTHOR
(Title      VARCHAR2(100),
AuthorName  VARCHAR2(50),
constraint TitleFK Foreign key (Title) references BOOKSHELF(Title),
constraint AuthorNameFK Foreign key (AuthorName) 
references AUTHOR(AuthorName));

Insert into BOOKSHELF_AUTHOR values
('TO KILL A MOCKINGBIRD','HARPER LEE');
Insert into BOOKSHELF_AUTHOR values
 ('WONDERFUL LIFE','STEPHEN JAY GOULD');
Insert into BOOKSHELF_AUTHOR values
 ('INNUMERACY','JOHN ALLEN PAULOS');
Insert into BOOKSHELF_AUTHOR values
 ('KIERKEGAARD ANTHOLOGY','ROBERT BRETALL');
Insert into BOOKSHELF_AUTHOR values
 ('KIERKEGAARD ANTHOLOGY','SOREN KIERKEGAARD');
Insert into BOOKSHELF_AUTHOR values
 ('ANNE OF GREEN GABLES','LUCY MAUD MONTGOMERY');
Insert into BOOKSHELF_AUTHOR values
 ('GOOD DOG, CARL','ALEXANDRA DAY');
Insert into BOOKSHELF_AUTHOR values
 ('LETTERS AND PAPERS FROM PRISON','DIETRICH BONHOEFFER');
Insert into BOOKSHELF_AUTHOR values
 ('THE DISCOVERERS','DANIEL BOORSTIN');
Insert into BOOKSHELF_AUTHOR values
 ('THE MISMEASURE OF MAN','STEPHEN JAY GOULD');
Insert into BOOKSHELF_AUTHOR values
 ('EITHER/OR','SOREN KIERKEGAARD');
Insert into BOOKSHELF_AUTHOR values
 ('POLAR EXPRESS','CHRIS VAN ALLSBURG');
Insert into BOOKSHELF_AUTHOR values
('RUNAWAY BUNNY','MARGARET WISE BROWN');
Insert into BOOKSHELF_AUTHOR values
('RUNAWAY BUNNY','CLEMENT HURD');
Insert into BOOKSHELF_AUTHOR values
('MY LEDGER','G. B. TALBOT');
Insert into BOOKSHELF_AUTHOR values
('COMPLETE POEMS OF JOHN KEATS','JOHN KEATS');
Insert into BOOKSHELF_AUTHOR values
('COMPLETE POEMS OF JOHN KEATS','JOHN BARNARD');
Insert into BOOKSHELF_AUTHOR values
('UNDER THE EYE OF THE CLOCK','CHRISTOPHER NOLAN');
Insert into BOOKSHELF_AUTHOR values
('JOHN ADAMS','DAVID MCCULLOUGH');
Insert into BOOKSHELF_AUTHOR values
('TRUMAN','DAVID MCCULLOUGH');
Insert into BOOKSHELF_AUTHOR values
('JOURNALS OF LEWIS AND CLARK','MERIWETHER LEWIS');
Insert into BOOKSHELF_AUTHOR values
('JOURNALS OF LEWIS AND CLARK','WILLIAM CLARK');
Insert into BOOKSHELF_AUTHOR values
('JOURNALS OF LEWIS AND CLARK','STEPHEN AMBROSE');
Insert into BOOKSHELF_AUTHOR values
('JOURNALS OF LEWIS AND CLARK','BERNARD DE VOTO');
Insert into BOOKSHELF_AUTHOR values
('GOSPEL','WILTON BARNHARDT');
Insert into BOOKSHELF_AUTHOR values
('EMMA WHO SAVED MY LIFE','WILTON BARNHARDT');
Insert into BOOKSHELF_AUTHOR values
('MIDNIGHT MAGIC','AVI');
Insert into BOOKSHELF_AUTHOR values
('HARRY POTTER AND THE GOBLET OF FIRE','J. K. ROWLING');
Insert into BOOKSHELF_AUTHOR values
('SHOELESS JOE','W. P. KINSELLA');
Insert into BOOKSHELF_AUTHOR values
('BOX SOCIALS','W. P. KINSELLA');
Insert into BOOKSHELF_AUTHOR values
('TRUMPET OF THE SWAN','E. B. WHITE');
Insert into BOOKSHELF_AUTHOR values
('CHARLOTTE''S WEB','E. B. WHITE');
Insert into BOOKSHELF_AUTHOR values
('WEST WITH THE NIGHT','BERYL MARKHAM');
Insert into BOOKSHELF_AUTHOR values
('THE GOOD BOOK','PETER GOMES');
Insert into BOOKSHELF_AUTHOR values
('PREACHING TO HEAD AND HEART','THOMAS SWEARS');
Insert into BOOKSHELF_AUTHOR values
('THE COST OF DISCIPLESHIP','DIETRICH BONHOEFFER');
Insert into BOOKSHELF_AUTHOR values
('THE SHIPPING NEWS','E. ANNIE PROULX');

commit;


rem ****************************
rem The BOOKSHELF_CHECKOUT Table
rem ****************************

drop table BOOKSHELF_CHECKOUT;
create table BOOKSHELF_CHECKOUT
(Name  VARCHAR2(25),
 Title VARCHAR2(100),
 CheckoutDate  DATE,
 ReturnedDate  DATE);

Insert into BOOKSHELF_CHECKOUT values
('JED HOPKINS','INNUMERACY','01-JAN-02','22-JAN-02');
Insert into BOOKSHELF_CHECKOUT values
('GERHARDT KENTGEN','WONDERFUL LIFE','02-JAN-02','02-FEB-02');
Insert into BOOKSHELF_CHECKOUT values
('DORAH TALBOT','EITHER/OR','02-JAN-02','10-JAN-02');
Insert into BOOKSHELF_CHECKOUT values
('EMILY TALBOT','ANNE OF GREEN GABLES','02-JAN-02','20-JAN-02');
Insert into BOOKSHELF_CHECKOUT values
('PAT LAVAY','THE SHIPPING NEWS','02-JAN-02','12-JAN-02');
Insert into BOOKSHELF_CHECKOUT values
('ROLAND BRANDT','THE SHIPPING NEWS','12-JAN-02','12-MAR-02');
Insert into BOOKSHELF_CHECKOUT values
('ROLAND BRANDT','THE DISCOVERERS','12-JAN-02','01-MAR-02');
Insert into BOOKSHELF_CHECKOUT values
('ROLAND BRANDT','WEST WITH THE NIGHT','12-JAN-02','01-MAR-02');
Insert into BOOKSHELF_CHECKOUT values
('EMILY TALBOT','MIDNIGHT MAGIC','20-JAN-02','03-FEB-02');
Insert into BOOKSHELF_CHECKOUT values
('EMILY TALBOT','HARRY POTTER AND THE GOBLET OF FIRE','03-FEB-02','14-FEB-02');
Insert into BOOKSHELF_CHECKOUT values
('PAT LAVAY','THE MISMEASURE OF MAN','12-JAN-02','12-FEB-02');
Insert into BOOKSHELF_CHECKOUT values
('DORAH TALBOT','POLAR EXPRESS','01-FEB-02','15-FEB-02');
Insert into BOOKSHELF_CHECKOUT values
('DORAH TALBOT','GOOD DOG, CARL','01-FEB-02','15-FEB-02');
Insert into BOOKSHELF_CHECKOUT values
('GERHARDT KENTGEN','THE MISMEASURE OF MAN','13-FEB-02','05-MAR-02');
Insert into BOOKSHELF_CHECKOUT values
('FRED FULLER','JOHN ADAMS','01-FEB-02','01-MAR-02');
Insert into BOOKSHELF_CHECKOUT values
('FRED FULLER','TRUMAN','01-MAR-02','20-MAR-02');
Insert into BOOKSHELF_CHECKOUT values
('JED HOPKINS','TO KILL A MOCKINGBIRD','15-FEB-02','01-MAR-02');
Insert into BOOKSHELF_CHECKOUT values
('DORAH TALBOT','MY LEDGER','15-FEB-02','03-MAR-02');
Insert into BOOKSHELF_CHECKOUT values
('GERHARDT KENTGEN','MIDNIGHT MAGIC','05-FEB-02','10-FEB-02');

commit;


rem ******************
rem The BORROWER Table
rem ******************

rem  Requires that the TOOLS_VA datatype be created first.

create table BORROWER
(Name          VARCHAR2(25),
 Tools         TOOLS_VA,
constraint BORROWER_PK primary key (Name));

insert into BORROWER values
('JED HOPKINS',
  TOOLS_VA('HAMMER','SLEDGE','AX'));


rem *****************
rem The BREEDER Table
rem *****************

rem  Requires that the ANIMAL_TY and ANIMALS_NT types
rem    already exist.

create table BREEDER (
BreederName      VARCHAR2(25),
Animals          ANIMALS_NT)
nested table ANIMALS store as ANIMALS_NT_TAB;


rem ******************
rem The BREEDING Table
rem ******************

drop table BREEDING;
create table BREEDING (
Offspring     VARCHAR2(10),
Sex           CHAR(1),
Cow           VARCHAR2(10),
Bull          VARCHAR2(10),
Birthdate     DATE
);

insert into BREEDING values ('EVE','F',null,null,null);
insert into BREEDING values ('ADAM','M',null,null,null);
insert into BREEDING values ('BANDIT','M',null,null,null);
insert into BREEDING values ('BETSY','F','EVE','ADAM',
   TO_DATE('02-JAN-1900','DD-MON-YYYY'));
insert into BREEDING values ('POCO','M','EVE','ADAM',
   TO_DATE('15-JUL-1900','DD-MON-YYYY'));
insert into BREEDING values ('GRETA','F','EVE','BANDIT',
   TO_DATE('12-MAR-1901','DD-MON-YYYY'));
insert into BREEDING values ('MANDY','F','EVE','POCO',
   TO_DATE('22-AUG-1902','DD-MON-YYYY'));
insert into BREEDING values ('NOVI','F','BETSY','ADAM',
   TO_DATE('30-MAR-1903','DD-MON-YYYY'));
insert into BREEDING values ('GINNY','F','BETSY','BANDIT',
   TO_DATE('04-DEC-1903','DD-MON-YYYY'));
insert into BREEDING values ('CINDY','F','EVE','POCO',
   TO_DATE('09-FEB-1903','DD-MON-YYYY'));
insert into BREEDING values ('DUKE','M','MANDY','BANDIT',
   TO_DATE('24-JUL-1904','DD-MON-YYYY'));
insert into BREEDING values ('TEDDI','F','BETSY','BANDIT',
   TO_DATE('12-AUG-1905','DD-MON-YYYY'));
insert into BREEDING values ('SUZY','F','GINNY','DUKE',
   TO_DATE('03-APR-1906','DD-MON-YYYY'));
insert into BREEDING values ('RUTH','F','GINNY','DUKE',
   TO_DATE('25-DEC-1906','DD-MON-YYYY'));
insert into BREEDING values ('PAULA','F','MANDY','POCO',
   TO_DATE('21-DEC-1906','DD-MON-YYYY'));
insert into BREEDING values ('DELLA','F','SUZY','BANDIT',
   TO_DATE('11-OCT-1908','DD-MON-YYYY'));


rem ******************
rem The CATEGORY Table
rem ******************

drop table CATEGORY;
create table CATEGORY
(CategoryName  VARCHAR2(12) primary key,
ParentCategory  VARCHAR2(8),
SubCategory VARCHAR2(20));

Insert into CATEGORY values
('ADULTREF','ADULT','REFERENCE');
Insert into CATEGORY values
('ADULTFIC','ADULT','FICTION');
Insert into CATEGORY values
('ADULTNF','ADULT','NONFICTION');
Insert into CATEGORY values
('CHILDRENPIC','CHILDREN','PICTURE BOOK');
Insert into CATEGORY values
('CHILDRENFIC','CHILDREN','FICTION');
Insert into CATEGORY values
('CHILDRENNF','CHILDREN','NONFICTION');

commit;


rem ************
rem The CD Table
rem ************

drop table CD;
create table CD (
Account      NUMBER not null,
Amount       NUMBER not null,
MaturityDate DATE not null
);

insert into CD values (573334, 10000,
   TO_DATE('15-JAN-2009','DD-MON-YYYY'));
insert into CD values (677654, 25000,
   TO_DATE('15-JAN-2001','DD-MON-YYYY'));
insert into CD values (976032, 10000,
   TO_DATE('15-JAN-1995','DD-MON-YYYY'));
insert into CD values (275031, 10000,
   TO_DATE('15-JAN-1997','DD-MON-YYYY'));
insert into CD values (274598, 20000,
   TO_DATE('15-JAN-1999','DD-MON-YYYY'));
insert into CD values (538365, 45000,
   TO_DATE('15-JAN-2001','DD-MON-YYYY'));
insert into CD values (267432, 16500,
   TO_DATE('15-JAN-2004','DD-MON-YYYY'));


rem *****************
rem The COMFORT Table
rem *****************

drop table COMFORT;
create table COMFORT (
City          VARCHAR2(13) NOT NULL,
SampleDate    DATE NOT NULL,
Noon          NUMBER(3,1),
Midnight      NUMBER(3,1),
Precipitation NUMBER
);

insert into COMFORT values ('SAN FRANCISCO',
   TO_DATE('21-MAR-2003','DD-MON-YYYY'),62.5,42.3,.5);
insert into COMFORT values ('SAN FRANCISCO',
   TO_DATE('22-JUN-2003','DD-MON-YYYY'),51.1,71.9,.1);
insert into COMFORT values ('SAN FRANCISCO',
   TO_DATE('23-SEP-2003','DD-MON-YYYY'),NULL,61.5,.1);
insert into COMFORT values ('SAN FRANCISCO',
   TO_DATE('22-DEC-2003','DD-MON-YYYY'),52.6,39.8,2.3);
insert into COMFORT values ('KEENE',
   TO_DATE('21-MAR-2003','DD-MON-YYYY'),39.9,-1.2,4.4);
insert into COMFORT values ('KEENE',
   TO_DATE('22-JUN-2003','DD-MON-YYYY'),85.1,66.7,1.3);
insert into COMFORT values ('KEENE',
   TO_DATE('23-SEP-2003','DD-MON-YYYY'),99.8,82.6,NULL);
insert into COMFORT values ('KEENE',
   TO_DATE('22-DEC-2003','DD-MON-YYYY'),-7.2,-1.2,3.9);


rem ******************
rem The COMFORT2 Table
rem ******************

drop table COMFORT2;
create table COMFORT2 (
City          VARCHAR2(13) NOT NULL,
SampleDate    DATE NOT NULL,
Noon          NUMBER(3,1),
Midnight      NUMBER(3,1),
Precipitation NUMBER
);


rem **********************
rem The COMFORT_TEST Table
rem **********************

drop table COMFORT_TEST;
create table COMFORT_TEST (
City          VARCHAR2(13) NOT NULL,
SampleDate    DATE NOT NULL,
Measure       VARCHAR2(10),
Value         NUMBER(3,1)
);


rem *******************
rem The CONTINENT Table
rem *******************

drop table CONTINENT;
create table CONTINENT (
 Continent    VARCHAR2(30));


rem *****************
rem The COUNTRY Table
rem *****************

drop table COUNTRY;
create table COUNTRY (
Country      VARCHAR2(30) not null,
Continent    VARCHAR2(30));


rem ******************
rem The CUSTOMER Table
rem ******************

rem  Requires that the ADDRESS_TY and PERSON_TY types already
rem  exist.

create table CUSTOMER (
Customer_ID    NUMBER,
Person         PERSON_TY
);

insert into CUSTOMER VALUES
(1,
 PERSON_TY('NEIL MULLANE',
            ADDRESS_TY('57 MT PLEASANT ST',
                       'FINN', 'NH', 11111)));
insert into CUSTOMER VALUES
(2,
 PERSON_TY('SEYMOUR HESTER',
            ADDRESS_TY('1 STEPAHEAD RD',
                       'BRIANT', 'NH', 11111)));


rem ***************
rem The EMPTY Table
rem ***************

drop table EMPTY;
create table EMPTY (
Nothing       VARCHAR2(25),
Less          NUMBER
);

REMARK No inserts. This table is empty.


rem *****************
rem The HOLIDAY Table
rem *****************

drop table HOLIDAY;
create table HOLIDAY (
Holiday        VARCHAR2(25),
ActualDate     DATE,
CelebratedDate DATE
);

insert into HOLIDAY values ('NEW YEARS DAY',
   TO_DATE('01-JAN-2004','DD-MON-YYYY'),
   TO_DATE('01-JAN-2004','DD-MON-YYYY'));
insert into HOLIDAY values ('MARTIN LUTHER KING, JR.',
   TO_DATE('15-JAN-2004','DD-MON-YYYY'),
   TO_DATE('19-JAN-2004','DD-MON-YYYY'));
insert into HOLIDAY values ('LINCOLNS BIRTHDAY',
   TO_DATE('12-FEB-2004','DD-MON-YYYY'),
   TO_DATE('16-FEB-2004','DD-MON-YYYY'));
insert into HOLIDAY values ('WASHINGTONS BIRTHDAY',
   TO_DATE('22-FEB-2004','DD-MON-YYYY'),
   TO_DATE('16-FEB-2004','DD-MON-YYYY'));
insert into HOLIDAY values ('FAST DAY, NEW HAMPSHIRE',
   TO_DATE('22-FEB-2004','DD-MON-YYYY'),
   TO_DATE('22-FEB-2004','DD-MON-YYYY'));
insert into HOLIDAY values ('MEMORIAL DAY',
   TO_DATE('30-MAY-2004','DD-MON-YYYY'),
   TO_DATE('31-MAY-2004','DD-MON-YYYY'));
insert into HOLIDAY values ('INDEPENDENCE DAY',
   TO_DATE('04-JUL-2004','DD-MON-YYYY'),
   TO_DATE('04-JUL-2004','DD-MON-YYYY'));
insert into HOLIDAY values ('LABOR DAY',
   TO_DATE('06-SEP-2004','DD-MON-YYYY'),
   TO_DATE('06-SEP-2004','DD-MON-YYYY'));
insert into HOLIDAY values ('COLUMBUS DAY',
   TO_DATE('12-OCT-2004','DD-MON-YYYY'),
   TO_DATE('11-OCT-2004','DD-MON-YYYY'));
insert into HOLIDAY values ('THANKSGIVING',
   TO_DATE('25-NOV-2004','DD-MON-YYYY'),
   TO_DATE('25-NOV-2004','DD-MON-YYYY'));


rem ******************
rem The LOCATION Table
rem ******************

drop table LOCATION;
create table LOCATION (
City       VARCHAR2(25),
Country    VARCHAR2(25),
Continent  VARCHAR2(25),
Latitude   NUMBER,
NorthSouth CHAR(1),
Longitude  NUMBER,
EastWest   CHAR(1)
);

insert into LOCATION values (
  'ATHENS','GREECE','EUROPE',37.58,'N',23.43,'E');
insert into LOCATION values (
  'CHICAGO','UNITED STATES','NORTH AMERICA',41.53,'N',87.38,'W');
insert into LOCATION values (
  'CONAKRY','GUINEA','AFRICA',9.31,'N',13.43,'W');
insert into LOCATION values (
  'LIMA','PERU','SOUTH AMERICA',12.03,'S',77.03,'W');
insert into LOCATION values (
  'MADRAS','INDIA','INDIA',13.05,'N',80.17,'E');
insert into LOCATION values (
  'MANCHESTER','ENGLAND','EUROPE',53.30,'N',2.15,'W');
insert into LOCATION values (
  'MOSCOW','RUSSIA','EUROPE',55.45,'N',37.35,'E');
insert into LOCATION values (
  'PARIS','FRANCE','EUROPE',48.52,'N',2.20,'E');
insert into LOCATION values (
  'SHENYANG','CHINA','CHINA',41.48,'N',123.27,'E');
insert into LOCATION values (
  'ROME','ITALY','EUROPE',41.54,'N',12.29,'E');
insert into LOCATION values (
  'TOKYO','JAPAN','ASIA',35.42,'N',139.46,'E');
insert into LOCATION values (
  'SYDNEY','AUSTRALIA','AUSTRALIA',33.52,'S',151.13,'E');
insert into LOCATION values (
  'SPARTA','GREECE','EUROPE',37.05,'N',22.27,'E');
insert into LOCATION values (
  'MADRID','SPAIN','EUROPE',40.24,'N',3.41,'W');


rem ******************
rem The MAGAZINE Table
rem ******************

drop table magazine;
create table magazine (
Name       VARCHAR2(16),
Title      VARCHAR2(37),
Author     VARCHAR2(25),
IssueDate  DATE,
Page       NUMBER
);

insert into MAGAZINE values (
  'BERTRAND MONTHLY','THE BARBERS WHO SHAVE THEMSELVES.',
  'BONHOEFFER, DIETRICH',
  TO_DATE('23-MAY-1988','DD-MON-YYYY'),70);
insert into MAGAZINE values (
  'LIVE FREE OR DIE','"HUNTING THOREAU IN NEW HAMPSHIRE"',
  'CHESTERTON, G.K.',
  TO_DATE('26-AUG-1981','DD-MON-YYYY'),320);
insert into MAGAZINE values (
  'PSYCHOLOGICA','THE ETHNIC NEIGHBORHOOD',
  'RUTH, GEORGE HERMAN',
  TO_DATE('18-SEP-1919','DD-MON-YYYY'),246);
insert into MAGAZINE values (
  'FADED ISSUES','RELATIONAL DESIGN AND ENTHALPY',
  'WHITEHEAD, ALFRED',
  TO_DATE('20-JUN-1926','DD-MON-YYYY'),279);
insert into MAGAZINE values (
  'ENTROPY WIT','"INTERCONTINENTAL RELATIONS."',
  'CROOKES, WILLIAM',
  TO_DATE('20-SEP-1950','DD-MON-YYYY'),20);


rem **************
rem The MATH Table
rem **************

drop table MATH;
create table MATH (
Name          VARCHAR2(12),
Above         NUMBER,
Below         NUMBER,
Empty         NUMBER
);

insert into MATH values ('WHOLE NUMBER',11,-22,null);
insert into MATH values ('LOW DECIMAL',33.33,-44.44,null);
insert into MATH values ('MID DECIMAL',55.5,-55.5,null);
insert into MATH values ('HIGH DECIMAL',66.666,-77.777,null);


rem **************
rem The NAME Table
rem **************

drop table NAME;
create table NAME (
Name         VARCHAR2(25)
);

insert into NAME values ('HORATIO NELSON');
insert into NAME values ('VALDO');
insert into NAME values ('MARIE DE MEDICIS');
insert into NAME values ('FLAVIUS JOSEPHUS');
insert into NAME values ('EDYTHE P. M. GAMMIERE');


rem *******************
rem The NEWSPAPER Table
rem *******************

drop table NEWSPAPER;
create table NEWSPAPER (
Feature      VARCHAR2(15) not null,
Section      CHAR(1),
Page         NUMBER
);

insert into NEWSPAPER values ('National News', 'A', 1);
insert into NEWSPAPER values ('Sports', 'D', 1);
insert into NEWSPAPER values ('Editorials', 'A', 12);
insert into NEWSPAPER values ('Business', 'E', 1);
insert into NEWSPAPER values ('Weather', 'C', 2);
insert into NEWSPAPER values ('Television', 'B', 7);
insert into NEWSPAPER values ('Births', 'F', 7);
insert into NEWSPAPER values ('Classified', 'F', 8);
insert into NEWSPAPER values ('Modern Life', 'B', 1);
insert into NEWSPAPER values ('Comics', 'C', 4);
insert into NEWSPAPER values ('Movies', 'B', 4);
insert into NEWSPAPER values ('Bridge', 'B', 2);
insert into NEWSPAPER values ('Obituaries', 'F', 6);
insert into NEWSPAPER values ('Doctor Is In', 'F', 6);


rem ********************
rem The NUMBERTEST Table
rem ********************

drop table NUMBERTEST;
create table NUMBERTEST (
Value1        NUMBER,
Value2        NUMBER,
Value3        NUMBER(10,2)
);

insert into NUMBERTEST values (0,0,0);
insert into NUMBERTEST values (.0001,.0001,.0001);
insert into NUMBERTEST values (1234,1234,1234);
insert into NUMBERTEST values (1234.5,1234.5,1234.5);
insert into NUMBERTEST values (null,null,null);
insert into NUMBERTEST values (1234.56,1234.56,1234.56);
insert into NUMBERTEST values (1234.567,1234.567,1234.567);
insert into NUMBERTEST values
     (98761234.567,98761234.567,98761234.567);


rem ****************
rem The PAYDAY Table
rem ****************

drop table PAYDAY;
create table PAYDAY (
CycleDate      DATE
);

insert into PAYDAY values (TO_DATE('15-JAN-2004','DD-MON-YYYY'));
insert into PAYDAY values (TO_DATE('15-FEB-2004','DD-MON-YYYY'));
insert into PAYDAY values (TO_DATE('15-MAR-2004','DD-MON-YYYY'));
insert into PAYDAY values (TO_DATE('15-APR-2004','DD-MON-YYYY'));
insert into PAYDAY values (TO_DATE('15-MAY-2004','DD-MON-YYYY'));
insert into PAYDAY values (TO_DATE('15-JUN-2004','DD-MON-YYYY'));
insert into PAYDAY values (TO_DATE('15-JUL-2004','DD-MON-YYYY'));
insert into PAYDAY values (TO_DATE('15-AUG-2004','DD-MON-YYYY'));
insert into PAYDAY values (TO_DATE('15-SEP-2004','DD-MON-YYYY'));
insert into PAYDAY values (TO_DATE('15-OCT-2004','DD-MON-YYYY'));
insert into PAYDAY values (TO_DATE('15-NOV-2004','DD-MON-YYYY'));
insert into PAYDAY values (TO_DATE('15-DEC-2004','DD-MON-YYYY'));


rem ******************
rem The PROPOSAL Table
rem ******************

drop table PROPOSAL;
create table PROPOSAL
(Proposal_ID        NUMBER(10) primary key,
 Recipient_Name     VARCHAR2(25),
 Proposal_Name      VARCHAR2(25),
 Short_Description  VARCHAR2(1000),
 Proposal_Text      CLOB,
 Budget             BLOB,
 Cover_Letter       BFILE);


rem *********************
rem The RADIUS_VALS Table
rem *********************

drop table RADIUS_VALS;
create table RADIUS_VALS
(Radius      NUMBER(5));

insert into RADIUS_VALS values (3);


rem ****************
rem The RATING Table
rem ****************

drop table RATING;
create table RATING
(Rating  VARCHAR2(2),
RatingDescription VARCHAR2(50));

Insert into RATING values ('1','ENTERTAINMENT');
Insert into RATING values ('2','BACKGROUND INFORMATION');
Insert into RATING values ('3','RECOMMENDED');
Insert into RATING values ('4','STRONGLY RECOMMENDED');
Insert into RATING values ('5','REQUIRED READING');
commit;


rem **************
rem The ROSE Table
rem **************

drop table ROSE;
create table ROSE (
Lodging       VARCHAR2(12)
);

insert into ROSE values ('ROSELYN');
insert into ROSE values ('ROSE HILL');
insert into ROSE values ('ROSE GARDEN');
insert into ROSE values ('ROSE');


rem ******************
rem The SHIPPING Table
rem ******************

drop table SHIPPING;
create table SHIPPING (
Client        VARCHAR2(13),
Weight        NUMBER
);

insert into SHIPPING values ('JOHNSON TOOL',59);
insert into SHIPPING values ('DAGG SOFTWARE',27);
insert into SHIPPING values ('TULLY ANDOVER',NULL);


rem ***************
rem The STOCK Table
rem ***************

drop table STOCK;
create table STOCK (
Company      VARCHAR2(20),
Symbol       VARCHAR2(6),
Industry     VARCHAR2(15),
CloseYesterday NUMBER(6,2),
CloseToday     NUMBER(6,2),
Volume         NUMBER
);

insert into STOCK values (
  'AD SPECIALTY', 'ADSP', 'ADVERTISING',  31.75, 31.75,
   18333876);
insert into STOCK values (
  'APPLE CANNERY', 'APCN', 'AGRICULTURE',  33.75, 36.50,
   25787229);
insert into STOCK values (
  'AT SPACE', 'ATR' , 'MEDICAL', 46.75, 48.00,
   11398323);
insert into STOCK values (
  'AUGUST ENTERPRISES', 'AGE', 'MEDICAL', 15.00, 15.00,
   12221711);
insert into STOCK values (
  'BRANDON ELLIPSIS', 'BELP', 'SPACE', 32.75, 33.50,
  25789769);
insert into STOCK values (
  'GENERAL ENTROPY','GENT', 'SPACE', 64.25, 66.00,
   7598562);
insert into STOCK values (
  'GENEVA ROCKETRY', 'GENR', 'SPACE', 22.75, 27.25,
   22533944);
insert into STOCK values (
  'HAYWARD ANTISEPTIC',  'HAYW', 'MEDICAL', 104.25,  106.00,
   3358561);
insert into STOCK values (
  'IDK', 'IDK', 'ELECTRONICS',  95.00, 95.25,
   9443523);
insert into STOCK values (
  'INDIA COSMETICS','INDI', 'COSMETICS', 30.75, 30.75,
   8134878);
insert into STOCK values (
  'ISAIAH JAMES STORAGE', 'IJS', 'TRANSPORTATION', 13.25, 13.75,
   22112171);
insert into STOCK values (
  'KDK AIRLINES',  'KDK', 'TRANSPORTATION', 85.00, 85.25,
   7481566);
insert into STOCK values (
  'KENTGEN BIOPHYSICS',  'KENT', 'MEDICAL', 18.25, 19.50,
   6636863);
insert into STOCK values (
  'LAVAY COSMETICS', 'LAVA', 'COSMETICS', 21.50, 22.00,
   3341542);
insert into STOCK values (
  'LOCAL DEVELOPMENT',  'LOCD', 'AGRICULTURE',  26.75, 27.25,
   2596934);
insert into STOCK values (
  'MAXTIDE'  , 'MAXT', 'TRANSPORTATION', 8.25, 8.00,
   2836893);
insert into STOCK values (
  'MBK COMMUNICATIONS', 'MBK', 'ADVERTISING',  43.25, 41.00,
   10022980);
insert into STOCK values (
  'MEMORY GRAPHICS', 'MEMG', 'ELECTRONICS',  15.50, 14.25,
   4557992);
insert into STOCK values (
'MICRO TOKEN', 'MICT', 'ELECTRONICS',  77.00, 76.50,
   25205667);
insert into STOCK values (
  'NANCY LEE FEATURES', 'NLF', 'ADVERTISING',  13.50, 14.25,
   14222692);
insert into STOCK values (
  'NORTHERN BOREAL', 'NBOR', 'SPACE', 26.75, 28.00,
   1348323);
insert into STOCK values (
  'OCKHAM SYSTEMS', 'OCKS', 'SPACE', 21.50, 22.00,
   7052990);
insert into STOCK values (
  'OSCAR COAL DRAYAGE', 'OCD', 'TRANSPORTATION', 87.00, 88.50,
   25798992);
insert into STOCK values (
  'ROBERT JAMES APPAREL', 'RJAP', 'GARMENT', 23.25, 24.00,
   19032481);
insert into STOCK values (
  'SOUP SENSATIONS','SOUP', 'AGRICULTURE',  16.25, 16.75,
   22574879);
insert into STOCK values (
  'WONDER LABS', 'WOND', 'SPACE', 5.00, 5.00,
   2553712);


rem ***********************
rem The STOCK_ACCOUNT table
rem ***********************

drop table STOCK_ACCOUNT;
create table STOCK_ACCOUNT
(Account  NUMBER(10),
AccountLongName  VARCHAR2(50));

insert into STOCK_ACCOUNT values (
1234, 'ADAMS');
insert into STOCK_ACCOUNT values (
7777, 'BURLINGTON');
commit;


rem *******************
rem The STOCK_TRX Table
rem *******************

drop table STOCK_TRX;

create table STOCK_TRX (
Account  NUMBER(10),
Symbol  VARCHAR2(20),
Price  NUMBER(6,2),
Quantity  NUMBER(6),
Trx_Flag  VARCHAR2(1));

insert into STOCK_TRX values (
  1234, 'ADSP', 31.75, 100, 'B');
insert into STOCK_TRX values (
  7777, 'ADSP', 31.50, 300, 'S');
insert into STOCK_TRX values (
  1234, 'ADSP', 31.55, 100, 'B');
insert into STOCK_TRX values (
  7777, 'OCKS', 21.75, 1000, 'B');
commit;


rem *****************
rem The TROUBLE Table
rem *****************

drop table TROUBLE;
create table TROUBLE (
City          VARCHAR2(13) NOT NULL,
SampleDate    DATE NOT NULL,
Noon          NUMBER(3,1),
Midnight      NUMBER(3,1),
Precipitation NUMBER
);

insert into TROUBLE values ('PLEASANT LAKE',
  '21-MAR-01', 39.99, -1.31, 3.6);
insert into TROUBLE values ('PLEASANT LAKE',
  '22-JUN-01', 101.44, 86.2, 1.63);
insert into TROUBLE values ('PLEASANT LAKE',
  '23-SEP-01', 92.85, 79.6, 1.00003);
insert into TROUBLE values ('PLEASANT LAKE',
  '22-DEC-01', -17.445, -10.4, 2.4);


rem *****************
rem The TWONAME Table
rem *****************

drop table TWONAME;
create table TWONAME (
FirstName    VARCHAR2(25),
LastName     VARCHAR2(25)
);


rem *****************
rem The WEATHER Table
rem *****************

drop table WEATHER;
create table WEATHER (
City         VARCHAR2(11),
Temperature  NUMBER,
Humidity     NUMBER,
Condition    VARCHAR2(9)
);

insert into WEATHER values ('LIMA',45,79,'RAIN');
insert into WEATHER values ('PARIS',81,62,'CLOUDY');
insert into WEATHER values ('MANCHESTER',66,98,'FOG');
insert into WEATHER values ('ATHENS',97,89,'SUNNY');
insert into WEATHER values ('CHICAGO',66,88,'RAIN');
insert into WEATHER values ('SYDNEY',69,99,'SUNNY');
insert into WEATHER values ('SPARTA',74,63,'CLOUDY');
	

