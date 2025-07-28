use 90daysofsql;

-- Q66. Identify "loyal genre buyers" — customers who bought books from only one genre but 
-- made at least 4 purchases and spent over $500 in total.

WITH customer_summary AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        b.genre,
        COUNT(DISTINCT o.order_id) AS total_orders,
        COUNT(DISTINCT genre) AS genre_count,
        SUM(b.price * o.quantity) AS total_spent
    FROM bookcustomers c
    INNER JOIN bookorders o ON c.customer_id = o.customer_id
    INNER JOIN books b ON o.book_id = b.book_id
    GROUP BY c.customer_id, c.customer_name, b.genre
)

SELECT 
    customer_id,
    customer_name,
    genre,
    total_orders,
    total_spent
FROM customer_summary
WHERE genre_count = 1
  AND total_orders >= 4
  AND total_spent > 500;
  
-- Q67. Find the top 5 customers who have ordered the same book multiple times.

WITH repeat_orders AS (
    SELECT 
        o.customer_id,
        o.book_id,
        COUNT(DISTINCT o.order_id) AS order_count,
        SUM(o.quantity) AS total_quantity
    FROM bookorders o
    GROUP BY o.customer_id, o.book_id
    HAVING COUNT(DISTINCT o.order_id) > 1
)

SELECT 
    c.customer_id,
    c.customer_name,
    r.book_id,
    b.title AS book_title,
    r.order_count AS total_repeat_orders,
    r.total_quantity,
    (b.price * r.total_quantity) AS total_spent
FROM repeat_orders r
JOIN bookcustomers c ON c.customer_id = r.customer_id
JOIN books b ON b.book_id = r.book_id
ORDER BY total_repeat_orders DESC
LIMIT 5;

