CREATE DATABASE OlistDB;
Go


USE OlistDB;
Go


--Show all customers
SELECT * FROM customers;

--Show all orders
SELECT * FROM orders;

--Count total customers
SELECT COUNT(*) AS total_customers
FROM customers;


--Count total orders
SELECT COUNT(*) AS total_orders
FROM orders;

--Show distinct states
SELECT DISTINCT customer_state
FROM customers;

--Show orders placed in 2018
SELECT *
FROM orders
WHERE YEAR(order_purchase_timestamp) = 2018;

--Show customers from city "sao paulo" 
SELECT *
FROM customers
WHERE customer_city = 'sao paulo';


--Count orders by status
Select order_status, count(*) as total_orders
from orders
group by order_status


--Show first 10 products
select top 10 * 
from products


--Show total payments

select * from payments
select sum(payment_value) as total_payments
from payments


--Average payment value
select avg(payment_value) as avg_payments
from payments

--Maximum payment value
select max(payment_value) as max_value
from payments


--Minimum payment value
select min(payment_value) as min_value
from payments


--Total orders per state
select * from orders
select * from customers

select c.customer_state, count(order_id) as total_orders
from customers c
join orders o 
on c.customer_id = o.customer_id
group by c.customer_state


--Find total orders per city
select c.customer_city, count(o.order_id) as total_orders
from customers c
join orders o 
on c.customer_id = o.customer_id
group by c.customer_city

--Find total orders per state sorted
select c.customer_state, count(o.order_id) as total_orders
from customers c
join orders o 
on c.customer_id = o.customer_id
group by c.customer_state
order by total_orders DESC

--Find top 5 states with most orders
select Top 5 c.customer_state, count(o.order_id) as total_orders
from customers c
join orders o 
on c.customer_id = o.customer_id
group by c.customer_state
order by total_orders DESC


--Total revenue by state
select c.customer_state, SUM(p.payment_value) as revenue 
from customers c
join orders o on c.customer_id = o.customer_id
join payments p on p.order_id = o.order_id
group by c.customer_state


--Orders per city
select customer_city, count(*) as total_orders
from customers
group by customer_city

--Average order payment
SELECT AVG(payment_value) as avg_payment
FROM payments;

--Number of sellers
SELECT COUNT(*) FROM sellers;

--Total products sold
SELECT SUM(order_item_id) as total_products
FROM order_items;


--Average review score
SELECT AVG(review_score) as avg_score
FROM reviews;


--Customers with their orders
select * from orders
select * from customers

select c.customer_unique_id, o.order_id
from customers c
join orders o 
on c.customer_id = o.customer_id

--Orders with payment value
select o.order_id, p.payment_value
from orders o 
join payments p
on o.order_id = p.order_id




--Orders with product IDs
select o.order_id, oi.product_id
from orders o
join order_items oi
on o.order_id = oi.order_id


--Product categories sold
select * from products
select * from order_items

select p.product_category_name
from products p
join order_items oi
on p.product_id = oi.product_id


--Seller for each order
select oi.order_id, oi.seller_id
from order_items oi


--Customer city with order count
select c.customer_city, count(o.order_id) as order_count
from customers c
Join orders o
on c.customer_id = o.customer_id
group by c.customer_city


--Total revenue per customer
SELECT c.customer_unique_id,
SUM(p.payment_value) as total_rev
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_unique_id;

--Orders with review score
select o.order_id, r.review_score
from orders o
join reviews r
on o.order_id = r.order_id


--Products with sellers
SELECT oi.product_id, oi.seller_id
FROM order_items oi; 

--Orders and payment type
SELECT o.order_id, p.payment_type
FROM orders o
JOIN payments p
ON o.order_id = p.order_id;

--Customers and states for each order
SELECT o.order_id, c.customer_state
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;

--Product and category
SELECT product_id, product_category_name
FROM products;


--Seller order counts
SELECT seller_id, COUNT(order_id) as order_counts
FROM order_items
GROUP BY seller_id;


--Payment per order
SELECT order_id, SUM(payment_value) as total_payment
FROM payments
GROUP BY order_id;


--Customers with reviews
SELECT c.customer_unique_id, r.review_score
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN reviews r ON o.order_id = r.order_id;


--Top 10 customers by spending
select Top 10
c.customer_unique_id, sum(p.payment_value) as total_spent
from customers c
join orders o on c.customer_id = o.customer_id
join payments p on o.order_id = p.order_id
group by c.customer_unique_id
order by total_spent DESC


