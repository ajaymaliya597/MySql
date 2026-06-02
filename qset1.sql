-- =========================
-- EMPLOYEES TABLE
-- =========================
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    manager_id INT NULL
);

INSERT INTO employees VALUES
(101,'Alice Johnson','IT',72000,NULL),
(102,'Bob Smith','IT',65000,101),
(103,'Carol White','HR',58000,NULL),
(104,'David Brown','HR',54000,103),
(105,'Eva Green','Finance',80000,NULL),
(106,'Frank Black','Finance',75000,105),
(107,'Grace Lee','IT',68000,101),
(108,'Henry Wilson','Marketing',60000,NULL),
(109,'Ivy Turner','Marketing',56000,108),
(110,'Jack Davis','Finance',70000,105),
(111,'Karen Moore','IT',63000,101),
(112,'Leo Harris','HR',50000,103),
(113,'Mia Clark','Marketing',62000,108),
(114,'Nate Lewis','Finance',78000,105),
(115,'Olivia Walker','IT',71000,101),
(116,'Paul Hall','HR',53000,103),
(117,'Quinn Young','Marketing',59000,108),
(118,'Rachel King','Finance',82000,105),
(119,'Sam Scott','IT',66000,101),
(120,'Tina Adams','HR',55000,103);

-- =========================
-- CUSTOMERS TABLE
-- =========================
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(30),
    join_year INT
);

INSERT INTO customers VALUES
(201,'Aarav Mehta','Mumbai','India',2021),
(202,'Priya Sharma','Delhi','India',2020),
(203,'Rohan Gupta','Pune','India',2022),
(204,'Sunita Patel','Ahmedabad','India',2021),
(205,'Vikram Rao','Bangalore','India',2019),
(206,'Neha Singh','Chennai','India',2023),
(207,'Arjun Kumar','Hyderabad','India',2020),
(208,'Deepa Nair','Kochi','India',2022),
(209,'Sanjay Joshi','Jaipur','India',2021),
(210,'Meera Iyer','Coimbatore','India',2023),
(211,'Ravi Verma','Lucknow','India',2020),
(212,'Anita Das','Kolkata','India',2019),
(213,'Kiran Reddy','Vizag','India',2022),
(214,'Pooja Shah','Surat','India',2021),
(215,'Amit Bose','Nagpur','India',2023),
(216,'Tara Menon','Trivandrum','India',2020),
(217,'Nikhil Kulkarni','Nashik','India',2022),
(218,'Swati Chatterjee','Bhopal','India',2019),
(219,'Rahul Pandey','Patna','India',2021),
(220,'Divya Tiwari','Indore','India',2023);

-- =========================
-- PRODUCTS TABLE
-- =========================
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price INT,
    stock_qty INT
);

INSERT INTO products VALUES
(301,'Laptop','Electronics',55000,30),
(302,'Smartphone','Electronics',22000,80),
(303,'Headphones','Electronics',3500,120),
(304,'Monitor','Electronics',18000,45),
(305,'Keyboard','Accessories',1500,200),
(306,'Mouse','Accessories',900,250),
(307,'Desk Chair','Furniture',8500,40),
(308,'Standing Desk','Furniture',22000,15),
(309,'Webcam','Electronics',4200,70),
(310,'USB Hub','Accessories',1200,180),
(312,'Pen Set','Stationery',250,600),
(313,'Printer','Electronics',12000,25),
(314,'Scanner','Electronics',9000,20),
(315,'External SSD','Electronics',7500,60),
(316,'Lamp','Furniture',2200,90),
(317,'Whiteboard','Office Supplies',3800,35),
(318,'Cable Organiser','Accessories',600,300),
(319,'Power Bank','Electronics',2800,100),
(320,'Smart Watch','Electronics',15000,55);

-- =========================
-- ORDERS TABLE
-- =========================
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    amount INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders VALUES
(1001,201,301,1500,'2024-01-05'),
(1002,202,302,2300,'2024-01-12'),
(1003,203,303,800,'2024-02-03'),
(1004,201,304,3200,'2024-02-14'),
(1005,204,301,1100,'2024-03-01'),
(1006,205,302,4500,'2024-03-15'),
(1007,202,303,950,'2024-03-22'),
(1008,206,304,2100,'2024-04-05'),
(1009,203,301,1750,'2024-04-18'),
(1010,207,302,3300,'2024-04-30'),
(1011,204,303,680,'2024-05-10'),
(1012,208,304,2900,'2024-05-22'),
(1013,205,301,1200,'2024-06-08'),
(1014,201,302,2700,'2024-06-15'),
(1015,209,303,500,'2024-06-28'),
(1016,206,304,3800,'2024-07-07'),
(1017,207,301,1600,'2024-07-19'),
(1018,210,302,4100,'2024-07-25'),
(1019,208,303,720,'2024-08-02'),
(1020,209,304,2200,'2024-08-14');

#q1
show tables;
select department,count(*) from employees
group by department;
#q2
select department,avg(salary) from employees
group by department
having avg(salary) > 60000;
#q3
select department,sum(salary) as ts from employees
group by department
having sum(salary) > 60000
order by ts desc;
#q4
select department,count(*),avg(salary) 
from employees
group by department
having count(*)>4 and avg(salary)>53000;
select * from orders;
#q5
select customer_id,count(*) as oc,
sum(amount) as ta
from orders
group by customer_id
having oc>=2 and ta>5000;

#tp.2
#q1
select * from customers; 
select * from orders; 
select c.customer_name,count(*) from customers c
join orders o
on
c.customer_id=o.customer_id
group by c.customer_name;
#q2
select * from products; 
select * from orders; 
select p.product_name,sum(o.amount) from products p
join orders o
on
p.product_id=o.product_id
group by p.product_name;

#q3
select * from products; 
select * from orders;
select * from employees;
select * from customers;
use qset1;
show tables; 
select * from amount;
select p.category,sum(p.stock_qty) from products p
group by p.category;
#q4
select * from products; 
select * from orders;
select * from employees;
select * from customers; 
select c.customer_name,sum(o.amount) from customers c
join orders o on
c.customer_id=o.customer_id
group by c.customer_name;
#q5
select * from products; 
select * from orders;
select * from employees;
select * from customers; 
select p.category,avg(o.amount),count(distinct o.customer_id)
from products p
join orders o
on
p.product_id=o.product_id
group by p.category;

-- Q1. List every employee along with their manager's 
-- name. Employees with no manager should still appear
-- (show NULL or 'No Manager').
select * from products; 
select * from orders;
select * from employees;
select * from customers;
select e.emp_id,e.manager_id from 
employees e; 
select e.emp_name, ifnull(m.emp_name,'No Manager') as manager_name from 
employees e
left join employees m on e.manager_id = m.emp_id;

select e.emp_name,e.salary ,m.emp_name as manager_name,
m.salary as m_salary
from employees e
join employees m on 
e.manager_id = m.emp_id
where e.salary >= m.salary;




USE qset1;

-- ==========================
-- TOPIC 1
-- ==========================

-- T1 Q1
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department;

-- T1 Q2
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- T1 Q3
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC;

-- T1 Q4
SELECT department,
       COUNT(*) AS emp_count,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING COUNT(*) > 4
   AND AVG(salary) > 55000;

-- T1 Q5
SELECT customer_id,
       COUNT(*) AS order_count,
       SUM(amount) AS total_amount
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 5000;

-- ==========================
-- TOPIC 2
-- ==========================

-- T2 Q1
SELECT c.customer_name,
       COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- T2 Q2
SELECT p.product_name,
       SUM(o.amount) AS total_revenue
FROM products p
JOIN orders o
ON p.product_id = o.product_id
GROUP BY p.product_name;

-- T2 Q3
SELECT category,
       SUM(stock_qty) AS total_stock
FROM products
GROUP BY category;

-- T2 Q4
SELECT c.customer_name,
       c.city,
       SUM(o.amount) AS total_spend
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id,c.customer_name,c.city
HAVING SUM(o.amount) > 3000;

-- T2 Q5
SELECT p.category,
       AVG(o.amount) AS avg_order_amount,
       COUNT(DISTINCT o.customer_id) AS distinct_customers
FROM products p
JOIN orders o
ON p.product_id = o.product_id
GROUP BY p.category;

-- ==========================
-- TOPIC 3
-- ==========================

-- T3 Q1
SELECT e.emp_name,
       IFNULL(m.emp_name,'No Manager') AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

-- T3 Q2
SELECT e.emp_name,
       e.salary,
       m.emp_name AS manager_name,
       m.salary AS manager_salary
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;

-- T3 Q3
SELECT e.emp_name,
       e.department
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id
WHERE m.emp_name='Alice Johnson';

-- T3 Q4
SELECT m.emp_name AS manager_name,
       m.department,
       COUNT(*) AS team_size,
       AVG(e.salary) AS avg_report_salary
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id
GROUP BY m.emp_id,m.emp_name,m.department
HAVING COUNT(*) >= 3;

-- T3 Q5
SELECT e1.emp_name AS emp1,
       e2.emp_name AS emp2,
       e1.department,
       ABS(e1.salary-e2.salary) AS salary_diff
FROM employees e1
JOIN employees e2
ON e1.department=e2.department
AND e1.emp_id<e2.emp_id
WHERE ABS(e1.salary-e2.salary)<=5000;

-- ==========================
-- TOPIC 4
-- ==========================

-- T4 Q1
SELECT emp_name,department,salary
FROM employees
WHERE salary >
(
 SELECT AVG(salary)
 FROM employees
);

-- T4 Q2
SELECT *
FROM employees
WHERE salary=
(
 SELECT MAX(salary)
 FROM employees
);

-- T4 Q3
SELECT product_name,category,price
FROM products
WHERE price >
(
 SELECT AVG(price)
 FROM products
 WHERE category='Electronics'
);

-- T4 Q4
SELECT emp_name,
       department,
       salary
FROM employees
WHERE department=
(
 SELECT department
 FROM employees
 WHERE salary=
 (
   SELECT MAX(salary)
   FROM employees
 )
)
AND salary<
(
 SELECT MAX(salary)
 FROM employees
);

-- T4 Q5
SELECT order_id,
       customer_id,
       amount
FROM orders
WHERE amount >
(
 SELECT AVG(amount)
 FROM orders
);

-- ==========================
-- TOPIC 5
-- ==========================

-- T5 Q1
SELECT *
FROM employees
WHERE department IN
(
 SELECT department
 FROM employees
 WHERE salary > 75000
);

-- T5 Q2
SELECT product_name,
       category,
       price
FROM products
WHERE price < ALL
(
 SELECT price
 FROM products
 WHERE category='Furniture'
);

-- T5 Q3
SELECT customer_id,
       customer_name,
       city
FROM customers
WHERE customer_id IN
(
 SELECT customer_id
 FROM orders
);

-- T5 Q4
SELECT emp_name,
       department,
       salary
FROM employees
WHERE salary > ANY
(
 SELECT salary
 FROM employees
 WHERE department='HR'
);

-- T5 Q5
SELECT p.product_id,
       p.product_name
FROM products p
WHERE NOT EXISTS
(
 SELECT *
 FROM orders o
 WHERE o.customer_id=201
 AND o.product_id<>p.product_id
);

-- ==========================
-- TOPIC 6
-- ==========================

-- T6 Q1
SELECT emp_name,
       department,
       salary,
(
 SELECT AVG(salary)
 FROM employees e2
 WHERE e2.department=e1.department
) AS dept_avg_salary
FROM employees e1
WHERE salary >
(
 SELECT AVG(salary)
 FROM employees e2
 WHERE e2.department=e1.department
);

-- T6 Q2
SELECT order_id,
       customer_id,
       amount,
CASE
WHEN amount >
(
 SELECT AVG(amount)
 FROM orders o2
 WHERE o2.customer_id=o1.customer_id
)
THEN 'Above Avg'
ELSE 'Below Avg'
END AS vs_customer_avg
FROM orders o1;

-- T6 Q3
SELECT customer_id,
       customer_name,
       city
FROM customers c
WHERE NOT EXISTS
(
 SELECT *
 FROM orders o
 WHERE o.customer_id=c.customer_id
);

-- T6 Q4
SELECT e1.emp_name,
       e1.department,
       e1.salary,
       COUNT(e2.emp_id) AS higher_earners_in_dept
FROM employees e1
LEFT JOIN employees e2
ON e1.department=e2.department
AND e2.salary>e1.salary
GROUP BY e1.emp_id,e1.emp_name,e1.department,e1.salary;

-- T6 Q5
SELECT p.product_name,
       o.amount AS max_order_amount,
       o.order_date
FROM products p
JOIN orders o
ON p.product_id=o.product_id
WHERE o.amount=
(
 SELECT MAX(amount)
 FROM orders
);











