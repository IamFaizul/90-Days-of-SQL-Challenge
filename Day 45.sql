use 90daysofsql;
-- Q90. Find the top 3 restaurants by total revenue for each city and each quarter, only for restaurants 
-- that have completed at least 200 orders.

WITH revenue_cte AS (
    SELECT 
        r.city,
        QUARTER(o.order_date) AS quarter_number,
        r.restaurant_id,
        r.restaurant_name,
        SUM(p.amount) AS total_revenue,
        COUNT(DISTINCT o.order_id) AS total_orders
    FROM restaurants r
    INNER JOIN onlineorders o 
        ON r.restaurant_id = o.restaurant_id
    INNER JOIN payments p 
        ON o.order_id = p.order_id
    WHERE p.payment_status = 'Completed'
    GROUP BY r.city, QUARTER(o.order_date), r.restaurant_id, r.restaurant_name
    HAVING COUNT(DISTINCT o.order_id) >= 200
),
ranked_cte AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY city, quarter_number 
                              ORDER BY total_revenue DESC) AS rn
    FROM revenue_cte
)
SELECT city, quarter_number, restaurant_id, restaurant_name, total_revenue, rn AS ranking
FROM ranked_cte
WHERE rn <= 3
ORDER BY city, quarter_number, rn;


-- Q91. Identify customers who: Have placed at least 50 completed orders in two consecutive quarters. 
-- Increased their average order value (AOV) in the later quarter compared to the earlier one.

WITH customer_quarter_stats AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        QUARTER(o.order_date) AS quarter_number,
        ROUND(SUM(p.amount) / COUNT(DISTINCT o.order_id), 2) AS AOV,
        COUNT(DISTINCT o.order_id) AS total_orders
    FROM customers c
    INNER JOIN onlineorders o 
        ON c.customer_id = o.customer_id
    INNER JOIN payments p 
        ON o.order_id = p.order_id
    WHERE p.payment_status = 'Completed'
    GROUP BY c.customer_id, c.customer_name, QUARTER(o.order_date)
    HAVING COUNT(DISTINCT o.order_id) >= 50
),
comparison_cte AS (
    SELECT 
        curr.customer_id,
        curr.customer_name,
        curr.quarter_number,
        prev.AOV AS previous_quarter_AOV,
        curr.AOV AS current_quarter_AOV
    FROM customer_quarter_stats curr
    INNER JOIN customer_quarter_stats prev
        ON curr.customer_id = prev.customer_id
        AND curr.quarter_number = prev.quarter_number + 1
)
SELECT *
FROM comparison_cte
WHERE current_quarter_AOV > previous_quarter_AOV
ORDER BY customer_id, quarter_number;

