# qset 7
use  set7s;
-- Q1
SELECT emp_name, department, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;

-- Q2
SELECT emp_id, emp_name, department, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- Q3
SELECT emp_id, emp_name, department, salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

-- Q4
SELECT emp_name, department, hire_year
FROM employees
WHERE hire_year = (
    SELECT hire_year
    FROM employees
    WHERE emp_name = 'Rachel King'
)
AND emp_name <> 'Rachel King';

-- Q5
SELECT product_name, category, price
FROM products
WHERE price > (SELECT AVG(price) FROM products)
ORDER BY price DESC;

-- Q6
SELECT product_id, product_name, category, price
FROM products
WHERE price = (SELECT MAX(price) FROM products);

-- Q7
SELECT product_id, product_name, category, price
FROM products
WHERE price = (SELECT MIN(price) FROM products);

-- Q8
SELECT order_id, customer_id, amount
FROM orders
WHERE amount > (SELECT AVG(amount) FROM orders)
ORDER BY amount DESC;

-- Q9
SELECT order_id, customer_id, amount, order_date
FROM orders
WHERE amount = (SELECT MAX(amount) FROM orders);

-- Q10
SELECT customer_id, customer_name, city
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
)
ORDER BY customer_id;

-- Q11
SELECT customer_id, customer_name, city
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
)
ORDER BY customer_id;

-- Q12
SELECT product_id, product_name, category, price
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM orders
);

-- Q13
SELECT product_id, product_name, category, price
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM orders
);

-- Q14
SELECT emp_name, salary
FROM employees
WHERE department IN (
    SELECT dept_name
    FROM departments
    WHERE dept_name = 'Finance'
)
ORDER BY salary DESC;

-- Q15
SELECT emp_name, department, salary
FROM employees
WHERE salary < (
    SELECT MIN(salary)
    FROM employees
    WHERE department = 'Finance'
)
ORDER BY salary DESC;

-- Q16
SELECT dept_name, budget, location
FROM departments
WHERE budget = (
    SELECT MAX(budget)
    FROM departments
);

-- Q17
SELECT customer_id, customer_name, city
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) = 1
);

-- Q18
SELECT customer_id, customer_name, city
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) >= 2
)
ORDER BY customer_id;

-- Q19
SELECT product_name, category, price
FROM products
WHERE price > (
    SELECT MAX(price)
    FROM products
    WHERE category = 'Accessories'
)
ORDER BY price DESC;

-- Q20
SELECT order_id, customer_id, amount, order_date
FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM customers
    WHERE join_year = 2021
)
ORDER BY order_date;

-- Q21
SELECT emp_id, emp_name, department
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employees x
    WHERE x.manager_id = e.emp_id
)
ORDER BY emp_name;

-- Q22
SELECT emp_id, emp_name, department
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM employees x
    WHERE x.manager_id = e.emp_id
)
ORDER BY emp_id;

-- Q23
SELECT customer_id, customer_name, city
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
)
ORDER BY customer_id;

-- Q24
SELECT customer_id, customer_name, city
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
)
ORDER BY customer_id;

-- Q25
SELECT product_id, product_name, category
FROM products p
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.product_id = p.product_id
)
ORDER BY product_id;

-- Q26
SELECT emp_name, department, salary
FROM employees
WHERE department = (
    SELECT department
    FROM employees
    WHERE emp_id = 105
)
AND emp_id <> 105
ORDER BY salary DESC;

-- Q27
SELECT order_id, customer_id, amount, order_date
FROM orders
WHERE order_date = (
    SELECT MAX(order_date)
    FROM orders
);

-- Q28
SELECT order_id, customer_id, amount, order_date
FROM orders
WHERE order_date = (
    SELECT MIN(order_date)
    FROM orders
);

-- Q29
SELECT emp_name, department, salary
FROM employees
WHERE salary > (
    SELECT MAX(salary)
    FROM employees
    WHERE department = 'HR'
)
ORDER BY salary DESC;

-- Q30
SELECT order_id, customer_id, amount, status
FROM orders
WHERE status = 'Delivered'
AND amount > (
    SELECT AVG(amount)
    FROM orders
    WHERE status = 'Delivered'
)
ORDER BY amount DESC;

-- Q31
SELECT
    e.emp_name,
    e.department,
    e.salary,
    ROUND(
        (
            SELECT AVG(salary)
            FROM employees e2
            WHERE e2.department = e.department
        ),2
    ) AS dept_avg
FROM employees e
WHERE e.salary >
(
    SELECT AVG(salary)
    FROM employees e2
    WHERE e2.department = e.department
)
ORDER BY department, salary DESC;

-- Q32
SELECT
    e.emp_name,
    e.department,
    e.salary,
    (
        SELECT COUNT(*)
        FROM employees e2
        WHERE e2.department = e.department
        AND e2.salary > e.salary
    ) AS higher_earners
FROM employees e
ORDER BY department, salary DESC;

-- Q33
SELECT
    c.customer_id,
    c.customer_name,
    (
        SELECT SUM(amount)
        FROM orders o
        WHERE o.customer_id = c.customer_id
    ) AS total_spend
FROM customers c
WHERE (
    SELECT SUM(amount)
    FROM orders o
    WHERE o.customer_id = c.customer_id
) >
(
    SELECT AVG(total_spend)
    FROM (
        SELECT SUM(amount) AS total_spend
        FROM orders
        GROUP BY customer_id
    ) x
)
ORDER BY total_spend DESC;

-- Q34
SELECT emp_name, department, salary
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    GROUP BY department
    HAVING AVG(salary) > 65000
)
ORDER BY department, salary DESC;

-- Q35
SELECT
    order_id,
    customer_id,
    amount,
    CASE
        WHEN amount >= (
            SELECT AVG(amount)
            FROM orders o2
            WHERE o2.customer_id = o.customer_id
        )
        THEN 'Above Avg'
        ELSE 'Below Avg'
    END AS vs_cust_avg
FROM orders o
ORDER BY customer_id, order_id;

-- Q36
SELECT
    p.product_name,
    p.category,
    p.price,
    ROUND(
        (
            SELECT AVG(price)
            FROM products p2
            WHERE p2.category = p.category
        ),2
    ) AS cat_avg
FROM products p
WHERE p.price >
(
    SELECT AVG(price)
    FROM products p2
    WHERE p2.category = p.category
)
ORDER BY category, price DESC;

-- Q37
SELECT emp_name, department, salary
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE department = 'Marketing'
)
ORDER BY salary DESC;

-- Q38
SELECT emp_name, department, salary
FROM employees
WHERE salary < ALL (
    SELECT salary
    FROM employees
    WHERE department = 'Finance'
)
ORDER BY salary DESC;

-- Q39
SELECT customer_id, customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
)
AND NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
    AND o.status <> 'Delivered'
)
ORDER BY customer_id;

-- Q40
SELECT product_id, product_name, category
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM orders
    WHERE customer_id IN (
        SELECT customer_id
        FROM customers
        WHERE city = 'Mumbai'
    )
)
ORDER BY product_id;

-- Q41
SELECT emp_name, department, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);

-- Q42
SELECT d.dept_name AS department
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department = d.dept_name
    AND e.salary <= 50000
)
ORDER BY department;

-- Q43
SELECT customer_id, customer_name
FROM customers c
WHERE (
    SELECT COUNT(DISTINCT product_id)
    FROM orders o
    WHERE o.customer_id = c.customer_id
) >= 2
ORDER BY customer_id;

-- Q44
SELECT
    e.emp_name,
    e.department,
    e.salary,
    e.hire_year,
    ROUND(
        (
            SELECT AVG(salary)
            FROM employees e2
            WHERE e2.hire_year = e.hire_year
        ),2
    ) AS year_avg
FROM employees e
WHERE e.salary >
(
    SELECT AVG(salary)
    FROM employees e2
    WHERE e2.hire_year = e.hire_year
)
ORDER BY hire_year, salary DESC;

-- Q45
SELECT
    p.product_name,
    p.category,
    p.stock_qty,
    ROUND(
        (
            SELECT AVG(stock_qty)
            FROM products p2
            WHERE p2.category = p.category
        ),2
    ) AS cat_avg_stock
FROM products p
WHERE p.stock_qty < (
    SELECT AVG(stock_qty)
    FROM products p2
    WHERE p2.category = p.category
)
ORDER BY category, stock_qty ASC;