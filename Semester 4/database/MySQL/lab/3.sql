	-- lab 03

	create database universipedia;
	use universipedia;


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

	CREATE TABLE department (
		dept_name VARCHAR(20),
		building VARCHAR(15),
		budget NUMERIC(12 , 2 ),
		PRIMARY KEY (dept_name)
	);

	create table course (
		course_id varchar(7),
		title varchar(50),
		dept_name varchar (20),
		credits numeric (2, 0),
		primary key (course_id),
		foreign key (dept_name) references department(dept_name)
	);

	create table instructor (
		ID varchar(5),
		number varchar (20) not null,
		dept_name varchar (20),
		salary numeric(8,2),
		primary key (ID),
		foreign key (dept_name) references department
	);

	CREATE TABLE section (
		course_id VARCHAR(8),
		sec_id VARCHAR(8),
		semester VARCHAR(6),
		year NUMERIC(4 , 0 ),
		building VARCHAR(15),
		room_number VARCHAR(7),
		time_slot_id VARCHAR(4),
		PRIMARY KEY (course_id , sec_id , semester , year),
		FOREIGN KEY (course_id)
			REFERENCES course
	);

	create table teaches (
		ID varchar (5),
		course_id varchar(8),
		sec_id varchar(8),
		semester varchar(6),
		year numeric (4, 0),
		primary key (ID, course_id, sec_id, semester, year),
		foreign key (course_id, sec_id, semester, year) references section,
		foreign key (ID) references instructor
	);

	DROP TABLE IF EXISTS parent;

	CREATE TABLE parent (
		Name VARCHAR(1),
		Age NUMERIC(2, 0),
		PRIMARY KEY (Name, Age)
	);

	DESCRIBE parent;

	CREATE TABLE child (
		Name VARCHAR(1),
		Age NUMERIC(2, 0),
		PRIMARY KEY (Name, Age),
		FOREIGN KEY (Name, Age)
			REFERENCES parent (Name, Age)
	);

	drop table child;
	desc child;

	-- 11:01:04	create table course (  course_id varchar(7),     title varchar(50),     dept_name varchar (20),     credits numeric (2, 0),     primary key (course_id),     foreign key (dept_name) references department(dept_name) )	0 row(s) affected	0.020 sec
	-- 11:03:46	create table instructor (  ID varchar(5),     number varchar (20) not null,     dept_name varchar (20),     salary numeric(8,2),     primary key (ID),     foreign key (dept_name) references department )	0 row(s) affected	0.022 sec
	-- 11:06:53	create table section (  course_id varchar(8),     sec_id varchar(8),     semester varchar (6),     year numeric(4, 0),     building varchar (15),     room_number varchar(7),     time_slot_id varchar(4),     primary key (course_id, sec_id, semester, year),     foreign key (course_id) references course )	0 row(s) affected	0.025 sec
	-- 11:14:51	create table teaches (  ID varchar (5),     course_id varchar(8),     sec_id varchar(8),     semester varchar(6),     year numeric (4, 0),     primary key (ID, course_id, sec_id, semester, year),     foreign key (course_id, sec_id, semester, year) references section,     foreign key (ID) references instructor )	0 row(s) affected	0.028 sec

	-- use university
	use university;

	-- select name from instructor
	select name from instructor;

	-- 'Lembr'
	-- 'Bawa'
	-- 'Yazdi'
	-- 'Wieland'
	-- 'DAgostino'
	-- 'Liley'
	-- 'Kean'
	-- 'Atanassov'
	-- 'Moreira'
	-- 'Gustafsson'
	-- 'Bourrier'
	-- 'Bondi'
	-- 'Soisalon-Soininen'
	-- 'Morris'
	-- 'Arias'
	-- 'Murata'
	-- 'Tung'
	-- 'Luo'
	-- 'Vicentino'
	-- 'Romero'
	-- 'Lent'
	-- 'Sarkar'
	-- 'Shuming'
	-- 'Konstantinides'
	-- 'Bancilhon'
	-- 'Hau'
	-- 'Dusserre'
	-- 'Desyl'
	-- 'Jaekel'
	-- 'McKinnon'
	-- 'Gutierrez'
	-- 'Mingoz'
	-- 'Pimenta'
	-- 'Yin'
	-- 'Sullivan'
	-- 'Voronina'
	-- 'Kenje'
	-- 'Mahmoud'
	-- 'Pingr'
	-- 'Ullman '
	-- 'Levine'
	-- 'Queiroz'
	-- 'Valtchev'
	-- 'Bietzk'
	-- 'Choll'
	-- 'Arinb'
	-- 'Sakurai'
	-- 'Mird'
	-- 'Bertolino'
	-- 'Dale'

	-- select departments from instructor
	select dept_name from instructor;

	-- 'Accounting'
	-- 'Accounting'
	-- 'Accounting'
	-- 'Accounting'
	-- 'Astronomy'
	-- 'Athletics'
	-- 'Athletics'
	-- 'Athletics'
	-- 'Athletics'
	-- 'Athletics'
	-- 'Biology'
	-- 'Biology'
	-- 'Comp. Sci.'
	-- 'Comp. Sci.'
	-- 'Cybernetics'
	-- 'Cybernetics'
	-- 'Cybernetics'
	-- 'Cybernetics'
	-- 'Elec. Eng.'
	-- 'Elec. Eng.'
	-- 'Elec. Eng.'
	-- 'Elec. Eng.'
	-- 'English'
	-- 'English'
	-- 'English'
	-- 'English'
	-- 'Finance'
	-- 'Geology'
	-- 'Languages'
	-- 'Languages'
	-- 'Languages'
	-- 'Marketing'
	-- 'Marketing'
	-- 'Marketing'
	-- 'Marketing'
	-- 'Mech. Eng.'
	-- 'Mech. Eng.'
	-- 'Physics'
	-- 'Physics'
	-- 'Pol. Sci.'
	-- 'Pol. Sci.'
	-- 'Pol. Sci.'
	-- 'Psychology'
	-- 'Psychology'
	-- 'Statistics'
	-- 'Statistics'
	-- 'Statistics'
	-- 'Statistics'
	-- 'Statistics'
	-- 'Statistics'

	-- select department names but with all
	select all dept_name from instructor;

	-- 'Accounting'
	-- 'Accounting'
	-- 'Accounting'
	-- 'Accounting'
	-- 'Astronomy'
	-- 'Athletics'
	-- 'Athletics'
	-- 'Athletics'
	-- 'Athletics'
	-- 'Athletics'
	-- 'Biology'
	-- 'Biology'
	-- 'Comp. Sci.'
	-- 'Comp. Sci.'
	-- 'Cybernetics'
	-- 'Cybernetics'
	-- 'Cybernetics'
	-- 'Cybernetics'
	-- 'Elec. Eng.'
	-- 'Elec. Eng.'
	-- 'Elec. Eng.'
	-- 'Elec. Eng.'
	-- 'English'
	-- 'English'
	-- 'English'
	-- 'English'
	-- 'Finance'
	-- 'Geology'
	-- 'Languages'
	-- 'Languages'
	-- 'Languages'
	-- 'Marketing'
	-- 'Marketing'
	-- 'Marketing'
	-- 'Marketing'
	-- 'Mech. Eng.'
	-- 'Mech. Eng.'
	-- 'Physics'
	-- 'Physics'
	-- 'Pol. Sci.'
	-- 'Pol. Sci.'
	-- 'Pol. Sci.'
	-- 'Psychology'
	-- 'Psychology'
	-- 'Statistics'
	-- 'Statistics'
	-- 'Statistics'
	-- 'Statistics'
	-- 'Statistics'
	-- 'Statistics'

	-- select only distinct departments from instructor
	select distinct dept_name from instructor;

	-- 'Accounting'
	-- 'Astronomy'
	-- 'Athletics'
	-- 'Biology'
	-- 'Comp. Sci.'
	-- 'Cybernetics'
	-- 'Elec. Eng.'
	-- 'English'
	-- 'Finance'
	-- 'Geology'
	-- 'Languages'
	-- 'Marketing'
	-- 'Mech. Eng.'
	-- 'Physics'
	-- 'Pol. Sci.'
	-- 'Psychology'
	-- 'Statistics'

	-- select all districts from instructor
	select distinct * from instructor;

	-- '14365', 'Lembr', 'Accounting', '32241.56'
	-- '15347', 'Bawa', 'Athletics', '72140.88'
	-- '16807', 'Yazdi', 'Athletics', '98333.65'
	-- '19368', 'Wieland', 'Pol. Sci.', '124651.41'
	-- '22591', 'DAgostino', 'Psychology', '59706.49'
	-- '25946', 'Liley', 'Languages', '90891.69'
	-- '28097', 'Kean', 'English', '35023.18'
	-- '28400', 'Atanassov', 'Statistics', '84982.92'
	-- '31955', 'Moreira', 'Accounting', '71351.42'
	-- '3199', 'Gustafsson', 'Elec. Eng.', '82534.37'
	-- '3335', 'Bourrier', 'Comp. Sci.', '80797.83'
	-- '34175', 'Bondi', 'Comp. Sci.', '115469.11'
	-- '35579', 'Soisalon-Soininen', 'Psychology', '62579.61'
	-- '36897', 'Morris', 'Marketing', '43770.36'
	-- '37687', 'Arias', 'Statistics', '104563.38'
	-- '4034', 'Murata', 'Athletics', '61387.56'
	-- '41930', 'Tung', 'Athletics', '50482.03'
	-- '4233', 'Luo', 'English', '88791.45'
	-- '42782', 'Vicentino', 'Elec. Eng.', '34272.67'
	-- '43779', 'Romero', 'Astronomy', '79070.08'
	-- '48507', 'Lent', 'Mech. Eng.', '107978.47'
	-- '48570', 'Sarkar', 'Pol. Sci.', '87549.80'
	-- '50330', 'Shuming', 'Physics', '108011.81'
	-- '50885', 'Konstantinides', 'Languages', '32570.50'
	-- '52647', 'Bancilhon', 'Pol. Sci.', '87958.01'
	-- '57180', 'Hau', 'Accounting', '43966.29'
	-- '58558', 'Dusserre', 'Marketing', '66143.25'
	-- '59795', 'Desyl', 'Languages', '48803.38'
	-- '63287', 'Jaekel', 'Athletics', '103146.87'
	-- '63395', 'McKinnon', 'Cybernetics', '94333.99'
	-- '64871', 'Gutierrez', 'Statistics', '45310.53'
	-- '6569', 'Mingoz', 'Finance', '105311.38'
	-- '65931', 'Pimenta', 'Cybernetics', '79866.95'
	-- '72553', 'Yin', 'English', '46397.59'
	-- '73623', 'Sullivan', 'Elec. Eng.', '90038.09'
	-- '74420', 'Voronina', 'Physics', '121141.99'
	-- '74426', 'Kenje', 'Marketing', '106554.73'
	-- '77346', 'Mahmoud', 'Geology', '99382.59'
	-- '78699', 'Pingr', 'Statistics', '59303.62'
	-- '79081', 'Ullman ', 'Accounting', '47307.10'
	-- '79653', 'Levine', 'Elec. Eng.', '89805.83'
	-- '80759', 'Queiroz', 'Biology', '45538.32'
	-- '81991', 'Valtchev', 'Biology', '77036.18'
	-- '90376', 'Bietzk', 'Cybernetics', '117836.50'
	-- '90643', 'Choll', 'Statistics', '57807.09'
	-- '95030', 'Arinb', 'Statistics', '54805.11'
	-- '95709', 'Sakurai', 'English', '118143.98'
	-- '96895', 'Mird', 'Marketing', '119921.41'
	-- '97302', 'Bertolino', 'Mech. Eng.', '51647.57'
	-- '99052', 'Dale', 'Cybernetics', '93348.83'

	-- list all properties of instructor
	describe instructor;

	-- 'ID', 'varchar(5)', 'NO', 'PRI', NULL, ''
	-- 'name', 'varchar(20)', 'NO', '', NULL, ''
	-- 'dept_name', 'varchar(20)', 'YES', 'MUL', NULL, ''
	-- 'salary', 'decimal(8,2)', 'YES', '', NULL, ''

	-- select all from instructor but with their salaries multiplied by 0
	select name, dept_name, salary * 0 from instructor;

	-- 'Lembr', 'Accounting', '0.00'
	-- 'Bawa', 'Athletics', '0.00'
	-- 'Yazdi', 'Athletics', '0.00'
	-- 'Wieland', 'Pol. Sci.', '0.00'
	-- 'DAgostino', 'Psychology', '0.00'
	-- 'Liley', 'Languages', '0.00'
	-- 'Kean', 'English', '0.00'
	-- 'Atanassov', 'Statistics', '0.00'
	-- 'Moreira', 'Accounting', '0.00'
	-- 'Gustafsson', 'Elec. Eng.', '0.00'
	-- 'Bourrier', 'Comp. Sci.', '0.00'
	-- 'Bondi', 'Comp. Sci.', '0.00'
	-- 'Soisalon-Soininen', 'Psychology', '0.00'
	-- 'Morris', 'Marketing', '0.00'
	-- 'Arias', 'Statistics', '0.00'
	-- 'Murata', 'Athletics', '0.00'
	-- 'Tung', 'Athletics', '0.00'
	-- 'Luo', 'English', '0.00'
	-- 'Vicentino', 'Elec. Eng.', '0.00'
	-- 'Romero', 'Astronomy', '0.00'
	-- 'Lent', 'Mech. Eng.', '0.00'
	-- 'Sarkar', 'Pol. Sci.', '0.00'
	-- 'Shuming', 'Physics', '0.00'
	-- 'Konstantinides', 'Languages', '0.00'
	-- 'Bancilhon', 'Pol. Sci.', '0.00'
	-- 'Hau', 'Accounting', '0.00'
	-- 'Dusserre', 'Marketing', '0.00'
	-- 'Desyl', 'Languages', '0.00'
	-- 'Jaekel', 'Athletics', '0.00'
	-- 'McKinnon', 'Cybernetics', '0.00'
	-- 'Gutierrez', 'Statistics', '0.00'
	-- 'Mingoz', 'Finance', '0.00'
	-- 'Pimenta', 'Cybernetics', '0.00'
	-- 'Yin', 'English', '0.00'
	-- 'Sullivan', 'Elec. Eng.', '0.00'
	-- 'Voronina', 'Physics', '0.00'
	-- 'Kenje', 'Marketing', '0.00'
	-- 'Mahmoud', 'Geology', '0.00'
	-- 'Pingr', 'Statistics', '0.00'
	-- 'Ullman ', 'Accounting', '0.00'
	-- 'Levine', 'Elec. Eng.', '0.00'
	-- 'Queiroz', 'Biology', '0.00'
	-- 'Valtchev', 'Biology', '0.00'
	-- 'Bietzk', 'Cybernetics', '0.00'
	-- 'Choll', 'Statistics', '0.00'
	-- 'Arinb', 'Statistics', '0.00'
	-- 'Sakurai', 'English', '0.00'
	-- 'Mird', 'Marketing', '0.00'
	-- 'Bertolino', 'Mech. Eng.', '0.00'
	-- 'Dale', 'Cybernetics', '0.00'


	-- selecting instructor whose dept name is comp sci and salary is 70k
	select name from instructor where dept_name = 'Comp. Sci.' and salary > 70000;

	-- 'Bourrier'
	-- 'Bondi'

	-- custom names support 
	select T.name, S.course_id
	from instructor as T, teaches as S
	where T .ID= S.ID;

	-- # name, course_id
	-- 'Romero', '105'
	-- 'Romero', '105'
	-- 'Mingoz', '137'
	-- 'Bietzk', '158'
	-- 'Dale', '158'
	-- 'Gustafsson', '169'
	-- 'Gustafsson', '169'
	-- 'Liley', '192'
	-- 'Lembr', '200'
	-- 'Ullman ', '200'
	-- 'Dale', '237'
	-- 'Dale', '237'
	-- 'Voronina', '239'
	-- 'Morris', '242'
	-- 'Sakurai', '258'
	-- 'Sakurai', '270'
	-- 'Bondi', '274'
	-- 'Mingoz', '304'
	-- 'Morris', '313'
	-- 'Mingoz', '319'
	-- 'Jaekel', '334'
	-- 'DAgostino', '338'
	-- 'DAgostino', '338'
	-- 'Ullman ', '345'
	-- 'Mingoz', '349'
	-- 'DAgostino', '352'
	-- 'Mingoz', '362'
	-- 'Mingoz', '362'
	-- 'Mingoz', '362'
	-- 'Kean', '366'
	-- 'Voronina', '376'
	-- 'DAgostino', '400'
	-- 'DAgostino', '400'
	-- 'Tung', '401'
	-- 'Ullman ', '408'
	-- 'Ullman ', '408'
	-- 'Valtchev', '415'
	-- 'Tung', '421'
	-- 'Mingoz', '426'
	-- 'Voronina', '443'
	-- 'Voronina', '443'
	-- 'Mingoz', '445'
	-- 'Bawa', '457'
	-- 'Choll', '461'
	-- 'Sakurai', '468'
	-- 'Shuming', '468'
	-- 'Romero', '476'
	-- 'DAgostino', '482'
	-- 'Mahmoud', '486'
	-- 'Romero', '489'
	-- 'Mahmoud', '493'
	-- 'Dale', '496'
	-- 'Mingoz', '527'
	-- 'Wieland', '545'
	-- 'Queiroz', '559'
	-- 'Gustafsson', '561'
	-- 'Bondi', '571'
	-- 'Wieland', '581'
	-- 'Wieland', '591'
	-- 'DAgostino', '599'
	-- 'Atanassov', '603'
	-- 'Atanassov', '604'
	-- 'Voronina', '612'
	-- 'Lent', '626'
	-- 'Dale', '629'
	-- 'Gustafsson', '631'
	-- 'DAgostino', '642'
	-- 'DAgostino', '663'
	-- 'Luo', '679'
	-- 'Tung', '692'
	-- 'Sullivan', '694'
	-- 'Morris', '696'
	-- 'Valtchev', '702'
	-- 'Mahmoud', '704'
	-- 'Mahmoud', '735'
	-- 'Mahmoud', '735'
	-- 'Bondi', '747'
	-- 'Dale', '748'
	-- 'Ullman ', '760'
	-- 'Morris', '791'
	-- 'Vicentino', '793'
	-- 'Morris', '795'
	-- 'Dale', '802'
	-- 'Kean', '808'
	-- 'Lembr', '843'
	-- 'Jaekel', '852'
	-- 'Mahmoud', '864'
	-- 'DAgostino', '867'
	-- 'Sarkar', '867'
	-- 'Pimenta', '875'
	-- 'Dale', '893'
	-- 'Dale', '927'
	-- 'Bourrier', '949'
	-- 'Voronina', '959'
	-- 'Bourrier', '960'
	-- 'Sakurai', '960'
	-- 'DAgostino', '962'
	-- 'DAgostino', '972'
	-- 'Ullman ', '974'
	-- 'DAgostino', '991'

	select distinct T.name
	from instructor as T , instructor as S
	where T.salary > S.salary and S.dept_name = 'Biology';

	-- # name
	-- 'Bawa'
	-- 'Yazdi'
	-- 'Wieland'
	-- 'DAgostino'
	-- 'Liley'
	-- 'Atanassov'
	-- 'Moreira'
	-- 'Gustafsson'
	-- 'Bourrier'
	-- 'Bondi'
	-- 'Soisalon-Soininen'
	-- 'Arias'
	-- 'Murata'
	-- 'Tung'
	-- 'Luo'
	-- 'Romero'
	-- 'Lent'
	-- 'Sarkar'
	-- 'Shuming'
	-- 'Bancilhon'
	-- 'Dusserre'
	-- 'Desyl'
	-- 'Jaekel'
	-- 'McKinnon'
	-- 'Mingoz'
	-- 'Pimenta'
	-- 'Yin'
	-- 'Sullivan'
	-- 'Voronina'
	-- 'Kenje'
	-- 'Mahmoud'
	-- 'Pingr'
	-- 'Ullman '
	-- 'Levine'
	-- 'Valtchev'
	-- 'Bietzk'
	-- 'Choll'
	-- 'Arinb'
	-- 'Sakurai'
	-- 'Mird'
	-- 'Bertolino'
	-- 'Dale'

	-- selecting building with custom like
	select distinct dept_name, building
	from department
	where building like '%auc_n%';

	-- # dept_name, building
	-- 'Accounting', 'Saucon'

	-- select all order by salary descending and name ascending
	select *
	from instructor
	order by salary desc, name asc;

	-- # ID, name, dept_name, salary
	-- '19368', 'Wieland', 'Pol. Sci.', '124651.41'
	-- '74420', 'Voronina', 'Physics', '121141.99'
	-- '96895', 'Mird', 'Marketing', '119921.41'
	-- '95709', 'Sakurai', 'English', '118143.98'
	-- '90376', 'Bietzk', 'Cybernetics', '117836.50'
	-- '34175', 'Bondi', 'Comp. Sci.', '115469.11'
	-- '50330', 'Shuming', 'Physics', '108011.81'
	-- '48507', 'Lent', 'Mech. Eng.', '107978.47'
	-- '74426', 'Kenje', 'Marketing', '106554.73'
	-- '6569', 'Mingoz', 'Finance', '105311.38'
	-- '37687', 'Arias', 'Statistics', '104563.38'
	-- '63287', 'Jaekel', 'Athletics', '103146.87'
	-- '77346', 'Mahmoud', 'Geology', '99382.59'
	-- '16807', 'Yazdi', 'Athletics', '98333.65'
	-- '63395', 'McKinnon', 'Cybernetics', '94333.99'
	-- '99052', 'Dale', 'Cybernetics', '93348.83'
	-- '25946', 'Liley', 'Languages', '90891.69'
	-- '73623', 'Sullivan', 'Elec. Eng.', '90038.09'
	-- '79653', 'Levine', 'Elec. Eng.', '89805.83'
	-- '4233', 'Luo', 'English', '88791.45'
	-- '52647', 'Bancilhon', 'Pol. Sci.', '87958.01'
	-- '48570', 'Sarkar', 'Pol. Sci.', '87549.80'
	-- '28400', 'Atanassov', 'Statistics', '84982.92'
	-- '3199', 'Gustafsson', 'Elec. Eng.', '82534.37'
	-- '3335', 'Bourrier', 'Comp. Sci.', '80797.83'
	-- '65931', 'Pimenta', 'Cybernetics', '79866.95'
	-- '43779', 'Romero', 'Astronomy', '79070.08'
	-- '81991', 'Valtchev', 'Biology', '77036.18'
	-- '15347', 'Bawa', 'Athletics', '72140.88'
	-- '31955', 'Moreira', 'Accounting', '71351.42'
	-- '58558', 'Dusserre', 'Marketing', '66143.25'
	-- '35579', 'Soisalon-Soininen', 'Psychology', '62579.61'
	-- '4034', 'Murata', 'Athletics', '61387.56'
	-- '22591', 'DAgostino', 'Psychology', '59706.49'
	-- '78699', 'Pingr', 'Statistics', '59303.62'
	-- '90643', 'Choll', 'Statistics', '57807.09'
	-- '95030', 'Arinb', 'Statistics', '54805.11'
	-- '97302', 'Bertolino', 'Mech. Eng.', '51647.57'
	-- '41930', 'Tung', 'Athletics', '50482.03'
	-- '59795', 'Desyl', 'Languages', '48803.38'
	-- '79081', 'Ullman ', 'Accounting', '47307.10'
	-- '72553', 'Yin', 'English', '46397.59'
	-- '80759', 'Queiroz', 'Biology', '45538.32'
	-- '64871', 'Gutierrez', 'Statistics', '45310.53'
	-- '57180', 'Hau', 'Accounting', '43966.29'
	-- '36897', 'Morris', 'Marketing', '43770.36'
	-- '28097', 'Kean', 'English', '35023.18'
	-- '42782', 'Vicentino', 'Elec. Eng.', '34272.67'
	-- '50885', 'Konstantinides', 'Languages', '32570.50'
	-- '14365', 'Lembr', 'Accounting', '32241.56'

	-- select instructor name with defined salary
	select name
	from instructor
	where salary between 90000 and 100000;

	-- # name
	-- 'Yazdi'
	-- 'Liley'
	-- 'McKinnon'
	-- 'Sullivan'
	-- 'Mahmoud'
	-- 'Dale'

	-- union to combine 2 diff tables
	(select course_id, semester
	from section
	where semester = 'Fall' and year= 2007)
	union
	(select course_id, semester
	from section
	where semester = 'Spring' and year= 2008);

	-- # course_id, semester
	-- '893', 'Fall'
	-- '489', 'Fall'
	-- '612', 'Fall'
	-- '258', 'Fall'
	-- '468', 'Fall'
	-- '949', 'Fall'
	-- '362', 'Spring'
	-- '852', 'Spring'
	-- '991', 'Spring'
	-- '962', 'Spring'
	-- '237', 'Spring'
	-- '349', 'Spring'
	-- '345', 'Spring'
	-- '158', 'Spring'
	-- '704', 'Spring'

	-- union to combine 2 diff tables but with duplicates
	(select course_id, semester
	from section
	where semester = 'Fall' and year= 2007)
	union all
	(select course_id, semester
	from section
	where semester = 'Spring' and year= 2008);

	-- # course_id, semester
	-- '893', 'Fall'
	-- '489', 'Fall'
	-- '612', 'Fall'
	-- '258', 'Fall'
	-- '468', 'Fall'
	-- '949', 'Fall'
	-- '362', 'Spring'
	-- '852', 'Spring'
	-- '991', 'Spring'
	-- '962', 'Spring'
	-- '237', 'Spring'
	-- '349', 'Spring'
	-- '345', 'Spring'
	-- '158', 'Spring'
	-- '704', 'Spring'

	-- same thing just course_id
	(select course_id
	from section
	where semester = 'Fall')
	union all
	(select course_id
	from section
	where semester = 'Spring');

	-- # course_id
	-- '893'
	-- '489'
	-- '612'
	-- '258'
	-- '468'
	-- '949'
	-- '362'
	-- '852'
	-- '991'
	-- '962'
	-- '237'
	-- '349'
	-- '345'
	-- '158'
	-- '704'

	-- intersecting two tables
	(select course_id
	from section
	where semester = 'Fall' order by course_id)
	intersect all
	(select course_id
	from section
	where semester = 'Spring' order by course_id);

	-- # course_id
	-- '362'
	-- '200'
	-- '169'
	-- '237'
	-- '400'
	-- '158'

	describe instructor;

	-- finds the average salary
	select avg (salary)
	from instructor
	where dept_name = 'Comp. Sci.';

	-- # avg (salary)
	-- '98133.470000'

	SELECT sum(value)
	FROM (
		SELECT 2 AS value
		UNION ALL
		SELECT 1
		UNION ALL
		SELECT 3
	) AS temp_table;

	-- 6



