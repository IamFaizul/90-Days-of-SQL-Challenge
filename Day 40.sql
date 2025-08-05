use 90daysofsql;

-- Q82. Find the top 5 customers who spent the most money on their single highest-rated book.

WITH highest_rated_book
     AS (SELECT c.customer_id,
                c.customer_name,
                Sum(price * quantity)     AS total_spent,
                b.book_id,
                rating,
                Dense_rank()
                  OVER(
                    partition BY c.customer_id
                    ORDER BY rating DESC) AS rn
         FROM   bookcustomers c
                INNER JOIN bookorders o
                        ON c.customer_id = o.customer_id
                INNER JOIN books b
                        ON o.book_id = b.book_id
                INNER JOIN bookreviews r
                        ON c.customer_id = r.customer_id
                           AND b.book_id = r.book_id
         GROUP  BY c.customer_id,
                   c.customer_name,
                   b.book_id,
                   rating)
SELECT customer_id,
       customer_name
FROM   highest_rated_book
WHERE  rn = 1
ORDER  BY total_spent DESC; 