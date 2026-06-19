-- Create Database
CREATE DATABASE company_db_l;
USE company_db_l;

-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

-- Departments Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Insert Data into Employees
INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(1, 'Alice', 10),
(2, 'Bob', 20),
(3, 'Charlie', 30),
(4, 'Diana', 10),
(5, 'Edward', NULL);

-- Insert Data into Departments
INSERT INTO departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'IT'),
(40, 'Finance');

-- Verify Data
SELECT * FROM employees;
SELECT * FROM departments;

SELECT e.emp_name, d.dept_name
FROM employees AS e
INNER JOIN departments AS d
ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name
FROM employees AS e
LEFT JOIN departments AS d
ON e.dept_id = d.dept_id;


SELECT e.emp_name, d.dept_name
FROM employees AS e
RIGHT JOIN departments AS d
ON e.dept_id = d.dept_id;

-- SELECT e.emp_name, d.dept_name
-- FROM employees AS e
-- FULL OUTER JOIN departments AS d
-- ON e.dept_id = d.dept_id;
-- MySQL doesn't support FULL OUTER JOIN directly.
-- Use this workaround:
SELECT e.emp_name, d.dept_name FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
UNION
SELECT e.emp_name, d.dept_name FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;





