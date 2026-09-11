use project1;

select * from pizzas; -- pizza_type_id
select * from pizza_types; -- pizza_type_id
select * from orders; -- order_id
select * from order_details; -- order_id

-- pizza_id common in pizzas and order_details
-- pizza_type_id common in pizzas and pizza_type_id
-- order_id common in order_details and orders

-- 1.	Retrieve the total number of orders placed.
select count(order_id) as Total_orders from orders;

-- 2.	Calculate the total revenue generated from pizza sales.
select round(sum(od.quantity * p.price)) as Total_revnue from pizzas p join order_details od 
on p.pizza_id = od.pizza_id;

-- 3.	Identify the highest-priced pizza.
select max(price) as High_price_pizza from pizzas;

-- 4.	Identify the most common pizza size ordered. Size, quantity
select p.size,sum(od.quantity) as Total_quantity from pizzas p join order_details od
on p.pizza_id = od.pizza_id 
group by p.size 
order by Total_quantity desc
limit 1;


-- 5.	List the top 5 most ordered pizza types along with their quantities.
select pt.name,sum(od.quantity) as Total_quantity from pizza_types pt join pizzas p
on p.pizza_type_id = pt.pizza_type_id
join order_details od 
on p.pizza_id = od.pizza_id
group by pt.name
order by Total_quantity desc
limit 5;

-- 




