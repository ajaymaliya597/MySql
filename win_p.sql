use emp_w;
DROP TABLE employees;

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(20),
    department VARCHAR(20),
    salary INT
);

INSERT INTO employees VALUES
(1,'Ajay','IT',50000),
(2,'kasiba','IT',70000),
(3,'Mohan','IT',70000),
(4,'Priya','HR',50000),
(5,'Neha','HR',40000),
(6,'Aman','HR',40000),
(7,'Karan','Sales',80000),
(8,'Simran','Sales',80000),
(9,'Riya','Sales',60000),
(10,'Pooja','Sales',50000);
set sql_safe_updates = 0;
update employees set emp_name = 'kasiba' where emp_id = 2;
select * from employees;

select emp_name,department,count(*) 
over(partition by department) as total_emp 
from employees;


select emp_name,department,salary emp_salary,
sum(salary) over(partition by department) as total_salary
from employees;

-- select department,count(*),emp_name from employees 
-- group by department,emp_name;

select emp_name,department,count(*) over(partition by department) from employees;

select * from employees;
select emp_name,department,salary,avg(salary) over(partition by department) from employees;
select * from employees;


select *,row_number() over(partition by department order by emp_id)
from employees;

select *,rank() over(partition by department order by salary asc) from employees;
select *,dense_rank() over(partition by department order by salary asc) from employees;
select *,lag(salary) over(order by salary asc) from employees;
select *,lead(salary) over(order by salary asc) from employees;


select emp_name, department ,salary , sum(salary)over(partition by department
order by salary) from employees;

select emp_name, department ,salary , count(*) over(partition by department) from employees;

select emp_name, department ,salary , rank() over(partition by department
order by salary
) from employees;

select emp_name, department ,salary , lag(salary) 
over(partition by department)
 from employees;