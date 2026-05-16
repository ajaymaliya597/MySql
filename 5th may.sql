use sakila;
select first_name, department,salary,if(department = 'IT' ,True,False) from employees;
select first_name, department,salary,if(department = 'IT' ,salary*0.1,salary*0.05) from employees;
#select first_name, department,salary,if(department = 'IT',salary*1.10,if(department = 'HR',salary=*1.05,salary)) from employees;
SELECT first_name, department, salary, IF(department = 'IT', salary * 1.10, 
IF(department = 'HR', salary * 1.05, salary)
) AS updated_salary
FROM employees;
/*select col1 ,col2,
case when cindition then statement 
and from table_name
*/
select first_name,department,salary,
case
when department = 'IT' then true
else 'Non IT'
end as 'new_salary'
from employees;

select first_name,department,salary,
case
when department = 'IT' then salary*1.1
when department = 'HR' then salary*0.05
else 'salary'
end as 'new_salary'
from employees;

# if the hiring date of an employee is before 2020 senior should be add if the year is 2021 then we print associate
#else remaing name
select first_name,department,salary,
case
when year(hire_date)<2020 then concat ('Senior ',job_title)
when year(hire_date)>2021  then concat ('Associate ',job_title)
else job_title
end as 'Revised Job Title'
from employees;
# if the salary > 70k create a category name as avg salry
# if the salary > 85k create a category name as high salry
#>1 lakh extreme high salary else print the category name as low salary

select first_name,department,salary,
case
when salary > 100000 then 'Avg Salary' 
when salary > 85000 then 'high Salary'
when salary > 75000 then 'Extreme High Salary'
else 'Low Salary'
end as 'Revised Salary Table'
from employees;

#select the joob title and print the column value based on the column condition like if how many job title has how many person
select job_title,count(job_title),
case
    when count(job_title)= 1 then concat (job_title,' position have ',count(job_title),'Person')
    when count(job_title)> 1 then concat (job_title,' position have ',count(job_title),'Persons')
end as
'data table'
from employees group by job_title;

SELECT job_title, COUNT(job_title),
CASE
    WHEN COUNT(job_title) = 1 THEN 
        CONCAT(job_title, ' position have ', COUNT(job_title), ' Person')
    WHEN COUNT(job_title) > 1 THEN 
        CONCAT(job_title, ' position have ', COUNT(job_title), ' Persons')
END AS job_summary
FROM employees
GROUP BY job_title;



