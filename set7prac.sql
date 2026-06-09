show databases;

use subquery_prac;

show tables;
#q1
select emp_name,department,
salary from employees 
where salary > (select avg(salary)
 from employees)
 order by salary desc;
 
 #q2
 select emp_id,emp_name,department,
salary from employees 
where salary = (select max(salary)
 from employees);
 
 #q3
select emp_id,emp_name,department,
salary from employees 
where salary = (select min(salary)
 from employees);
 
 
 #q4
select emp_name,department,
hire_year from employees 
where hire_year = (select hire_year
 from employees where 
 emp_name = 'Rachel King');









 
 
 
 


