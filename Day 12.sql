use 90daysofsql;

-- Q29. For each product category, calculate the return rate in 2024.

with pending_orders as (
select category, count(distinct(o.order_id)) as total_product,
count(distinct case when status = "Pending" then o.order_id end) as pending
from orders o inner join order_items ot on o.order_id = ot.order_id
inner join product_catalog p on p.product_id = ot.product_id
where year(o.order_date) = 2024
group by category
)

select category, round((pending/total_product)*100,2) as pending_orders_percnetage from pending_orders;


-- Q30. Identify the top 3 users who have purchased products from the widest variety of categories (consider only completed orders in 2024).

select u.user_id,u.user_name, count(distinct category) as total_purchased from users u inner join orders o on u.user_id = o.user_id 
inner join order_items ot on o.order_id = ot.order_id inner join product_catalog p 
on p.product_id = ot.product_id
where status = "Completed" and year(o.order_date) = 2024
group by u.user_id, u.user_name
order by total_purchased desc limit 3;

-- Q31. Find the top 3 cities with the highest number of unique users who placed at least one completed order in 2024. 

select city, count(distinct u.user_id) as unique_users
from users u inner join orders o 
on u.user_id = o.user_id 
where status = "Completed" and year(order_date) = 2024
group by city
order by unique_users desc limit 3;

-- Q31. Find the top 3 cities with the highest number of unique users who placed at least two completed orders in 2024. 

WITH users_with_2plus_orders AS (
    SELECT 
        o.user_id
    FROM orders o
    WHERE o.status = 'Completed'
      AND YEAR(o.order_date) = 2024
    GROUP BY o.user_id
    HAVING COUNT(o.order_id) >= 2
)

SELECT 
    u.city,
    COUNT(DISTINCT u.user_id) AS unique_users_with_2plus_orders
FROM users u
INNER JOIN users_with_2plus_orders u2 ON u.user_id = u2.user_id
GROUP BY u.city
ORDER BY unique_users_with_2plus_orders DESC
LIMIT 3;

















