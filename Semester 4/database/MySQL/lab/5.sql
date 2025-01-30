use university;

select name, course_id
from student, takes
where student.ID = takes.ID;

select name, course_id
from student natural join takes;

-- Find the names of those departments whose budget is higher than that of Astronomy. List them
-- in alphabetic order.

select dept_name 
from department 
where budget > (select budget 
	from department
	where dept_name = "Astronomy");
    
-- # dept_name
-- 'Athletics'
-- 'Biology'
-- 'Cybernetics'
-- 'Finance'
-- 'History'
-- 'Math'
-- 'Physics'
-- 'Psychology'

-- Display a list of all instructors, showing each instructor's ID and the number of sections taught.
-- Make sure to show the number of sections as 0 for instructors who have not taught any section. 

select ID, count(*)
from instructor
where (
	select * from teaches
    where instructor.ID = teaches.ID
    )
group by id;


