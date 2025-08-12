use 90daysofsql;
-- Q93. Find the top 3 customers in each city who have spent the most total amount in completed orders, 
-- along with their total spending and the number of orders they placed.

WITH customer_spend AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        r.city,
        SUM(p.amount) AS total_spent,
        COUNT(DISTINCT o.order_id) AS total_orders,
        ROW_NUMBER() OVER (
            PARTITION BY r.city 
            ORDER BY SUM(p.amount) DESC
        ) AS rn
    FROM onlinecustomers c
    INNER JOIN onlineorders o 
        ON c.customer_id = o.customer_id
    INNER JOIN restaurants r 
        ON o.restaurant_id = r.restaurant_id
    INNER JOIN payments p 
        ON o.order_id = p.order_id
    WHERE p.payment_status = 'Completed'
    GROUP BY c.customer_id, c.customer_name, r.city
)
SELECT 
    customer_id,
    customer_name,
    city,
    total_spent,
    total_orders,
    rn AS ranking
FROM customer_spend
WHERE rn <= 3
ORDER BY city, ranking;
