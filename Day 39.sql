use 90daysofsql;

-- Q79. Find the top 3 genres where customers have collectively spent the most money on books they rated 4 or higher.

WITH genre_spending AS (
    SELECT 
        b.genre,
        SUM(price * quantity) AS total_spent
    FROM bookorders o
    INNER JOIN books b 
        ON o.book_id = b.book_id
    INNER JOIN bookreviews r
        ON r.book_id = b.book_id
       AND r.customer_id = o.customer_id
    WHERE r.rating >= 4
    GROUP BY b.genre
)
SELECT genre, total_spent
FROM genre_spending
ORDER BY total_spent DESC
LIMIT 3;

-- Q80. Find the top 5 customers who have given the highest number of reviews across all genres.
-- Also, calculate the average rating they have given.

WITH customer_reviews AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        COUNT(r.review_id) AS total_reviews,
        ROUND(AVG(r.rating), 2) AS avg_rating
    FROM bookcustomers c
    INNER JOIN bookreviews r
        ON c.customer_id = r.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT *
FROM customer_reviews
ORDER BY total_reviews DESC
LIMIT 5;

-- Q81. Find the top 3 genres where customers have collectively spent the highest total amount on books.For each genre, also display:
-- Total amount spent and Number of distinct customers who purchased that genre

WITH genre_spending AS (
    SELECT 
        b.genre,
        SUM(o.quantity * b.price) AS total_spent,
        COUNT(DISTINCT o.customer_id) AS total_customers
    FROM books b
    INNER JOIN bookorders o
        ON b.book_id = o.book_id
    GROUP BY b.genre
)
SELECT *
FROM genre_spending
ORDER BY total_spent DESC
LIMIT 3;


