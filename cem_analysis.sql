
-- *********************   DATA ANALYSIS  ************************************

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

CREATE VIEW v2_employees AS
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
FROM employees e
JOIN salaries s 
ON s.emp_no = e.emp_no;

-- 2. List employees who were hired in 1986.

CREATE VIEW v2_hired86 AS
SELECT e.last_name, e.first_name, e.hire_date
FROM employees e
WHERE e.hire_date >= '1986-1-1' 
AND e.hire_date <= '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.

CREATE VIEW v3_startend AS
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_manager dm 
JOIN departments d
ON dm.dept_no = d.dept_no
JOIN employees e
ON e.emp_no = dm.emp_no;

--4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

CREATE VIEW v4_department AS
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dep_emp de 
JOIN employees e
ON de.emp_no = e.emp_no
JOIN departments d
ON d.dept_no = de.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

CREATE VIEW v5_herculesB AS
SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.

CREATE VIEW v6_salesD AS
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dep_emp de
JOIN employees e
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

CREATE VIEW v7_salesDD AS
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dep_emp de
JOIN employees e
ON e.emp_no = de.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT e.last_name, COUNT(e.last_name) AS "Last Name Frequency"
FROM employees e
GROUP BY e.last_name
ORDER BY "Last Name Frequency" DESC;

