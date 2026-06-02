create database cte;
use cte;
-- storing a result on a temprorary basis

with test as 
(select actor_id,count(film_id) as movieCount from sakila.film_actor group by 
actor_id )

select sum(movieCount) from test where actor_id>10;    

select * from (
select * ,max(salary) over (partition by dept) as deptMax from employees
) as temp
where salary = deptmax ;
with xyz as (
select dept,max(salary) as deptMax 
);
