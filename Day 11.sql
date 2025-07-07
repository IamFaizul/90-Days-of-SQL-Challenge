use 90daysofsql;

-- Q24. Find the top 3 product categories that had the highest number of unique users purchasing from them
--  (consider only completed orders).

select category, count(distinct(o.user_id)) as unique_users from orders o inner join 
order_items ot on o.order_id = ot.order_id
inner join product_catalog p on ot.product_id = p.product_id
where status = "Completed"
group by p.category
order by unique_users desc limit 3
;

-- Q25. Identify the month in 2024 that had the highest number of new users (i.e., users who registered in that month).

select month(u.signup_date) as Month_number, monthname(u.signup_date) as Month_name,
count(distinct(u.user_id)) as unique_users from users u
where year(u.signup_date) = 2024
group by month(u.signup_date), monthname(u.signup_date)
order by unique_users desc limit 1;



-- Q26. Find the top 3 users who spent the most money in the first quarter of 2024 (i.e., January to March), 
-- considering only completed orders.

select u.user_id, u.user_name, sum(total_amount) as total_spent from orders o inner join users u 
on o.user_id = u.user_id
where quarter(order_date) = 1 and status = "Completed" and year(order_date) = 2024
group by o.user_id, u.user_name 
order by total_spent desc limit 3;

-- Q27. Find the top 3 products (by name) that generated the highest total revenue in 2024 from completed orders.

select product_name, sum(quantity * price_per_unit) as total_revenue from orders o inner join order_items ot 
on o.order_id = ot.order_id inner join product_catalog p 
on ot.product_id = p.product_id
where status = "Completed" and year(order_date) = 2024
group by p.product_id, p.product_name
order by total_revenue desc limit 3;


-- Q28. For each user, find their first completed order date and the total amount spent on that order.

with first_completed_orders as (
select o.user_id, order_date,
SUM(ot.price_per_unit * ot.quantity) AS order_total,
row_number() over(partition by o.user_id order by order_date) as rn
from orders o inner join users u 
on o.user_id = u.user_id inner join order_items ot 
on o.order_id = ot.order_id
where status = "Completed"
GROUP BY o.user_id, o.order_id, o.order_date
)
select user_id, total_spent, order_date from first_completed_orders 
where rn = 1;

WITH order_totals AS (
    SELECT 
        o.user_id, 
        o.order_id,
        o.order_date,
        SUM(ot.price_per_unit * ot.quantity) AS order_total
    FROM orders o
    INNER JOIN order_items ot ON o.order_id = ot.order_id
    WHERE o.status = 'Completed'
    GROUP BY o.user_id, o.order_id, o.order_date
),
first_completed_orders AS (
    SELECT 
        ot.user_id, 
        ot.order_date AS first_order_date,
        ot.order_total AS first_order_total_amount,
        ROW_NUMBER() OVER (PARTITION BY ot.user_id ORDER BY ot.order_date) AS rn
    FROM order_totals ot
)
SELECT 
    fco.user_id,
    u.user_name,
    fco.first_order_date,
    fco.first_order_total_amount
FROM first_completed_orders fco
INNER JOIN users u ON fco.user_id = u.user_id
WHERE fco.rn = 1
ORDER BY fco.user_id;

















