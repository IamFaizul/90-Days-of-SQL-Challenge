use 90daysofsql;

-- Q94. For each restaurant, find the quarter in which they achieved their highest total revenue from completed orders, along with that revenue amount. If two quarters tie, pick the earlier quarter.

WITH quarterly_revenue AS (
    SELECT 
        r.restaurant_id,
        r.restaurant_name,
        QUARTER(o.order_date) AS quarter_number,
        SUM(p.amount) AS total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY r.restaurant_id 
            ORDER BY SUM(p.amount) DESC, QUARTER(o.order_date) ASC
        ) AS rn
    FROM restaurants r
    INNER JOIN onlineorders o 
        ON r.restaurant_id = o.restaurant_id
    INNER JOIN payments p 
        ON o.order_id = p.order_id
    WHERE p.payment_status = 'Completed'
    GROUP BY r.restaurant_id, r.restaurant_name, QUARTER(o.order_date)
)
SELECT 
    restaurant_id,
    restaurant_name,
    quarter_number,
    total_revenue
FROM quarterly_revenue
WHERE rn = 1
ORDER BY total_revenue DESC;
