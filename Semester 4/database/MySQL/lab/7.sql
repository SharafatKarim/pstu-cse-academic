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

select * from student where ID = "12345";
create index studentID_index on student(ID);

desc student;

	select ID, 
		case
			when name=score < 40 then "F"
			when name=score < 60 then "C"
			when name=score < 80 then "B"
			else "A"
		end
	from marks;

with grades as ( 
select ID, 
	case
		when name=score < 40 then "F"
        when name=score < 60 then "C"
        when name=score < 80 then "B"
        else "A"
    end
from marks ) 
select grade, count(ID)
from grades
group by grade;

select dept_name
from department
where lower(dept_name) like "%sci%";

-- a. Find the ID, name, and city of residence of each employee who works for
-- “First Bank Corporation”.
select e.ID, e.person name, city
from employee as e, works as w
where w.company_name = "First Bank Corporation" and
	w.ID = e.ID;

-- b. Find the ID, name, and city of residence of each employee who works for “First Bank Corporation” and earns more than $10000.
select e.ID, e.person name, city
from employee as e, works as w
where w.company_name = "First Bank Corporation" and
	w.salary > 10000 and
	w.ID = e.ID;
    
describe instructor;

with tb as (
	select salary
    from instructor
)
select salary from tb
;

describe student;
SELECT DISTINCT student.ID, student.name
FROM student
JOIN takes ON student.ID = takes.ID
JOIN course ON takes.course_id = course.course_id
WHERE course.dept_name = 'Comp. Sci.';

    -- 11. Write the following queries in SQL, using the university schema:
-- a. Find the ID and name of each student who has taken at least one Comp. Sci. course; make sure there are no duplicate names in the result.
SELECT DISTINCT student.ID, student.name
FROM student
JOIN takes ON student.ID = takes.ID
JOIN course ON takes.course_id = course.course_id
WHERE course.dept_name = 'Comp. Sci.';

-- b. Find the ID and name of each student who has not taken any course offered before 2017.
SELECT student.ID, student.name
FROM student
WHERE student.ID NOT IN (
    SELECT takes.ID
    FROM takes
    WHERE takes.year < 2017
);

-- c. For each department, find the maximum salary of instructors in that department. You may assume that every department has at least one instructor.
SELECT dept_name, MAX(salary) AS max_salary
FROM instructor
GROUP BY dept_name;
-- d. Find the lowest, across all departments, of the per-department maximum salary computed by the preceding query.
SELECT MIN(max_salary) AS lowest_max_salary
FROM (
    SELECT dept_name, MAX(salary) AS max_salary
    FROM instructor
    GROUP BY dept_name
) AS dept_max_salaries;

-- Write the SQL statements using the university schema to perform the following operations:
-- a. Create a new course “CS-001”, titled “Weekly Seminar”, with 0 credits.
desc course;
show create table course;
SHOW COLUMNS FROM course;
INSERT INTO course (course_id, title, dept_name, credits)
VALUES ('CS-001', 'Weekly Seminar', 'Comp. Sci.', 0);
-- b. Create a section of this course in Fall 2017, with sec_id of 1, and with the location of this section not yet specified.
desc section;
INSERT INTO section (course_id, sec_id, semester, year)
VALUES ('CS-101', 1, 'Fall', 2017);
select * from course;
-- c. Enroll every student in the Comp. Sci. department in the above section.
INSERT INTO takes (ID, course_id, sec_id, semester, year)
SELECT student.ID, 'CS-001', 1, 'Fall', 2017
FROM student
WHERE student.dept_name = 'Comp. Sci.';
-- d. Delete enrollments in the above section where the student’s ID is 12345.
DELETE FROM takes
WHERE course_id = 'CS-001'
  AND sec_id = 1
  AND semester = 'Fall'
  AND year = 2017
  AND ID = '12345';
-- e. Delete the course CS-001. What will happen if you run this delete statement without first deleting offerings (sections) of this course?
DELETE FROM course
WHERE course_id = 'CS-001';
-- f. Delete all takes tuples corresponding to any section of any course with the word “advanced” as a part of the title; ignore case when matching the word with the title.
DELETE FROM takes
WHERE course_id IN (
    SELECT course_id
    FROM course
    WHERE LOWER(title) LIKE '%advanced%'
);

-- Write SQL DDL corresponding to the schema in Figure 3.17. Make any reasonable assumptions about data types, and be sure to declare primary and foreign keys.
create table person(
	driver_id integer primary,
    name varchar(100) not null,
    address varchar(100)
);
create table car(
    license_plate varchar(100) primary,
    model varchar(50),
    year varchar(10)
);
create table accident(
	report_number integer primary,
    year varchar(10),
    location varchar(100)
);
create table owns(
	driver_id integer,
    license_plate varchar(100),
    primary key (report_number, license_plate)
);
create table participated(
	report_number integer,
    license_plate varchar(100),
	driver_id integer,
    damage_amount varchar(100),
    primary key (report_number, license_plate)
);