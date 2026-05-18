-- use caars;
-- show tables;
-- select * from luxury_cars;
-- SELECT city, AVG(price)
-- FROM orders
-- GROUP BY city;
-- use indian_cars;

-- select * from cars;
-- SELECT city, AVG(price)
-- FROM cars
-- GROUP BY city;
-- show tables;

-- select * from cars;
-- SELECT brand ,model, AVG(torque_nm) FROM cars
-- GROUP BY brand and model; #brand
-- -- windows 
-- SELECT brand,model,torque_nm,
-- AVG(torque_nm) OVER(PARTITION BY brand) AS avg_torque
-- FROM cars;


# it is a type of function which will give you the calculation of the rows for each row 
# each row

/*

windows function perform calculation on multiple rows
across set of rows without collapsing rows into single 
rows and give that calculated output
to each row


*/

use shadidb;
use employees;
show tables;
select * from employees
order by first_name;

-- create database emp2;
use emp2;
# over it display the non agreegate function
SELECT 
    emp_id,
    name,
    salary,
    SUM(salary) OVER() AS total_salary,
    CONCAT(ROUND((salary / SUM(salary) OVER()) * 100), '%') AS percentage
FROM employees;

select emp_id, name , salary,sum(salary) over(order by emp_id) 
from employees; 

#running sum ,cummulative sum,rank desk,roll no.,lag lead

select emp_id, name , salary,sum(salary) over(order by department) 
from employees;  

-- partition by
-- over ka kaam hota hai ki group ka ek windows for eg hr ka group it means over a window
-- 
-- select * ,sum(salary) over partition by department,sum(salary) over() from employees;

SELECT *,SUM(salary) OVER (PARTITION BY department),SUM(salary) OVER () FROM employees;

SELECT name,
    department,
    salary,
    SUM(salary) OVER (PARTITION BY department),
    CONCAT(
        ROUND(
            salary / SUM(salary) OVER (PARTITION BY department) * 100,
            2
        ),
        '%'
    )
FROM employees;

select * from employees
sum(salary) over(partition by hire_year order by salary) from employees;
























