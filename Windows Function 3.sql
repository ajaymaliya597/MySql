create database rjdb1;

use rjdb1;

CREATE TABLE sales (
    id INT,
    sale_date DATE,
    amount INT
);


INSERT INTO sales VALUES
(1, '2026-01-01', 100),
(2, '2026-01-02', 200),
(3, '2026-01-03', 300),
(4, '2026-01-04', 400),
(5, '2026-01-05', 500);

-- windows functions
# lag /lead ==> isko hum order by or partition by k sath likh skte h 

select *, lag(sale_date,2) over() from sales;
select *, lead(sale_date,1) over() from sales;
select *, lead(sale_date,1,0) over(order by amount desc) from sales; # null nhi chahiye toh (sale_date ,1,0) 0 likh skte h '0' likhne se null hat jaayega 
-- row between => row between is a clause in window function which is use to specify the range of rows
# syntax=>  rows between<start_boundary> AND <end_boundary>
#unbounded preceding =>


select *, sum(amount) over(rows between unbounded preceding and current row) from sales;
select * from sales;
select *, sum(amount) over(rows between 1 preceding and current row) from sales;
 # Enpreceding=> kitni rows piche jana h yaha 1 likha h toh hum 1 row piche jaa rhe h 
 
 select *, sum(amount) over(rows between unbounded preceding and 1 following) from sales;
 
 
 #-- Calculate sum of current row and next row.
 
CREATE TABLE employees_sales (
sale_id INT,
employee_name VARCHAR(50),
department VARCHAR(50),
sale_date DATE,
sales_amount INT
);
INSERT INTO employees_sales VALUES
(1, 'Amit', 'Electronics', '2026-01-01', 500),
(2, 'Amit', 'Electronics', '2026-01-03', 700),
(3, 'Amit', 'Electronics', '2026-01-05', 600),
(4, 'Neha', 'Electronics', '2026-01-02', 800),
(5, 'Neha', 'Electronics', '2026-01-04', 900),
(6, 'Neha', 'Electronics', '2026-01-06', 750),

(7, 'Raj', 'Furniture', '2026-01-01', 300),
(8, 'Raj', 'Furniture', '2026-01-03', 450),
(9, 'Raj', 'Furniture', '2026-01-05', 500),
(10, 'Simran', 'Furniture', '2026-01-02', 400),
(11, 'Simran', 'Furniture', '2026-01-04', 550),
(12, 'Simran', 'Furniture', '2026-01-06', 650),
(13, 'Vikas', 'Clothing', '2026-01-01', 200),
(14, 'Vikas', 'Clothing', '2026-01-03', 250),
(15, 'Vikas', 'Clothing', '2026-01-05', 300),
(16, 'Priya', 'Clothing', '2026-01-02', 350),
(17, 'Priya', 'Clothing', '2026-01-04', 400),
(18, 'Priya', 'Clothing', '2026-01-06', 450),
(19, 'Karan', 'Electronics', '2026-01-07', 1000),
(20, 'Karan', 'Electronics', '2026-01-08', 1200);
 select * from employees_sales;
 
 -- Question 1 Find total sales by each department.
 SELECT employee_name,department,sales_amount,SUM(sales_amount) OVER(PARTITION BY department) AS total_department_sales FROM employees_sales;
 -- Question-2 Find average sales per employee.
SELECT employee_name, sales_amount,AVG(sales_amount) OVER(PARTITION BY employee_name) AS avg_sales;

-- Question-3 Rank employees by sales within each department.
SELECT employee_name,department,sales_amount,RANK() OVER(PARTITION BY department ORDER BY sales_amount DESC) AS sales_rank FROM employees_sales;

-- Question-4 Find previous sale amount for each employee.
SELECT employee_name, sale_date, sales_amount, LAG(sales_amount) OVER(PARTITION BY employee_name ORDER BY sale_date) AS previous_sale
FROM employees_sales;




