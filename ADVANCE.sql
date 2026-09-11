-- 1.	Calculate the percentage contribution of each pizza type to total revenue.
select pt.name,concat(round(sum(od.quantity * p.price) * 100 / (select sum(od.quantity * p.price) as Total_revnue from pizzas p join order_details od 
on p.pizza_id = od.pizza_id)),"%") as Pizza_contribution
from pizzas p join pizza_types pt
on p.pizza_type_id = pt.pizza_type_id
join order_details od 
on od.pizza_id = p.pizza_id 
group by pt.name
order by Pizza_contribution desc;

-- 2.	Analyze the cumulative revenue generated over time.
with revnue as
(select o.date as order_date,round(sum(od.quantity * p.price),2) as Daily_revnue 
from order_details od join pizzas p 
on od.pizza_id = p.pizza_id
join orders o 
on o.order_id = od.order_id
group by o.date) 
select order_date,Daily_revnue,sum(daily_revnue) over(order by order_date) as cum_rev from revnue;



-- 3.	Determine the top 3 most ordered pizza types based on revenue for each pizza category.
WITH X AS 
(select pt.category,pt.name as Pizza_name ,sum(od.quantity * p.price) as Revnue from pizzas p join pizza_types pt
on p.pizza_type_id = pt.pizza_type_id
join order_details od 
on od.pizza_id = p.pizza_id 
group by pt.category,pt.name)
SELECT * FROM 
(SELECT CATEGORY ,PIZZA_NAME,REVNUE,DENSE_RANK() OVER(partition by CATEGORY ORDER BY REVNUE DESC) AS rEVNUE_RANK FROM X)T
WHERE REVNUE_RANK <= 3;









