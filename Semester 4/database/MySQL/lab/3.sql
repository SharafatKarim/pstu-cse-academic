-- lab 03

use university;


-- classroom test
select * from classroom;

-- # building, room_number, capacity
-- 'Alumni', '143', '47'
-- 'Alumni', '547', '26'
-- 'black', '431', '1000'
-- 'Bronfman', '700', '12'
-- 'Chandler', '375', '10'
-- 'Chandler', '804', '11'
-- 'dark', '431', '9999'
-- 'Drown', '757', '18'
-- 'Fairchild', '145', '27'
-- 'Garfield', '119', '59'
-- 'Gates', '314', '10'
-- 'Gates', '707', '65'
-- 'Grace', '40', '34'
-- 'Lambeau', '348', '51'
-- 'Lamberton', '134', '10'
-- 'Lamberton', '143', '10'
-- 'Main', '425', '22'
-- 'Main', '45', '30'
-- 'Nassau', '45', '92'
-- 'Painter', '86', '97'
-- 'pink', '431', '9999'
-- 'Polya', '808', '28'
-- 'Power', '717', '12'
-- 'Power', '972', '10'
-- 'Rathbone', '261', '60'
-- 'Saucon', '113', '109'
-- 'Saucon', '180', '15'
-- 'Saucon', '844', '24'
-- 'Stabler', '105', '113'
-- 'Taylor', '183', '71'
-- 'Taylor', '812', '115'
-- 'White', '432', '100'
-- 'Whitman', '134', '120'
-- 'Whitman', '434', '32'

describe classroom;

insert into classroom ( building, room_number, capacity )
value ("dark", 431, 9999);

-- 10:29:15	insert into classroom ( building, room_number, capacity ) value ("dark", 431, 9999)	1 row(s) affected	0.0036 sec

CREATE TABLE department (
    dept_name VARCHAR(20),
    building VARCHAR(15),
    budget NUMERIC(12 , 2 ),
    PRIMARY KEY (dept_name)
); 




