use 90daysofsql;

-- Q96. For each restaurant city, find the quarter with the highest revenue (only completed payments). Show:
-- city, quarter_number,total_revenue
-- If there is a tie, return all tied quarters.

WITH completedOrders AS (
    SELECT 
        r.city, 
        QUARTER(p.payment_date) AS quarter_number,
        SUM(p.amount) AS total_revenue,
        DENSE_RANK() OVER (
            PARTITION BY r.city 
            ORDER BY SUM(p.amount) DESC
        ) AS rn
    FROM restaurants r
    INNER JOIN onlineorders o 
        ON r.restaurant_id = o.restaurant_id 
    INNER JOIN payments p 
        ON o.order_id = p.order_id
    WHERE p.payment_status = 'Completed'
    GROUP BY r.city, QUARTER(p.payment_date)
)
SELECT 
    city, 
    quarter_number, 
    total_revenue
FROM completedOrders
WHERE rn = 1;


