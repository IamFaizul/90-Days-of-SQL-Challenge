use 90daysofsql;

-- Q73. Identify the customers who bought books across at least 2 different genres and whose average rating 
-- (from their own reviews) is higher than the overall average rating of all books. 
-- Return customer ID, name, their average rating, and the number of genres purchased.

WITH CustomerRatings AS (
    -- Calculate average rating per customer and count distinct genres they bought
    SELECT 
        c.customer_id,
        c.customer_name,
        AVG(r.rating) AS avg_customer_rating,
        COUNT(DISTINCT b.genre) AS genres_purchased
    FROM bookcustomers c
    INNER JOIN bookorders o 
        ON c.customer_id = o.customer_id
    INNER JOIN books b 
        ON o.book_id = b.book_id
    INNER JOIN bookreviews r
        ON r.book_id = b.book_id 
        AND r.customer_id = c.customer_id   
    GROUP BY c.customer_id, c.customer_name
),
OverallAverage AS (
  
    SELECT AVG(rating) AS overall_avg_rating
    FROM bookreviews
)
SELECT 
    cr.customer_id,
    cr.customer_name,
    cr.avg_customer_rating,
    cr.genres_purchased
FROM CustomerRatings cr
CROSS JOIN OverallAverage oa
WHERE cr.genres_purchased >= 2
  AND cr.avg_customer_rating > oa.overall_avg_rating
ORDER BY cr.avg_customer_rating DESC;

-- Q74. Find the top 3 genres that generated the highest total revenue from customers who have purchased more than 1 genre.

WITH multi_genre_customers AS (
    SELECT c.customer_id
    FROM bookcustomers c
    INNER JOIN bookorders o ON c.customer_id = o.customer_id
    INNER JOIN books b ON o.book_id = b.book_id
    GROUP BY c.customer_id
    HAVING COUNT(DISTINCT b.genre) > 1
),
genre_revenue AS (
    SELECT b.genre,
           SUM(b.price * o.quantity) AS total_revenue
    FROM bookorders o
    INNER JOIN books b ON o.book_id = b.book_id
    INNER JOIN multi_genre_customers mg ON mg.customer_id = o.customer_id
    GROUP BY b.genre
)
SELECT genre, total_revenue
FROM genre_revenue
ORDER BY total_revenue DESC
LIMIT 3;











