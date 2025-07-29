use 90daysofsql;

-- Q68. Find the customers who have bought books from all the genres available in the store.

SELECT c.customer_id,
       c.customer_name,
       Count(DISTINCT genre) AS total_genre_purchased
FROM   bookcustomers c
       INNER JOIN bookorders o
               ON c.customer_id = o.customer_id
       INNER JOIN books b
               ON o.book_id = b.book_id
GROUP  BY c.customer_id,
          c.customer_name
HAVING Count(DISTINCT genre) = (SELECT Count(DISTINCT genre)
                                FROM   books) ;
                                
-- Q69. Find the customers who have spent more than the average spending of all customers, 
-- but only considering their most purchased genres.

WITH mostpurchasedgenre
     AS (SELECT c.customer_id,
                c.customer_name,
                genre,
                Sum(price * quantity)                    AS total_spent,
                Row_number()
                  OVER(
                    partition BY c.customer_id
                    ORDER BY Sum(price * quantity) DESC) AS rn
         FROM   bookcustomers c
                INNER JOIN bookorders o
                        ON c.customer_id = o.customer_id
                INNER JOIN books b
                        ON b.book_id = o.book_id
         GROUP  BY c.customer_id,
                   c.customer_name,
                   genre)
SELECT customer_id,
       customer_name,
       total_spent
FROM   mostpurchasedgenre
WHERE  rn = 1
       AND total_spent > (SELECT Avg(total_spent)
                          FROM   mostpurchasedgenre); 
                          

-- Q70. Find the top 3 books that have the highest average rating, but only consider books that have received 
-- at least 2 reviews.

WITH atleast2reviews AS
(
           SELECT     b.book_id,
                      Count(DISTINCT review_id) AS total_reviews,
                      Avg(rating)               AS average_rating
           FROM       books b
           INNER JOIN bookreviews r
           ON         b.book_id = r.book_id
           GROUP BY   b.book_id
           HAVING     Count(DISTINCT review_id) >= 2 )
SELECT   book_id,
         average_rating
FROM     atleast2reviews
ORDER BY average_rating DESC limit 3;















