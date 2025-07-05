use 90daysofsql;

-- Q19. Find the names of users who placed their first order in the month of June 2024.

with orders_placed as (
select o.user_id,u.user_name, order_date, monthname(order_date),
row_number() over(partition by o.user_id order by order_date) as rn
from orders o inner join users u on o.user_id = u.user_id
)
select user_id,user_name,order_date from orders_placed where month(order_date) = 6 and year(order_date) = 2024 and rn=1;

-- Q20. Find the top 3 most frequently purchased products (by total quantity ordered) in completed orders only.

select ot.product_id,p.product_name, sum(quantity) as total_purchased from order_items ot inner join orders o
on ot.order_id = o.order_id inner join product_catalog p 
on ot.product_id = p.product_id
where status = "Completed"
group by ot.product_id
order by total_purchased desc limit 3;

-- Q20. Find the users who have placed more than one completed order, 
-- but have never ordered any product in the “Electronics” category.

select o.user_id, u.user_name, count(distinct(o.order_id)) as completed_orders from orders o
inner join users u on o.user_id = u.user_id inner join order_items ot on 
o.order_id = ot.order_id where status = "Completed" and 
o.user_id not in (
select o.user_id from orders o inner join order_items ot 
on o.order_id = ot.order_id inner join product_catalog p 
on ot.product_id = p.product_id where category = "Electronics"
)
group by o.user_id having completed_orders > 1;













