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




use regex2;

select * from employee;




select * from employee as e1 where salary > (select avg(salary) from employee where dept=e1.dept);

-- max salary of department
SELECT dept, salary
FROM employee e1
WHERE salary = (
    SELECT MAX(salary)
    FROM employee
    WHERE dept = e1.dept
);

 -- highest employyee paid
select *
from employee e1
where salary = (
    select max(salary)
    from employee
    where dept = e1.dept
);




