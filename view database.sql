create database views;
use views;
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(20),
    salary INT
);
INSERT INTO employees
VALUES
(101,'Ajay','IT',80000),
(102,'Rahul','HR',50000),
(103,'Priya','IT',90000),
(104,'Neha','Finance',45000);
SELECT * FROM employees;
CREATE VIEW it_employees AS
SELECT *
FROM employees
WHERE department='IT';
INSERT INTO employees
VALUES
(105,'Karan','IT',85000);
SELECT * FROM it_employees;
SELECT * FROM it_employees;

