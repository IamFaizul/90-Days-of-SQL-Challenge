use 90daysofsql;

-- Q92.Find the top paying customer in each city (by total completed payment amount), along with their total amount and number of completed orders.



WITH customer_totals AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        r.city,
        SUM(p.amount) AS total_amount,
        COUNT(DISTINCT o.order_id) AS total_orders,
        ROW_NUMBER() OVER (PARTITION BY r.city ORDER BY SUM(p.amount) DESC) AS rn
    FROM onlinecustomers c
    JOIN onlineorders o ON c.customer_id = o.customer_id
    JOIN restaurants r ON o.restaurant_id = r.restaurant_id
    JOIN payments p ON o.order_id = p.order_id
    WHERE p.payment_status = 'Completed'
    GROUP BY c.customer_id, c.customer_name, r.city
)
SELECT customer_id, customer_name, city, total_amount, total_orders
FROM customer_totals
WHERE rn = 1;

