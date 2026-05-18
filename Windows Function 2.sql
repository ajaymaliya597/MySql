select *,max(salary) over (partition by dept order by hire_year) from employees;
select *,sum(salary) over (partition by dept order by hire_year) from employees;
select *,avg(salary) over (partition by dept order by hire_year) from employees;

select *,avg(salary) over (partition by dept),
case 
	when salary > avg(salary) over(partition by dept) then 'Above avg salary'
	else 'Less then Money'
	end
    as Statement
	from employees;
    
select *,row_number() over (partition by dept) from employees;

#ranking
select * , rank() over(partition by dept) from employees;
select * , rank() over(order by salary desc) from employees;
select * , rank() over(partition by dept order by salary desc) from employees;