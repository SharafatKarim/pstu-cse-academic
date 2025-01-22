use university;

-- select instructor's dept name and building from 2 tables,
-- where these 2 are same 
select name, instructor.dept_name, building
from instructor, department
where instructor.dept_name= department.dept_name;

-- 'Lembr', 'Accounting', 'Saucon'
-- 'Bawa', 'Athletics', 'Bronfman'
-- 'Yazdi', 'Athletics', 'Bronfman'
-- 'Wieland', 'Pol. Sci.', 'Whitman'
-- 'DAgostino', 'Psychology', 'Thompson'
-- 'Liley', 'Languages', 'Linderman'
-- 'Kean', 'English', 'Palmer'
-- 'Atanassov', 'Statistics', 'Taylor'
-- 'Moreira', 'Accounting', 'Saucon'
-- 'Gustafsson', 'Elec. Eng.', 'Main'
-- 'Bourrier', 'Comp. Sci.', 'Lamberton'
-- 'Bondi', 'Comp. Sci.', 'Lamberton'
-- 'Soisalon-Soininen', 'Psychology', 'Thompson'
-- 'Morris', 'Marketing', 'Lambeau'
-- 'Arias', 'Statistics', 'Taylor'
-- 'Murata', 'Athletics', 'Bronfman'
-- 'Tung', 'Athletics', 'Bronfman'
-- 'Luo', 'English', 'Palmer'
-- 'Vicentino', 'Elec. Eng.', 'Main'
-- 'Romero', 'Astronomy', 'Taylor'
-- 'Lent', 'Mech. Eng.', 'Rauch'
-- 'Sarkar', 'Pol. Sci.', 'Whitman'
-- 'Shuming', 'Physics', 'Wrigley'
-- 'Konstantinides', 'Languages', 'Linderman'
-- 'Bancilhon', 'Pol. Sci.', 'Whitman'
-- 'Hau', 'Accounting', 'Saucon'
-- 'Dusserre', 'Marketing', 'Lambeau'
-- 'Desyl', 'Languages', 'Linderman'
-- 'Jaekel', 'Athletics', 'Bronfman'
-- 'McKinnon', 'Cybernetics', 'Mercer'
-- 'Gutierrez', 'Statistics', 'Taylor'
-- 'Mingoz', 'Finance', 'Candlestick'
-- 'Pimenta', 'Cybernetics', 'Mercer'
-- 'Yin', 'English', 'Palmer'
-- 'Sullivan', 'Elec. Eng.', 'Main'
-- 'Voronina', 'Physics', 'Wrigley'
-- 'Kenje', 'Marketing', 'Lambeau'
-- 'Mahmoud', 'Geology', 'Palmer'
-- 'Pingr', 'Statistics', 'Taylor'
-- 'Ullman ', 'Accounting', 'Saucon'
-- 'Levine', 'Elec. Eng.', 'Main'
-- 'Queiroz', 'Biology', 'Candlestick'
-- 'Valtchev', 'Biology', 'Candlestick'
-- 'Bietzk', 'Cybernetics', 'Mercer'
-- 'Choll', 'Statistics', 'Taylor'
-- 'Arinb', 'Statistics', 'Taylor'
-- 'Sakurai', 'English', 'Palmer'
-- 'Mird', 'Marketing', 'Lambeau'
-- 'Bertolino', 'Mech. Eng.', 'Rauch'
-- 'Dale', 'Cybernetics', 'Mercer'

select T.name, S.course_id
from instructor as T , teaches as S
where T.ID= S.ID;

-- # name, course_id
-- 'Lembr', '200'
-- 'Lembr', '843'
-- 'Bawa', '457'
-- 'Wieland', '545'
-- 'Wieland', '581'
-- 'Wieland', '591'
-- 'DAgostino', '338'
-- 'DAgostino', '338'
-- 'DAgostino', '352'
-- 'DAgostino', '400'
-- 'DAgostino', '400'
-- 'DAgostino', '482'
-- 'DAgostino', '599'
-- 'DAgostino', '642'
-- 'DAgostino', '663'
-- 'DAgostino', '867'
-- 'DAgostino', '962'
-- 'DAgostino', '972'
-- 'DAgostino', '991'
-- 'Liley', '192'
-- 'Kean', '366'
-- 'Kean', '808'
-- 'Atanassov', '603'
-- 'Atanassov', '604'
-- 'Gustafsson', '169'
-- 'Gustafsson', '169'
-- 'Gustafsson', '561'
-- 'Gustafsson', '631'
-- 'Bourrier', '949'
-- 'Bourrier', '960'
-- 'Bondi', '274'
-- 'Bondi', '571'
-- 'Bondi', '747'
-- 'Morris', '242'
-- 'Morris', '313'
-- 'Morris', '696'
-- 'Morris', '791'
-- 'Morris', '795'
-- 'Tung', '401'
-- 'Tung', '421'
-- 'Tung', '692'
-- 'Luo', '679'
-- 'Vicentino', '793'
-- 'Romero', '105'
-- 'Romero', '105'
-- 'Romero', '476'
-- 'Romero', '489'
-- 'Lent', '626'
-- 'Sarkar', '867'
-- 'Shuming', '468'
-- 'Jaekel', '334'
-- 'Jaekel', '852'
-- 'Mingoz', '137'
-- 'Mingoz', '304'
-- 'Mingoz', '319'
-- 'Mingoz', '349'
-- 'Mingoz', '362'
-- 'Mingoz', '362'
-- 'Mingoz', '362'
-- 'Mingoz', '426'
-- 'Mingoz', '445'
-- 'Mingoz', '527'
-- 'Pimenta', '875'
-- 'Sullivan', '694'
-- 'Voronina', '239'
-- 'Voronina', '376'
-- 'Voronina', '443'
-- 'Voronina', '443'
-- 'Voronina', '612'
-- 'Voronina', '959'
-- 'Mahmoud', '486'
-- 'Mahmoud', '493'
-- 'Mahmoud', '704'
-- 'Mahmoud', '735'
-- 'Mahmoud', '735'
-- 'Mahmoud', '864'
-- 'Ullman ', '200'
-- 'Ullman ', '345'
-- 'Ullman ', '408'
-- 'Ullman ', '408'
-- 'Ullman ', '760'
-- 'Ullman ', '974'
-- 'Queiroz', '559'
-- 'Valtchev', '415'
-- 'Valtchev', '702'
-- 'Bietzk', '158'
-- 'Choll', '461'
-- 'Sakurai', '258'
-- 'Sakurai', '270'
-- 'Sakurai', '468'
-- 'Sakurai', '960'
-- 'Dale', '158'
-- 'Dale', '237'
-- 'Dale', '237'
-- 'Dale', '496'
-- 'Dale', '629'
-- 'Dale', '748'
-- 'Dale', '802'
-- 'Dale', '893'
-- 'Dale', '927'

select distinct T .name
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

select dept_name
from department
where building like '%a%';

-- # dept_name
-- 'Accounting'
-- 'Astronomy'
-- 'Athletics'
-- 'Biology'
-- 'Civil Eng.'
-- 'Comp. Sci.'
-- 'Elec. Eng.'
-- 'English'
-- 'Finance'
-- 'Geology'
-- 'History'
-- 'Languages'
-- 'Marketing'
-- 'Math'
-- 'Mech. Eng.'
-- 'Pol. Sci.'
-- 'Statistics'

select count (distinct_ID)
from teaches
where semester = 'Spring';

describe teaches;


select course_ID
from teaches
where semester = 'Spring';

select count(*)
from course;

select dept_name, AVG(salary) as avg_salary
	from instructor
    group by dept_name;
    
select dept_name, avg_salary 
from (select dept_name, AVG(salary) as avg_salary
      from instructor           
      group by dept_name) as T(dept_name, avg_salary)
      where avg_salary>42000;
      
-- select all distinct course_id
-- where semester is Fall
select distinct course_id
from section
where semester = 'Fall' and
course_id not in (select course_id
from section
where semester = 'Spring');

-- # course_id
-- '694'
-- '105'
-- '313'
-- '476'
-- '242'
-- '843'
-- '893'
-- '421'
-- '468'
-- '415'
-- '559'
-- '867'
-- '960'
-- '304'
-- '489'
-- '612'
-- '626'
-- '274'
-- '461'
-- '258'
-- '561'
-- '192'
-- '808'
-- '974'
-- '376'
-- '527'
-- '642'
-- '401'
-- '545'
-- '748'
-- '927'
-- '949'
-- '959'
-- '366'
-- '239'
-- '334'
-- '496'
-- '603'
-- '486'
-- '482'

-- 
select distinct course_id
from section
where semester = 'Fall' and
course_id not in (select course_id
from section
where semester = 'Spring');

-- # course_id
-- '694'
-- '105'
-- '313'
-- '476'
-- '242'
-- '843'
-- '893'
-- '421'
-- '468'
-- '415'
-- '559'
-- '867'
-- '960'
-- '304'
-- '489'
-- '612'
-- '626'
-- '274'
-- '461'
-- '258'
-- '561'
-- '192'
-- '808'
-- '974'
-- '376'
-- '527'
-- '642'
-- '401'
-- '545'
-- '748'
-- '927'
-- '949'
-- '959'
-- '366'
-- '239'
-- '334'
-- '496'
-- '603'
-- '486'
-- '482'

select * from section;

select distinct course_id 
from section
where semester = 'Fall' and 
course_id in (select course_id from section where semester = 'Spring');

select S.ID, S.name
from student as S
where exists ((select course_id
from course
where dept_name = 'Biology')
except
(select T.course_id
from takes as T
where S.ID = T.ID));



