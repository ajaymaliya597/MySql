create database subquery;
use subquery;
CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT);
INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);
show tables;


create table department (dept_id int ,dept_name varchar(20),location varchar(20) );
insert into department values (10,'HR','Mum'),(20,'IT','Ban'),(30,'Finance','Delhi');
select * from department;
select * from employees
where department = any (select dept_name from department where location in ('Banglore','Delhi'));

# CORRELATED SUBQUERY
# correlated subquery ia a type of subquery where the inner query is exectuted for each value of
# outer query

# inner query also refers to the coloumns of outer query

select * from employees as e where salary > (select avg(salary) from employees where department = e.department);

select * from employees as e where salary = (select max(salary) 
from employees where department = e.department);

select * from employees as e where 50000 <= all (

select salary from employees where department = e.department

);
