use 90daysofsql;

-- Q71. Find the top 5 customers who meet both of the following criteria:
		-- They have purchased books from only one genre.
		-- Their total spending is among the top 5 within this group of customers.

WITH onlyonegenre AS
(
           SELECT     c.customer_id,
                      c.customer_name,
                      Sum(price * quantity) AS total_spending
           FROM       bookcustomers c
           INNER JOIN bookorders o
           ON         c.customer_id = o.customer_id
           INNER JOIN books b
           ON         b.book_id = o.book_id
           GROUP BY   c.customer_id,
                      c.customer_name
           HAVING     Count(DISTINCT genre) = 1)
SELECT   *
FROM     onlyonegenre
ORDER BY total_spending DESC limit 5;

-- Q72. For each customer, find their highest-rated book (based on their own review). 
-- If a customer has reviewed multiple books with the same highest rating, pick the one they spent the most money on (price × quantity). 
-- Return the top 5 customers who gave the highest rating to their top-rated books.

WITH highestratedbooks AS
(
           SELECT     c.customer_id,
                      c.customer_name,
                      b.book_id,
                      r.rating,
                      Sum(b.price * o.quantity)                                                                               AS total_spent,
                      Row_number() OVER ( partition BY c.customer_id ORDER BY r.rating DESC, Sum(b.price * o.quantity) DESC ) AS rn
           FROM       bookcustomers c
           INNER JOIN bookorders o
           ON         c.customer_id = o.customer_id
           INNER JOIN books b
           ON         o.book_id = b.book_id
           INNER JOIN bookreviews r
           ON         r.book_id = b.book_id
           AND        r.customer_id = c.customer_id
           GROUP BY   c.customer_id,
                      c.customer_name,
                      b.book_id,
                      r.rating )
SELECT   customer_id,
         customer_name,
         book_id,
         rating AS maximum_rating,
         total_spent
FROM     highestratedbooks
WHERE    rn = 1
ORDER BY maximum_rating DESC limit 5;
















