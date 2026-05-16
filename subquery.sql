# subquery is a type query where a query is present whithin another query
#this is also known as nested subquery
#QUERY inside query 


create database shadidb;
use shadidb;
CREATE TABLE biodata (
    id INT,
    name VARCHAR(20),
    age INT
);

INSERT INTO biodata (id, name, age)
VALUES
(1, 'Rahul', 28),
(2, 'Anjali', 28),
(3, 'Aishwarya', 40),
(4, 'Naina', 23);

select age from biodata where name= 'Rahul';
select * from biodata where age= 29;
select * from biodata where age= (select age from biodata where name= 'Rahul');
select * from biodata where age= (select max(age) from biodata);
select * from biodata where age= (select min(age) from biodata);
select * from biodata where char_length(name)= (select char_length(name) from biodata where name = 'Rahul');

select * from biodata where char_length(name)= 5;


#subquery types
/*
single row subquery = its a at ype of subquery in which inner query return only one row
multi row subquery = if it retrun multple rows is know as __


*/

use sakila;
select * from film;

# un movies ka naam nikalna where the rental rate is same for the movie of african egg
select title,rental_rate from film where rental_rate = (select rental_rate from film where title = 'African egg' );

 
#get the movie id , name where the rental rate = minimum rental rate
#get the movie id,movie name , duration where duration > avg duration of the movies
#get the movie id ,for the movies where the release year of the mocie = releasing  year pf the alone trip
# and the rating should be same as of the apollo team
select * from film ;
#1
select film_id, title from film where rental_rate = (select min(rental_rate)
from film); 
#2
select film_id, title,rental_duration from film where rental_duration > (select avg(rental_duration) from film); 
#3
select film_id, title from film where release_year = (select release_year
from film where title = 'ALONE TRIP' )and rating =(select rating from film where title = 'APOLLO TEEN'); 

#4

use shadidb;

select * from biodata;

use sakila;

select * from biodata where name ='Rahul' and age =28 or age = 40;
select * from biodata where name ='Rahul' and age = (select age from biodata where name = 'Anjali'
or name = 'Aishwarya'); #multi row subquery mein koi bhi arithmetic operator nhi chla skte hai foreg. = >
select * from biodata where age in (select age from biodata where name = 'Anjali'
or name = 'Aishwarya' and name!='Rahul');
select * from biodata where age not in (select age from biodata where name = 'Anjali'
or name = 'Aishwarya' and name!='Rahul');










use regexjoin;
CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT
);
INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);

select * from employees;

select avg(salary) from employees;
select * from employees where salary > (select avg(salary) from employees);


select salary from employees where emp_id = 101;
select * from employees where salary > (select salary from employees where emp_id=101);
#MULTI ROW
#A Multi Row Subquery returns MORE THAN ONE ROW. Since the result is a list, you cannot use = directly.
#You must use special operators: IN, ANY, or ALL.

select * from employees where department in
( select department from employees where name = 'Alice' or name = 'Bob');
# whose employe salry


select * from employees where salary not in (select salary from employees where emp_id not in (103,107))
;
#ANY Operator

select * from employees where salary > any (select salary from employees where emp_id in (103,107)) ;


select * from employees where salary > any (SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT =
'HR');
select * from employees where salary > all (SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT =
'HR');

select * from employees where salary > all (select salary from employees where department = 'IT'); 


#IT ke all ko filter kar rha hai only  
select salary from employees where department = 'IT';
select * from employees where salary > any (select salary from employees where department = 'IT');
select* from employees;


#find the employee detail who works in it department and have the salary > the salary of employee id 101
select * from employees where salary > any (select salary from employees where department = 'IT' or emp_id=101);
#find the name of person whose salary is > all the salary of hr and it department
select name from employees where salary > all (select salary from employees where department in ('hr','it'));
#find the empid and empl name of the user whose salary is > the salary of any employee working 
select emp_id,name from employees where salary > any (select salary from employees where manager_id = 101);
# under the manger_id 101
-- SELECT department
-- FROM employees
-- GROUP BY department
-- HAVING department IN ('HR', 'IT');
# find put the hifhest slary from this table
select * from employees where salary = (select max(salary) from employees);





# where the age is not equal or the age anjali and the ashwairya





