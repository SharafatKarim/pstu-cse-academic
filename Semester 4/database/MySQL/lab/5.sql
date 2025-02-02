use universipedia;
use university;

-- simple instruction to list all instructors
select name
from instructor;

SELECT 
    name, course_id
FROM
    student,
    takes
WHERE
    student.ID = takes.ID;

SELECT 
    name, course_id
FROM
    student
        NATURAL JOIN
    takes;

-- Find the names of those departments whose budget is higher than that of Astronomy. List them
-- in alphabetic order.

SELECT 
    dept_name
FROM
    department
WHERE
    budget > (SELECT 
            budget
        FROM
            department
        WHERE
            dept_name = 'Astronomy');
    
-- # dept_name
-- 'Athletics'
-- 'Biology'
-- 'Cybernetics'
-- 'Finance'
-- 'History'
-- 'Math'
-- 'Physics'
-- 'Psychology'

SELECT 
    *
FROM
    instructor;

SELECT 
    I.ID, COUNT(*)
FROM
    instructor AS I,
    teaches AS T
WHERE
    I.ID = T.ID
GROUP BY I.ID
ORDER BY I.ID;

SELECT 
    I.ID, COUNT(T.ID) as number_of_sections
FROM
    instructor AS I
        NATURAL LEFT JOIN
    teaches AS T
GROUP BY I.ID
ORDER BY number_of_sections;

-- # ID, number_of_sections
-- '35579', '0'
-- '52647', '0'
-- '50885', '0'
-- '57180', '0'
-- '58558', '0'
-- '59795', '0'
-- '63395', '0'
-- '64871', '0'
-- '72553', '0'
-- '4034', '0'
-- '37687', '0'
-- '74426', '0'
-- '78699', '0'
-- '79653', '0'
-- '31955', '0'
-- '95030', '0'
-- '96895', '0'
-- '16807', '0'
-- '97302', '0'
-- '15347', '1'
-- '73623', '1'
-- '65931', '1'
-- '80759', '1'
-- '90376', '1'
-- '90643', '1'
-- '48570', '1'
-- '25946', '1'
-- '50330', '1'
-- '4233', '1'
-- '42782', '1'
-- '48507', '1'
-- '14365', '2'
-- '63287', '2'
-- '3335', '2'
-- '28400', '2'
-- '81991', '2'
-- '28097', '2'
-- '41930', '3'
-- '19368', '3'
-- '34175', '3'
-- '43779', '4'
-- '95709', '4'
-- '3199', '4'
-- '36897', '5'
-- '77346', '6'
-- '79081', '6'
-- '74420', '6'
-- '99052', '9'
-- '6569', '10'
-- '22591', '13'

-- For each student who has retaken a course at least twice (i.e., the student has taken the course at
-- least three times), show the course ID and the student&#39;s ID. Please display your results in order
-- of course ID and do not display duplicate rows. 

describe takes;

select distinct takes.course_id, D.ID 
from
	( select distinct S.ID, count(T.ID) as cnt
		from student as S natural left join takes as T
		group by S.ID ) as D natural inner join takes
where D.cnt>1 ; 

select distinct course_id, ID
	from takes
    group by ID, course_id having count(*) > 2
    order by course_id;

-- # course_id, ID
-- '362', '16480'
-- '362', '16969'
-- '362', '27236'
-- '362', '39925'
-- '362', '39978'
-- '362', '44881'
-- '362', '49611'
-- '362', '5414'
-- '362', '69581'
-- '362', '9993'



-- select distinct S.ID, count(T.ID) as cnt
-- from student as S natural left join takes as T
-- group by S.ID;

show tables;
describe course;
select * from course;
describe student;

-- Find the names of Biology students who have taken at least 3 Accounting courses.

select name 
from student natural inner join (
select ID, course_id
from takes
group by id, course_id having count(*) > 2 ) as T
where T.course_id in ( select course_id from course
	where dept_name = "Accounting" );
    
select ID from takes
where course_id in ( select course_id from course
	where dept_name = "Accounting")
    group by ID having count(*) > 2
    ;
    
    describe student;
select ID, course_id
from takes
group by id, course_id having count(*) > 2;

SELECT 
    name
FROM
    student
        NATURAL JOIN
    (SELECT 
        ID
    FROM
        takes
    WHERE
        course_id IN (SELECT 
                course_id
            FROM
                course
            WHERE
                dept_name = 'Accounting')
    GROUP BY ID
    HAVING COUNT(*) > 2) AS T
WHERE
    dept_name = 'Biology';
    
SELECT s.name
FROM student s
JOIN takes t ON s.ID = t.ID
JOIN course c ON t.course_id = c.course_id
WHERE s.dept_name = 'Biology'
AND c.dept_name = 'Accounting'
GROUP BY s.ID
HAVING COUNT(*) > 2;

-- # name
-- 'Michael'
-- 'Dalton'
-- 'Shoji'
-- 'Wehen'
-- 'Uchiyama'
-- 'Schill'
-- 'Kaminsky'
-- 'Giannoulis'

-- Find the sections that had maximum enrollment in Fall 2010. 
show tables;
desc takes;
select * from section;


select max(cnt) from (
	select count(*) as cnt from takes as T2
	group by course_id, sec_id
) as D;

select count(*) as cnt from takes as T2
	group by course_id, sec_id
    order by cnt;
    
select course_id, sec_id from takes as T1
where semester = "Fall" and year = 2010
group by course_id, sec_id
having count(*) = ( select max(cnt) from (
	select count(*) as cnt from takes as T2
    where semester = "Fall" and year = 2010
	group by course_id, sec_id
) as D );

SELECT course_id, sec_id 
FROM takes
WHERE semester = 'Fall' AND year = 2010
GROUP BY course_id, sec_id
HAVING COUNT(ID) = (
    SELECT MAX(enrollment_count) 
    FROM (
        SELECT COUNT(ID) AS enrollment_count
        FROM takes
        WHERE semester = 'Fall' AND year = 2010
        GROUP BY course_id, sec_id
    ) AS subquery
);

-- # course_id, sec_id
-- '867', '2'

--  Find student names and the number of law courses taken for students who have taken at least half of the available law courses. 
-- (These courses are named things like 'Tort Law' or 'Environmental Law'). 

describe student;
describe takes;
describe course;

select name, count(*)
from student as S
join takes T on S.ID = T.ID
where T.course_id in (
	select course_id
    from course
    where title like "%Law%" )
group by S.ID
having count(*) >= ( 
	select count(course_id) / 2 
	from (   
		select course_id
		from course
		where title like "%Law%" ) 
        as D 
	);

-- # name, count(*)
-- 'Nakajima', '4'
-- 'Nikut', '4'
-- 'Hahn-', '4'
-- 'Nanda', '4'
-- 'Schinag', '4'

