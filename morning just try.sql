use set7s;
select product_id, product_name, category from products 
where product_id in (
select product_id from orders where customer_id in (
select customer_id from customers where city = 'Mumbai')
);
show tables;
select * from orders;