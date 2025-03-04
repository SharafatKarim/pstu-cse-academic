use small_uni;

-- Create a relational database for employee salary maintenance with attributes EmployeeID (PK), EmployeeName, Department, Salary, Month. 
-- From Employee Table, transform rows into columns in MySQL

CREATE TABLE employee (
    employee_id INT,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    month VARCHAR(50),
    PRIMARY KEY (employee_id, month)
);

INSERT INTO employee (employee_id, employee_name, department, salary, month)
VALUES
(1, 'Alice', 'HR', 5555, 'January'),
(1, 'Alice', 'HR', 5555, 'February'),
(1, 'Alice', 'HR', 5555, 'March'),
(2, 'BOB', 'IT', 5555, 'January'),
(2, 'BOB', 'IT', 5555, 'February'),
(2, 'BOB', 'IT', 5555, 'March');

INSERT INTO employee (employee_id, employee_name, department, salary, month)
VALUES
(3, 'BOB', 'IT', 5555, 'March');

select * from employee;

SELECT 
    employee_id, 
    employee_name, 
    department,
    MAX(CASE WHEN Month = 'January' THEN Salary END) AS January,
    MAX(CASE WHEN Month = 'February' THEN Salary END) AS February,
    MAX(CASE WHEN Month = 'March' THEN Salary END) AS March
FROM employee
GROUP BY employee_id, employee_name, department;

SELECT 
    employee_id, 
    employee_name, 
    department
FROM employee
GROUP BY employee_id, employee_name, department;

SELECT 
    Employee_ID, 
    Employee_Name, 
    Department,
    MAX(CASE WHEN Month = 'January' THEN Salary END) AS January,
    MAX(CASE WHEN Month = 'February' THEN Salary END) AS February,
    MAX(CASE WHEN Month = 'March' THEN Salary END) AS March
FROM employee
GROUP BY Employee_ID, Employee_Name, Department;

SELECT e.Employee_ID, e.Employee_Name, e.Department, s.Salary, s.Month
FROM employee e
INNER JOIN employee s ON e.Employee_ID = s.Employee_ID;

DELETE FROM employee
WHERE Employee_ID NOT IN (
    SELECT MIN(Employee_ID) FROM employee 
    GROUP BY Employee_ID, Month
);

SELECT MIN(Employee_ID) FROM employee 
    GROUP BY Employee_ID, Month;
    
SELECT course.DEPT_NAME ,instructor.SALARY 
FROM course ,instructor 
WHERE SALARY > all (SELECT SALARY FROM instructor WHERE DEPT_NAME = 'Astronomy') 
ORDER BY DEPT_NAME;

select * from instructor;