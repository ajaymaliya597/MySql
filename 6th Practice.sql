use sakila;
show tables;
select * from employees;

#1
select emp_id,first_name,last_name,department,
salary from employees where salary between 
65000 and 85000;

#2
select emp_id,first_name,last_name,department,
job_title from employees where 
department in ('IT','Finance');
#3
select emp_id,first_name,last_name,department from employees
where last_name like '%son' ;
#4
select emp_id,first_name,last_name,job_title,salary from employees
where is_active='Y' and department ='IT' ;
#5
select upper(first_name) as first_name_upper,last_name,salary from employees
where department ='Finance' ;

#6
select emp_id,first_name,length(first_name) as name_length,department
 from employees where length(first_name)>4;
 
 use sakila;
 show tables;
 select * from actor;
#7
select emp_id,concat(first_name,last_name) as full_name,
length(concat(first_name,last_name)) as full_name_length from employees where department = 'Marketing';

#8
select emp_id,first_name,last_name, hire_date,year(hire_date) as hire_year ,(2026-year(hire_date)) as
years_ago from employees where department = 'Finance';

#9
select emp_id,first_name,last_name,
salary,round(salary,-4) as rounded_salary,mod(salary,10000) as salary_remainder from employees;

#10
select emp_id,first_name,last_name,email from employees where email like '%outlook.com';

#11
SELECT 
    emp_id,
    first_name,
    last_name,
    hire_date,
    DATEDIFF('2026-04-28', hire_date) AS days_employed
FROM employees
WHERE DATEDIFF('2026-04-28', hire_date) > 2000
ORDER BY days_employed DESC;
#12
select emp_id,first_name,last_name,email, SUBSTRING(email, 1, LOCATE('@', email) - 1) 
as username from employees;
#13
select concat(first_name,last_name) as full_name,department,
salary from employees where department not in ('IT','Finance') and salary not between 
60000 and 80000 order by salary desc;  
#14
SELECT emp_id,
       first_name,
       last_name,
       email,
       UPPER(SUBSTRING(email,1,LOCATE('@',email)-1)) AS username_upper,
       LENGTH(SUBSTRING(email,1,LOCATE('@',email)-1)) AS username_length
FROM employees
WHERE LENGTH(SUBSTRING(email,1,LOCATE('@',email)-1)) > 6;

#15
SELECT emp_id,
       CONCAT(first_name,' ',last_name) AS full_name,
       birth_date,
       TIMESTAMPDIFF(YEAR,birth_date,'2026-04-28') AS age,
       salary,
       department
FROM employees
WHERE TIMESTAMPDIFF(YEAR,birth_date,'2026-04-28') BETWEEN 30 AND 38
AND is_active = 'Y'
AND salary > 65000
ORDER BY age ASC, salary DESC;

 
