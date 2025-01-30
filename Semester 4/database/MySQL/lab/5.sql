use universipedia;
use university;

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
    I.ID, COUNT(T.ID)
FROM
    instructor AS I
        NATURAL LEFT JOIN
    teaches AS T
GROUP BY I.ID;

-- # ID, count(T.ID)
-- '14365', '2'
-- '15347', '1'
-- '16807', '0'
-- '19368', '3'
-- '22591', '13'
-- '25946', '1'
-- '28097', '2'
-- '28400', '2'
-- '31955', '0'
-- '3199', '4'
-- '3335', '2'
-- '34175', '3'
-- '35579', '0'
-- '36897', '5'
-- '37687', '0'
-- '4034', '0'
-- '41930', '3'
-- '4233', '1'
-- '42782', '1'
-- '43779', '4'
-- '48507', '1'
-- '48570', '1'
-- '50330', '1'
-- '50885', '0'
-- '52647', '0'
-- '57180', '0'
-- '58558', '0'
-- '59795', '0'
-- '63287', '2'
-- '63395', '0'
-- '64871', '0'
-- '6569', '10'
-- '65931', '1'
-- '72553', '0'
-- '73623', '1'
-- '74420', '6'
-- '74426', '0'
-- '77346', '6'
-- '78699', '0'
-- '79081', '6'
-- '79653', '0'
-- '80759', '1'
-- '81991', '2'
-- '90376', '1'
-- '90643', '1'
-- '95030', '0'
-- '95709', '4'
-- '96895', '0'
-- '97302', '0'
-- '99052', '9'

-- For each student who has retaken a course at least twice (i.e., the student has taken the course at
-- least three times), show the course ID and the student&#39;s ID. Please display your results in order
-- of course ID and do not display duplicate rows. 

select distinct takes.course_id, D.ID 
from
	( select distinct S.ID, count(T.ID) as cnt
		from student as S natural left join takes as T
		group by S.ID ) as D natural inner join takes
where D.cnt>1 ; 

-- select distinct S.ID, count(T.ID) as cnt
-- from student as S natural left join takes as T
-- group by S.ID;

-- Find the names of Biology students who have taken at least 3 Accounting courses.
