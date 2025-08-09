use 90daysofsql;
-- Q88. Find the top 3 customers per city for each month based on the total number of completed orders, 
-- but only for cities that had at least 1,000 completed orders that month.

WITH city_month_orders AS (
    SELECT 
        r.city,
        MONTH(o.order_date) AS month_num,
        c.customer_id,
        c.customer_name,
        COUNT(DISTINCT o.order_id) AS total_completed_orders
    FROM onlineorders o
    JOIN payments p 
        ON o.order_id = p.order_id
    JOIN restaurants r 
        ON o.restaurant_id = r.restaurant_id
    JOIN onlinecustomers c 
        ON o.customer_id = c.customer_id
    WHERE p.payment_status = 'Completed'
    GROUP BY r.city, MONTH(o.order_date), c.customer_id, c.customer_name
),
city_month_filter AS (
    SELECT city, month_num
    FROM city_month_orders
    GROUP BY city, month_num
    HAVING SUM(total_completed_orders) >= 1000
),
ranked_customers AS (
    SELECT 
        cmo.city,
        cmo.month_num,
        cmo.customer_name,
        cmo.total_completed_orders,
        ROW_NUMBER() OVER(PARTITION BY cmo.city, cmo.month_num 
                          ORDER BY cmo.total_completed_orders DESC) AS rn
    FROM city_month_orders cmo
    JOIN city_month_filter cmf
        ON cmo.city = cmf.city 
        AND cmo.month_num = cmf.month_num
)
SELECT *
FROM ranked_customers
WHERE rn <= 3
ORDER BY city, month_num, rn;


-- Q89.For each quarter, find the restaurant in each city whose average order value (AOV) improved 
-- the most compared to the previous quarter.

WITH quarterly_aov AS (
    SELECT 
        r.city,
        QUARTER(o.order_date) AS q_num,
        r.restaurant_id,
        r.restaurant_name,
        ROUND(SUM(p.amount) / COUNT(DISTINCT o.order_id), 2) AS AOV
    FROM onlineorders o
    JOIN payments p 
        ON o.order_id = p.order_id
    JOIN restaurants r 
        ON o.restaurant_id = r.restaurant_id
    WHERE p.payment_status = 'Completed'
    GROUP BY r.city, QUARTER(o.order_date), r.restaurant_id, r.restaurant_name
),
aov_with_prev AS (
    SELECT 
        q1.city,
        q1.q_num,
        q1.restaurant_name,
        q2.AOV AS prev_q_aov,
        q1.AOV AS curr_q_aov,
        (q1.AOV - q2.AOV) AS diff_aov
    FROM quarterly_aov q1
    JOIN quarterly_aov q2
        ON q1.city = q2.city
        AND q1.restaurant_id = q2.restaurant_id
        AND q1.q_num = q2.q_num + 1
)
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY city, q_num ORDER BY diff_aov DESC) AS rn
    FROM aov_with_prev
) t
WHERE rn = 1
ORDER BY city, q_num;
