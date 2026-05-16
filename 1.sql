use db;
CREATE TABLE employees (
    eid INT PRIMARY KEY,
    ename VARCHAR(100),
    salary DECIMAL(10,2),
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'John', 90000, NULL),   -- Top-level manager (CEO)
(2, 'Alice', 75000, 1),
(3, 'Bob', 70000, 1),
(4, 'Emma', 65000, 2),
(5, 'Michael', 60000, 2),
(6, 'Sophia', 62000, 2),
(7, 'David', 58000, 3),
(8, 'Olivia', 55000, 3),
(9, 'James', 50000, 4),
(10, 'Isabella', 52000, 4);

select * from employees;

select emp.eid,emp.name,emp.manager_id from employees as emp;

select mgr.eid,emp.name from employees1 as mngr;

select emp.eid,emp.name,emp.manager_id,mngr.eid,mngr.ename from employees1 as emp
join employees1 as mngr
where emp.manager_id  = mngr.eid;

use db;
CREATE TABLE regex (
    eid INT PRIMARY KEY,
    ename VARCHAR(100),
    manager_id INT
);
INSERT INTO regex VALUES
(10, 'naina', 11),
(11, 'tushar',NULL),   -- Top-level manager (CEO)
(12, 'abhi', 10);

/* person pid (pk)  foring key refer to the primary key of that table */
select * from regex;
show tables;

-- select e.name as Employee from employee as e;
-- inner join employee as m
-- on e.managerid=m.id where e.salary>m.salary 

-- select e.name as Employee from employee as e;
-- join employee as m
-- where e.managerid=m.id and e.salary>m.salary 

create database rmd;
use rmd;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2)
);


INSERT INTO customers VALUES
(1, 'John', 'New York'),
(2, 'Alice', 'Los Angeles'),
(3, 'Bob', 'Chicago'),
(4, 'Emma', 'Houston'),
(5, 'Michael', 'Phoenix'),
(6, 'Sophia', 'Dallas'),
(7, 'David', 'Seattle'),
(8, 'Olivia', 'Boston'),
(9, 'James', 'Denver'),
(10, 'Isabella', 'Miami');


INSERT INTO orders VALUES
(101, 1, 250.00),
(102, 2, 300.00),
(103, 1, 150.00),
(104, 3, 400.00),
(105, 5, 500.00),
(106, 7, 700.00),
(107, 7, 200.00),
(108, 9, 350.00),
(109, 11, 600.00),  -- No matching customer
(110, 12, 800.00);  -- No matching customer

/* 
cross join - A CROSS JOIN in SQL produces the Cartesian product of two or more tables, 
combining each row from the first table
 with every single row from the second table.
 Unlike other joins, it does not require a join condition (an ON clause) because it simply pairs all available rows. 

natural join - that will automatically join the two tables with same column name 
if same column is not present then it acts like a cross join an all

Q1 we have to find out the avg sakary of that empolyee ? and we dont know the department form avg salary of department ?

*/


use world;

select * from country;

select * from country where continent = (select continent from country where name = 'Armenia');
-- as of all the region of europe 
select * from country where region in (select region from country where continent='Europe');

-- get me all the country name whose population is = the highest population of europe
select max(population) from country;

select * from country where population = (select max(population) from country where continent='Europe');
-- get me all country name whose population is greater among all the population 
-- of africa

use world;

show tables;

select * from city
where name in (select name from country)
;



create database regex2;
use regex2;
CREATE TABLE employee (
    eid INT PRIMARY KEY,
    name VARCHAR(50),
    dept VARCHAR(50),
    salary DECIMAL(10,2)
);


INSERT INTO employee (eid, name, dept, salary) VALUES
(101, 'Amit', 'HR', 40000),
(102, 'Neha', 'HR', 45000),
(103, 'Raj', 'IT', 60000),
(104, 'Priya', 'IT', 75000),
(105, 'Suresh', 'IT', 50000),
(106, 'Anita', 'Finance', 55000),
(107, 'Vikram', 'Finance', 65000),
(108, 'Kavita', 'Finance', 48000),
(109, 'Rohit', 'Marketing', 52000),
(110, 'Sneha', 'Marketing', 58000);













