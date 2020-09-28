
-- Does everything work?

SELECT * FROM "Employees" Limit(10);
SELECT * FROM "Departments" Limit(10);
SELECT * FROM "Dept_Emp" Limit(10);
SELECT * FROM "Dept_Manager" Limit(10);
SELECT * FROM "Titles" Limit(10);
SELECT * FROM "Salaries" Limit(10);

-- IT does, but I had to use quotes for some reason.

--Exercises

--1. List the following details of each employee: employee number, 
--last name, first name, sex, and salary.

CREATE VIEW EmployeeDetails AS
SELECT
	E.emp_no,
	E.first_name,
	E.last_name,
	E.sex,
	S.salary
FROM "Employees" AS E
INNER JOIN "Salaries" AS S
ON E.emp_no = S.emp_no;

SELECT * FROM EmployeeDetails LIMIT (10);

-- 2.List first name, last name, and hire date for 
--employees who were hired in 1986.
CREATE VIEW Employees1986 AS
SELECT
	E.first_name,
	E.last_name
FROM "Employees" AS E
WHERE E.hire_date >= '1986-01-01' AND
E.hire_date <= '1986-12-31';

SELECT * FROM Employees1986 LIMIT(10);

-- 3. List the manager of each department with the following: 
--department number, department name, 
--the manager's employee number, last name, first name.
CREATE VIEW DepartmentManager AS
SELECT
	D.dept_no,
	D.dept_name,
	M.emp_no,
	E.first_name,
	E.last_name
FROM "Departments" AS D
INNER JOIN "Dept_Manager" AS M
ON D.dept_no = M.dept_no
INNER JOIN "Employees" AS E
ON M.emp_no = E.emp_no;

SELECT * FROM DepartmentManager LIMIT(10);

-- 4. List the department of each employee with the following: 
--employee number, 
--last name, first name, and department name.
CREATE VIEW EmployeeDepartment AS
SELECT
	E.emp_no,
	E.first_name,
	E.last_name,
	D.dept_name
FROM "Employees" AS E
INNER JOIN "Dept_Emp" as F
ON E.emp_no = F.emp_no
INNER JOIN "Departments" as D
ON F.dept_no = D.dept_no;

SELECT * FROM EmployeeDepartment LIMIT(10);

-- 5. List first name, last name, and sex for employees 
-- whose first name is "Hercules"
--d last names begin with "B."
CREATE VIEW Hercules AS
SELECT
	first_name,
	last_name,
	sex
FROM "Employees"
WHERE first_name = 'Hercules' AND
last_name like 'B%';

SELECT * FROM Hercules
-- Women named Hercules? Okay...

--6. List all employees in the Sales department,
-- luding their employee number, last name, first name, 
--d department name.
CREATE VIEW Sales AS
SELECT
	E.emp_no,
	E.first_name,
	E.last_name,
	D.dept_name
FROM "Employees" AS E
INNER JOIN "Dept_Emp" as F
ON E.emp_no = F.emp_no
INNER JOIN "Departments" as D
ON F.dept_no = D.dept_no
WHERE D.dept_name = 'Sales';

SELECT * from Sales LIMIT(10)

--7. List all employees in the Sales and Development departments,
--including their employee number, last name,
--first name, and department name.
CREATE VIEW SalesDevelop AS
SELECT
	E.emp_no,
	E.first_name,
	E.last_name,
	D.dept_name
FROM "Employees" AS E
INNER JOIN "Dept_Emp" as F
ON E.emp_no = F.emp_no
INNER JOIN "Departments" as D
ON F.dept_no = D.dept_no
WHERE D.dept_name = 'Sales' OR
D.dept_name = 'Development';

SELECT * from SalesDevelop LIMIT(10);

--8. In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
CREATE VIEW LastNames AS
SELECT
last_name,
COUNT(emp_no) AS "Employees that share Last Name"
FROM "Employees"
GROUP BY last_name
ORDER BY "Employees that share Last Name" DESC;

SELECT *FROM LastNames LIMIT(10);




