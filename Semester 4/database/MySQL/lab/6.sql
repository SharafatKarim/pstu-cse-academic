create database small_uni;
use small_uni;
use university;

show tables;

desc instructor;
select ID, salary from instructor;

-- small database
-- # ID, salary
-- '10101', '65000.00'
-- '12121', '90000.00'
-- '15151', '40000.00'
-- '22222', '95000.00'
-- '32343', '60000.00'
-- '33456', '87000.00'
-- '45565', '75000.00'
-- '58583', '62000.00'
-- '76543', '80000.00'
-- '76766', '72000.00'
-- '83821', '92000.00'
-- '98345', '80000.00'

-- use big database
-- # ID, salary
-- '14365', '32241.56'
-- '15347', '72140.88'
-- '16807', '98333.65'
-- '19368', '124651.41'
-- '22591', '59706.49'
-- '25946', '90891.69'
-- '28097', '35023.18'
-- '28400', '84982.92'
-- '31955', '71351.42'
-- '3199', '82534.37'
-- '3335', '80797.83'
-- '34175', '115469.11'
-- '35579', '62579.61'
-- '36897', '43770.36'
-- '37687', '104563.38'
-- '4034', '61387.56'
-- '41930', '50482.03'
-- '4233', '88791.45'
-- '42782', '34272.67'
-- '43779', '79070.08'
-- '48507', '107978.47'
-- '48570', '87549.80'
-- '50330', '108011.81'
-- '50885', '32570.50'
-- '52647', '87958.01'
-- '57180', '43966.29'
-- '58558', '66143.25'
-- '59795', '48803.38'
-- '63287', '103146.87'
-- '63395', '94333.99'
-- '64871', '45310.53'
-- '6569', '105311.38'
-- '65931', '79866.95'
-- '72553', '46397.59'
-- '73623', '90038.09'
-- '74420', '121141.99'
-- '74426', '106554.73'
-- '77346', '99382.59'
-- '78699', '59303.62'
-- '79081', '47307.10'
-- '79653', '89805.83'
-- '80759', '45538.32'
-- '81991', '77036.18'
-- '90376', '117836.50'
-- '90643', '57807.09'
-- '95030', '54805.11'
-- '95709', '118143.98'
-- '96895', '119921.41'
-- '97302', '51647.57'
-- '99052', '93348.83'

-- big database
-- # ID, salary
-- '14365', '32241.56'
-- '15347', '72140.88'
-- '16807', '98333.65'
-- '19368', '124651.41'
-- '22591', '59706.49'
-- '25946', '90891.69'
-- '28097', '35023.18'
-- '28400', '84982.92'
-- '31955', '71351.42'
-- '3199', '82534.37'
-- '3335', '80797.83'
-- '34175', '115469.11'
-- '35579', '62579.61'
-- '36897', '43770.36'
-- '37687', '104563.38'
-- '4034', '61387.56'
-- '41930', '50482.03'
-- '4233', '88791.45'
-- '42782', '34272.67'
-- '43779', '79070.08'
-- '48507', '107978.47'
-- '48570', '87549.80'
-- '50330', '108011.81'
-- '50885', '32570.50'
-- '52647', '87958.01'
-- '57180', '43966.29'
-- '58558', '66143.25'
-- '59795', '48803.38'
-- '63287', '103146.87'
-- '63395', '94333.99'
-- '64871', '45310.53'
-- '6569', '105311.38'
-- '65931', '79866.95'
-- '72553', '46397.59'
-- '73623', '90038.09'
-- '74420', '121141.99'
-- '74426', '106554.73'
-- '77346', '99382.59'
-- '78699', '59303.62'
-- '79081', '47307.10'
-- '79653', '89805.83'
-- '80759', '45538.32'
-- '81991', '77036.18'
-- '90376', '117836.50'
-- '90643', '57807.09'
-- '95030', '54805.11'
-- '95709', '118143.98'
-- '96895', '119921.41'
-- '97302', '51647.57'
-- '99052', '93348.83'

-- Find out the ID and salary of the instructor who gets more than $85,000.
select ID, salary from instructor
where salary > 85000;

-- small db
-- # ID, salary
-- '12121', '90000.00'
-- '22222', '95000.00'
-- '33456', '87000.00'
-- '83821', '92000.00'

-- big db
-- # ID, salary
-- '16807', '98333.65'
-- '19368', '124651.41'
-- '25946', '90891.69'
-- '34175', '115469.11'
-- '37687', '104563.38'
-- '4233', '88791.45'
-- '48507', '107978.47'
-- '48570', '87549.80'
-- '50330', '108011.81'
-- '52647', '87958.01'
-- '63287', '103146.87'
-- '63395', '94333.99'
-- '6569', '105311.38'
-- '73623', '90038.09'
-- '74420', '121141.99'
-- '74426', '106554.73'
-- '77346', '99382.59'
-- '79653', '89805.83'
-- '90376', '117836.50'
-- '95709', '118143.98'
-- '96895', '119921.41'
-- '99052', '93348.83'

-- Find out the department names and their budget at the university.
show tables;
desc department;

select dept_name, budget from department;

-- List out the names of the instructors from Computer Science who have more than $70,000.
desc instructor;
select name from instructor
where salary > 70000;

-- For all instructors in the university who have taught some course, find their names and the course ID of
-- all courses they taught.
desc instructor;
desc teaches;

select I.name, T.course_id
from instructor I
natural join teaches T
order by I.name;

-- Find the names of all instructors whose salary is greater than at least one instructor in the Biology
-- department.
select name 
from instructor
where dept_name = "Biology"
and salary > ( select min(S.salary) from (
	select salary
    from instructor
    where dept_name = "Biology"
) as S );

select min(S.salary) from ( select salary
    from instructor
    where dept_name = "Biology") as S;

select * from instructor;

-- Find the advisor of the student with ID 12345
select * from advisor
where s_ID = 12345;

-- Find the average salary of all instructors.
select avg(I.salary) average_salary from
(select salary from instructor) as I;

-- Find the names of all departments whose building name includes the substring 'Watson'.
select dept_name from department
where building like "%Watson%";

-- Find the names of instructors with salary amounts between $90,000 and $100,000.
select name from instructor
where salary between 90000 and 100000;

-- Find the instructor names and the courses they taught for all instructors in the Biology department who
-- have taught some course.
select name, course_id
from instructor 
natural left join teaches
where dept_name = "Biology";

-- Find the courses taught in Fall-2009 semester.
select course_id from teaches
where semester = "Fall" and year = 2009;

-- Find the set of all courses taught either in Fall-2009 or in Spring-2010.
select course_id from teaches
where (semester = "Fall" and year = 2009) or (semester = "Spring" and year = 2010);

( select course_id from teaches
where semester = "Fall" and year = 2009 )
union ( select course_id from teaches
where semester = "Spring" and year = 2010 );

-- Find the set of all courses taught in the Fall-2009 as well as in Spring-2010.
select course_id from teaches
where (semester = "Fall" and year = 2009) and (semester = "Spring" and year = 2010);

( select course_id from teaches
where semester = "Fall" and year = 2009 )
intersect ( select course_id from teaches
where semester = "Spring" and year = 2010 );

-- Find all courses taught in the Fall-2009 semester but not in the Spring-2010 semester.
select course_id from teaches
where (semester = "Fall" and year = 2009) and not (semester = "Spring" and year = 2010);

( select course_id from teaches
where semester = "Fall" and year = 2009 )
except ( select course_id from teaches
where semester = "Spring" and year = 2010 );

-- Find all instructors who appear in the instructor relation with null values for salary.
select * from instructor
where salary = NULL;

select * from instructor;

-- Find the average salary of instructors in the Finance department.
select avg(T.salary) from
( select salary from instructor
where dept_name = "Finance" ) as T;

-- Find the total number of instructors who teach a course in the Spring-2010 semester.
describe teaches;
select  count(T.id) from
( select id from instructor
	natural join teaches
    where semester = "Spring" 
    and year = 2010 ) as T ;
    
-- Find the average salary in each department.
select dept_name, avg(salary)
from department
natural join instructor
group by dept_name;

-- Find the number of instructors in each department who teach a course in the Spring-2010 semester.
select dept_name, count(ID)
from department
natural join instructor
where ID in (
	select ID from teaches
    where semester = "Spring" 
    and year = 2010
) 
group by dept_name;

-- List out the departments where the average salary of the instructors is more than $42,000.
select dept_name
from department D
where ( select avg(salary) from (
	select salary
    from instructor I
    where D.dept_name = I.dept_name
) as T ) > 42000;

select distinct dept_name
from instructor
group by dept_name
having avg(salary) > 42000;

-- For each course section offered in 2009, find the average total credits (tot cred) of all students enrolled
-- in the section, if the section had at least 2 students.
select course_id, sec_id, avg(tot_cred)
from takes 
natural join student 
where year = 2009
group by sec_id, course_id
having count(*) > 1;

-- Find all the courses taught in both the Fall-2009 and Spring-2010 semesters.
select course_id from teaches
where (semester = "Fall" and year = 2009) and (semester = "Spring" and year = 2010);

( select course_id from teaches
where semester = "Fall" and year = 2009 )
intersect ( select course_id from teaches
where semester = "Spring" and year = 2010 );

-- Select the names of instructors whose names are neither 'Mozart' nor 'Einstein'.
select name from instructor
where name not in ("Mozart", "Einstein");

select name from instructor;

-- Find the total number of (distinct) students who have taken course sections taught by the instructor
-- with ID 110011.