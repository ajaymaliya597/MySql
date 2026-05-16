use assi;


drop table orders;
show tables;
select * from sales;


select category,sum(orderValue) from sales
group by category
order by category desc;
select category,count(orderID) from sales
group by category
order by category desc;
select category,max(orderValue) from sales
group by category
order by category desc;

select distinct category from sales group by category;

select distinct customerID from sales 
group by category,customerID;

select distinct customerID,category from sales 
group by category,customerID;

select distinct customerID,category from sales 
group by category,customerID;
select * from sales;
select customerID,category,sum(ordervalue) from sales 
group by customerID,category
order by customerid asc;

select customerID,category,count(ordervalue) from sales 
group by customerID,category
order by customerid,category;


select category,month(orderdate) as om,sum(ordervalue) from sales 
group by om, Category
order by om, Category;

select category,sum(ordervalue) as revenue from sales 
group by Category
having revenue > 20000
order by revenue desc;

select customerid,count(ordervalue) as order_count from sales 
group by customerid
having order_count > 1
order by order_count desc;


select customerid,category,sum(ordervalue) as revenue from sales 
group by customerid,category having revenue > 10000
order by revenue asc;


select category,count(ordervalue),sum(ordervalue),avg(ordervalue) as revenue from sales 
group by category having avg(ordervalue) > 5000
order by revenue asc;

select category ,month(orderdate) as mn,sum(ordervalue) as revenue,AVG(OrderValue) AS Avg_OrderValue from sales 
group by category,mn having ( min(orderid)>2 )
order by month(orderdate) ,revenue;


