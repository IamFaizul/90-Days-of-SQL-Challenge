use 90daysofsql;

-- Q22. Which city has the highest average order value (AOV) for completed orders?

select city, round(sum(total_amount)/count(distinct(o.order_id)),2) as average_order_value from orders o inner join users u 
on o.user_id = u.user_id
where status = "Completed"
group by city
order by average_order_value desc limit 1;

-- Q23. Find the top 3 users who have purchased the highest total quantity of products across all categories, 
-- but only consider their completed orders.

select u.user_id,user_name, sum(quantity) as total_quantity_purchased from order_items ot inner join orders o
on ot.order_id = o.order_id inner join users u 
on o.user_id = u.user_id
where status = "Completed"
group by user_id, user_name
order by total_quantity_purchased desc limit 3;




