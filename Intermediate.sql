select * from pizzas; -- pizza_type_id
select * from pizza_types; -- pizza_type_id
select * from orders; -- order_id
select * from order_details; -- order_id

-- pizza_id common in pizzas and order_details
-- pizza_type_id common in pizzas and pizza_type_id
-- order_id common in order_details and orders


-- 1.	Join the necessary tables to find the total quantity of each pizza category ordered.
select pt.category as pizza_category,sum(od.quantity) as Quantity from pizza_types pt join pizzas p 
on p.pizza_type_id = pt.pizza_type_id
join order_details od
on p.pizza_id = od.pizza_id
group by pt.category;

-- 2.	Determine the distribution of orders by hour of the day.
select hour(time),count(order_id) as Total_order_per_hour
from orders 
group by hour(time)
order by hour(time) asc;

-- 3.	Join relevant tables to find the category-wise distribution of pizzas.
select category ,count(name) as Total_pizza_dist from pizza_types
group by category;

-- 4.	Group the orders by date and calculate the average quantity number of pizzas ordered per day. 
select o.date,avg(od.quantity) as avg_quantity from order_details od join orders o
on o.order_id = od.order_id 
group by o.date;


-- 5.	Determine the top 3 most ordered pizza types based on revenue.
select pt.name,round(sum(od.quantity * p.price)) as Total_revnue from pizzas p join pizza_types pt
on p.pizza_type_id = pt.pizza_type_id
join order_details od 
on od.pizza_id = p.pizza_id 
group by pt.name
order by Total_revnue desc 
limit 3;

