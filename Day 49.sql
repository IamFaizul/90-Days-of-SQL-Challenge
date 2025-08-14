use 90daysofsql;
-- Q95. Find the top 3 customers in each city who have spent the most (only completed payments).
-- Show city, customer_id, customer_name, and their total_spent.

WITH customer_spending AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        r.city,
        SUM(p.amount) AS total_spent,
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
    city, 
    customer_id, 
    customer_name, 
    total_spent
FROM customer_spending
WHERE rn <= 3
ORDER BY city, total_spent DESC;

