use 90daysofsql;

-- Q77. Find the top 3 customers who have spent the most money on their lowest-rated purchased book.

WITH customer_lowest_books AS
(
           SELECT     c.customer_id,
                      c.customer_name,
                      b.book_id,
                      r.rating,
                      Sum(o.quantity * b.price)                                                                           AS total_spent,
                      Row_number() OVER(partition BY c.customer_id ORDER BY r.rating ASC, Sum(o.quantity * b.price) DESC) AS rn
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
         total_spent
FROM     customer_lowest_books
WHERE    rn = 1
ORDER BY total_spent DESC limit 3;


