use caars;
show tables;
select * from luxury_cars;
SELECT city, AVG(price)
FROM orders
GROUP BY city;
use indian_cars;

select * from cars;
SELECT city, AVG(price)
FROM cars
GROUP BY city;
show tables;

select * from cars;
SELECT brand ,model, AVG(torque_nm) FROM cars
GROUP BY brand and model; #brand
-- windows 
SELECT brand,model,torque_nm,
AVG(torque_nm) OVER(PARTITION BY brand) AS avg_torque
FROM cars;


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

create database emp2;
use emp2;

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

















