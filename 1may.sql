select * from sales;
select sum(amount) as total_sales from sales;
select sum(amount) as mobile_total_sales from sales where product = 'Mobile';
select sum(amount) as total_sales,avg(amount) from sales where product in('laptop','mobile') group by region = 'North';
select sum(amount),avg(amount) from sales where region = 'North' and product in('laptop','mobile');
-- toatl sales, avg sale for north regiion but for the product laptop and mobile
-- find out max amount and the min amount for feb month
select max(amount),min(amount) from sales where month(sale_date)=2;

-- find out the total sales we have done for each region
select * from sales;
select region,count(amount),sum(amount) as total_sales from sales group by region;
-- avg sales done by each person
select sales_person,avg(amount) from sales group by sales_person;
-- find total amnt and the total sales done for each product but the amit should not be the sales person
select product,sum(amount),count(amount) from sales where sales_person!='amit' group by product;
-- find the no. of sales  done by each person for the amount grater then 10000;
select sales_person,sum(amount),count(amount) from sales where amount>10000 group by sales_person;

-- find the no. of transactions done from day 1 to day 7 for any month
SELECT sales_person,COUNT(amount) AS total_transactions FROM sales WHERE DAY(sale_date) BETWEEN 1 AND 7
GROUP BY sales_person, MONTH(sale_date);

-- find the total amnt avg max amnt for each product for each region
select region,product,sum(amount),avg(amount),max(amount) from sales group by product,region;
select * from sales;
use sakila;
-- total transaction amount for each product where the product should be sold more then 13 times
select sum(amount) from sales group by product having count(sales_person)<13;

use sakila;
select sales_person,count(*) from sales group by sales_person having count(*)>8;
select sales_person,count(*) from sales group by sales_person having count(*)>8;

# find the total transaction done by cust in the decreasing order
select sales_person,sum(amount) from sales group by sales_person;

