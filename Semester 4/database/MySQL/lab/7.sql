use university;

SELECT 
    title
FROM
    course
WHERE
    dept_name = 'Comp. Sci.' AND credits = 3;
    
select distinct takes.ID 
from takes, instructor, teaches
where takes.course_id = teaches.course_id and
takes.sec_id = teaches.sec_id and
takes.semester = teaches.semester and
takes.year = teaches.year and
teaches.id = instructor.id and
instructor.name = 'Einstein';

desc instructor;
select salary
from instructor
order by salary desc
limit 1;

select max(salary)
from
 instructor;

-- a. Find the titles of courses in the Comp. Sci. department that have 3 credits.
select title
from course
where dept_name = 'Comp. Sci.' and credits = 3;
-- b. Find the IDs of all students who were taught by an instructor named Einstein; make sure there are no duplicates in the result.
select takes_table.ID 
from takes takes_table
join teaches teaches_table
	on takes_table.course_id = teaches_table.course_id
    and takes_table.sec_id = teaches_table.sec_id
    and takes_table.semester = teaches_table.semester
    and takes_table.year = teaches_table.year 
where teaches_table.ID = ( select ID from instructor
where name = "Einstein" ) ;
-- c. Find the highest salary of any instructor.
desc instructor;
select salary
from instructor
order by salary desc
limit 1;

-- Find all instru tors earning the highest salary (there may be more than
-- one with the same salary).

select ID, name
from instructor
where salary = (
	select salary
	from instructor
	order by salary desc
	limit 1
);

select ID, name
from instructor
where salary = (select max(salary) from instructor);

-- Find the enrollment of each section that was offered in Fall 2017.
desc takes;

select course_id, sec_id, count(*)
from takes
where year = 2017 and 
semester = "Fall"
group by course_id, sec_id;

select takes.course_id, takes.sec_id, count(ID) 
from section, takes 
where takes.course_id= section.course_id 
	and takes.sec_id = section.sec_id 
	and takes.semester = section.semester 
	and takes.year = section.year 
    and takes.semester = 'Fall' 
    and takes.year = 2017 
group by takes.course_id, takes.sec_id ;

-- Find the maximum enrollment, a ross all se tions, in Fall 2017.
SELECT course_id, sec_id 
FROM takes
WHERE semester = 'Fall' AND year = 2017
GROUP BY course_id, sec_id
HAVING COUNT(ID) = (
    SELECT MAX(enrollment_count) 
    FROM (
        SELECT COUNT(ID) AS enrollment_count
        FROM takes
        WHERE semester = 'Fall' AND year = 2017
        GROUP BY course_id, sec_id
    ) AS subquery
);

with sec_enrollment as ( 
	select takes.course_id, takes.sec_id, count(ID) as enrollment 
    from section, takes 
    where takes.year = section.year 
		and takes.semester = section.semester 
		and takes.course_id = section.course_id 
        and takes.sec_id = section.sec_id 
        and takes.semester = 'Fall' and takes.year = 2017 
	group by takes.course_id, takes.sec_id) 
select course_id, sec_id 
from sec_enrollment 
where enrollment = (select max(enrollment) from sec_enrollment) ;

-- Find the names of Biology students who have taken at least 3 Accounting courses.
select name
from student natural join (
	select ID from takes
	where course_id in ( select course_id from course
		where dept_name = "Accounting")
		group by ID having count(*) > 2
    ) as T where dept_name = "Biology";

SELECT s.name
FROM student s
JOIN takes t ON s.ID = t.ID
JOIN course c ON t.course_id = c.course_id
WHERE s.dept_name = 'Biology'
AND c.dept_name = 'Accounting'
GROUP BY s.ID
HAVING COUNT(*) > 2;

-- Find the sections that had the maximum enrollment in Fall 2017.
desc section;
desc takes;

select sec_id, course_id
from takes
where year = 2017 
and semester = "Fall"
group by sec_id, course_id
having count(*)
order by count(*) desc
limit 1;

select * from section;

WITH sec_enrollment AS (
    SELECT
        t.course_id, t.sec_id, COUNT(t.ID) AS enrollment
    FROM section s
    JOIN takes t 
        ON t.year = s.year
        AND t.semester = s.semester
        AND t.course_id = s.course_id
        AND t.sec_id = s.sec_id
    WHERE t.semester = 'Fall'
      AND t.year = 2017
    GROUP BY t.course_id, t.sec_id
)
SELECT course_id, sec_id
FROM sec_enrollment
WHERE enrollment = (SELECT MAX(enrollment) FROM sec_enrollment);

-- Find the total grade points earned by the student with ID '12345', across all courses taken by the student.

desc course;

select sum(credits * points)
from takes, course, grade_points
where takes.grade = grade_points.grade
and takes.course_id = course.course_id
and ID = '12345';

select
 sum(credits * points)/sum(credits) as GPA
from
 takes, course, grade_points
where
 takes.grade = grade_points.grade
and takes.course_id = course.course_id
and ID= '12345';

select
 ID, sum(credits * points)/sum(credits) as GPA
from
 takes, ourse, grade_points
where
 takes.grade = grade_points.grade
and takes.course_id = course.course_id
group by ID;

--  In rease the salary of ea h instru tor in the Comp. S i. department by
-- 10%.

update instructor
set salary = salary * 1
where dept_name = "Comp. Sci.";

-- b. Delete all courses that have never been offered (i.e., do not occur in the section relation).
delete from course
where course_id not in (
	select course_id from section
);

-- c. Insert every student whose tot_cred attribute is greater than 100 as an instructor in the same department, with a salary of $10,000.
desc instructor;
desc student;

insert into instructor 
select ID, name, dept_name, 100000 
from student
where tot_cred > 100;

select
 count(distinct person.driver_id)
from
 accident, participated, person, owns
where
 accident.report_number = participated.report_number
and owns.driver_id = person.driver_id
and owns.license_plate = participated.license_plate
and year = 2017;