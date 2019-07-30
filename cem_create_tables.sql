-- CREATE TABLES FOR DATABASE ********************

-- Create employee table

-- Create a type for Gender
CREATE TYPE gen AS ENUM ('F', 'M');

CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    birth_date DATE,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    gender gen,
    hire_date DATE
);

-- Present first 10 rows of employee table (after importing information)
SELECT * FROM employees
LIMIT (10);

-- Create departments table

CREATE TABLE departments (
    dept_no VARCHAR(20) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(30)
);

SELECT * FROM departments;

-- Create dep_emp table
CREATE TABLE dep_emp (
    emp_no INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    dept_no VARCHAR(20),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    from_date DATE,
    to_date DATE
);

-- Present first 10 rows of dep_emp table (after importing information)
SELECT * FROM dep_emp
LIMIT (10);

-- Create dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(20),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    emp_no INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    from_date DATE,
    to_date DATE
);

-- Present first 10 rows of dept_manager table (after importing information)
SELECT * FROM dep_emp
LIMIT (10);

-- Create salaries table
CREATE TABLE salaries (
    emp_no INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    salary INT,
    from_date DATE,
    to_date DATE
);

-- Present first 10 rows of salaries table (after importing information)
SELECT * FROM salaries
LIMIT (10);

-- Create titles table
CREATE TABLE titles (
    emp_no INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    title VARCHAR(40),
    from_date DATE,
    to_date DATE
);

-- Present first 10 rows of titles table (after importing information)
SELECT * FROM titles
LIMIT (10);