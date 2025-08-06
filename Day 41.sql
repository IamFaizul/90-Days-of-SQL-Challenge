use 90daysofsql;

-- Q83. Find the top 3 genres that generated the highest total revenue from books with at least 2 reviews
WITH books_with_2_reviews AS (
    SELECT 
        b.book_id,
        b.genre,
        b.price,
        COUNT(r.review_id) AS review_count
    FROM books b
    INNER JOIN bookreviews r 
        ON b.book_id = r.book_id
    GROUP BY b.book_id, b.genre, b.price
    HAVING COUNT(r.review_id) >= 2
),

genre_revenue AS (
    SELECT 
        b2.genre,
        SUM(o.quantity * b2.price) AS total_revenue
    FROM books_with_2_reviews b2
    INNER JOIN bookorders o 
        ON b2.book_id = o.book_id
    GROUP BY b2.genre
)

SELECT *
FROM genre_revenue
ORDER BY total_revenue DESC
LIMIT 3;

-- Q84. Find the top 5 customers who spent the most money on books with the lowest rating they ever gave.

WITH lowest_rating AS (
    SELECT 
        customer_id,
        MIN(rating) AS min_rating
    FROM bookreviews
    GROUP BY customer_id
),

customer_lowest_spending AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(o.quantity * price) AS total_spent
    FROM bookcustomers c
    INNER JOIN bookorders o 
        ON c.customer_id = o.customer_id
    INNER JOIN books b 
        ON o.book_id = b.book_id
    INNER JOIN bookreviews r 
        ON r.book_id = b.book_id
       AND r.customer_id = c.customer_id
    INNER JOIN lowest_rating lr 
        ON c.customer_id = lr.customer_id
       AND r.rating = lr.min_rating
    GROUP BY c.customer_id, c.customer_name
)

-- Step 3: Top 5 customers
SELECT *
FROM customer_lowest_spending
ORDER BY total_spent DESC
LIMIT 5;

