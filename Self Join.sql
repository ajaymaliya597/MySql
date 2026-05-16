create database joindb;

use joindb;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);

INSERT INTO employees (emp_id, emp_name, department, manager_id, salary) VALUES
(1, 'Amit', 'Management', NULL, 120000),
(2, 'Neha', 'HR', 1, 75000),
(3, 'Raj', 'IT', 1, 90000),
(4, 'Simran', 'Finance', 1, 85000),
(5, 'Karan', 'IT', 3, 70000),
(6, 'Priya', 'IT', 3, 72000),
(7, 'Rohit', 'HR', 2, 50000),
(8, 'Anjali', 'HR', 2, 52000),
(9, 'Vikas', 'Finance', 4, 65000),
(10, 'Sneha', 'Finance', 4, 62000),
(11, 'Arjun', 'IT', 5, 55000),
(12, 'Pooja', 'IT', 5, 53000),
(13, 'Meera', 'HR', 7, 45000),
(14, 'Dev', 'Finance', 9, 48000),
(15, 'Nitin', 'IT', 6, 51000);



#mera khud ka unique no. se ke bajaye manager id se karte hai compare
#empid == mid == supermid is never correct 
select * from employees;
select empl.emp_id,empl.emp_name,empl.manager_id,mngr.emp_id,mngr.emp_name
from employees as empl
join employees as mngr
where empl.manager_id = mngr.emp_id ;
# you need to find that employee whose department is same as the deparment of its manager

select e.emp_id,e.emp_name,e.department,m.emp_id,m.emp_name,m.department
from employees as e
join employees as m
where e.manager_id = m.emp_id and e.department = m.department ;


SELECT e1.emp_name as Employee ,
e2.emp_name as Manager FROM employees e1
join employees e2 
on 
e1.manager_id = e2.emp_id;

#you need to find the employee name and its salary if it is greater then
#then the salary of theri manager

select 
e.emp_name ,
e.salary as Employee_Salary,
m.emp_name as Manager,
m.salary as Manager_Salary
FROM employees e
join employees m 
on e.manager_id = m.emp_id
where e.salary > m.salary;

# show all the employee name with all the manager name

select 
e.emp_name as Employee ,
m.emp_name as Manager 
FROM employees e
join employees m 
on e.manager_id = m.emp_id;

# show the employee with its grand manager

select 
e.emp_name as Employee,
m.emp_name as Manager,
gm.emp_name as Grand_Manager
FROM employees e
join employees m
on e.manager_id = m.emp_id
join employees gm
on m.manager_id = gm.emp_id;

#find the employees who all the manager

select 
emp_name
FROM employees
where manager_id is not null; 























