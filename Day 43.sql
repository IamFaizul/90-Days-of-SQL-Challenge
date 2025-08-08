use 90daysofsql;

-- Q86. Find the top 3 restaurants in each city based on their total revenue from completed orders.

WITH toprestaurants
     AS (SELECT r.restaurant_id,
                city,
                r.restaurant_name,
                Sum(amount)                    AS total_revenue,
                Row_number()
                  OVER(
                    partition BY city
                    ORDER BY Sum(amount) DESC) AS rn
         FROM   restaurants r
                INNER JOIN onlineorders o
                        ON r.restaurant_id = o.restaurant_id
                INNER JOIN payments p
                        ON p.order_id = o.order_id
         WHERE  payment_status = "completed"
         GROUP  BY r.restaurant_id,
                   r.restaurant_name,
                   city)
SELECT restaurant_id,
       restaurant_name,
       city,
       total_revenue
FROM   toprestaurants
WHERE  rn BETWEEN 1 AND 3; 


-- Q87. find the top 2 restaurants in each city for every quarter of 2024, ranked by average order value, 
-- only considering restaurants that had at least 50 completed orders in that quarter.

WITH qualified_restaurants
     AS (SELECT r.restaurant_id
         FROM   restaurants r
                INNER JOIN onlineorders o
                        ON r.restaurant_id = o.restaurant_id
                INNER JOIN payments p
                        ON o.order_id = p.order_id
         WHERE  p.payment_status = 'Completed'
         GROUP  BY r.restaurant_id
         HAVING Count(o.order_id) >= 150),
     top2aov
     AS (SELECT c.customer_id,
                c.customer_name,
                r.city,
                Quarter(o.order_date)
                   AS quarter_number,
                Round(Sum(p.amount) / Count(DISTINCT o.order_id), 2)
                   AS AOV,
                Row_number()
                  OVER (
                    partition BY r.city
                    ORDER BY Round(Sum(p.amount) / Count(DISTINCT o.order_id), 2
                  )
                  DESC)
                   AS rn
         FROM   onlinecustomers c
                INNER JOIN onlineorders o
                        ON c.customer_id = o.customer_id
                INNER JOIN restaurants r
                        ON o.restaurant_id = r.restaurant_id
                INNER JOIN payments p
                        ON o.order_id = p.order_id
                INNER JOIN qualified_restaurants qr
                        ON r.restaurant_id = qr.restaurant_id
         WHERE  p.payment_status = 'Completed'
         GROUP  BY c.customer_id,
                   c.customer_name,
                   r.city,
                   Quarter(o.order_date))
SELECT customer_id,
       customer_name,
       city,
       quarter_number,
       aov,
       rn AS ranking
FROM   top2aov
WHERE  rn BETWEEN 1 AND 2; 










