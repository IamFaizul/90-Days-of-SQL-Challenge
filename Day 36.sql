use 90daysofsql;

-- Q75. Find the top 5 customers who spent the highest total money only on books they gave the highest rating to.

WITH CustomerMaxRating AS (
    SELECT 
        r.customer_id,
        MAX(r.rating) AS max_rating_given
    FROM bookreviews r
    GROUP BY r.customer_id
),
SpendingOnMaxRatedBooks AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        cmr.max_rating_given,
        SUM(b.price * o.quantity) AS total_spent_on_max_rated_books
    FROM bookcustomers c
    INNER JOIN CustomerMaxRating cmr
        ON c.customer_id = cmr.customer_id
    INNER JOIN bookreviews r
        ON r.customer_id = c.customer_id
       AND r.rating = cmr.max_rating_given
    INNER JOIN books b
        ON r.book_id = b.book_id
    INNER JOIN bookorders o
        ON o.customer_id = c.customer_id
       AND o.book_id = b.book_id
    GROUP BY c.customer_id, c.customer_name, cmr.max_rating_given
)
SELECT *
FROM SpendingOnMaxRatedBooks
ORDER BY total_spent_on_max_rated_books DESC
LIMIT 5;

-- Q76. Find the top 3 genres where customers have spent the most total money, but only considering books that have an average rating of at least 4.

WITH BookAvgRating AS (
    SELECT 
        b.book_id,
        b.genre,
        AVG(r.rating) AS avg_rating
    FROM books b
    INNER JOIN bookreviews r 
        ON b.book_id = r.book_id
    GROUP BY b.book_id, b.genre
    HAVING AVG(r.rating) >= 4
),
GenreSpending AS (
    SELECT 
        bar.genre,
        SUM(b.price * o.quantity) AS total_spent
    FROM BookAvgRating bar
    INNER JOIN books b 
        ON bar.book_id = b.book_id
    INNER JOIN bookorders o 
        ON b.book_id = o.book_id
    GROUP BY bar.genre
)
SELECT *
FROM GenreSpending
ORDER BY total_spent DESC
LIMIT 3;

