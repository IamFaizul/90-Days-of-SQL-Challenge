use 90daysofsql;

-- Q78. Find the top 3 customers who have spent the highest total amount on books with a rating below 3,
-- but only for the genre they purchased the most.

WITH most_purchased_genre AS
(
           SELECT     c.customer_id,
                      c.customer_name,
                      b.genre,
                      Sum(quantity)                                                             AS total_orders,
                      Row_number() OVER(partition BY c.customer_id ORDER BY Sum(quantity) DESC) AS rn
           FROM       bookcustomers c
           INNER JOIN bookorders o
           ON         c.customer_id = o.customer_id
           INNER JOIN books b
           ON         b.book_id = o.book_id
           GROUP BY   c.customer_id,
                      c.customer_name,
                      b.genre) , low_rated_spending AS
(
           SELECT     mpg.customer_id,
                      mpg.customer_name,
                      mpg.genre             AS highest_purchased_genre,
                      Sum(price * quantity) AS total_spent
           FROM       most_purchased_genre mpg
           INNER JOIN bookorders o
           ON         mpg.customer_id = o.customer_id
           INNER JOIN books b
           ON         o.book_id = b.book_id
           INNER JOIN bookreviews r
           ON         b.book_id = r.book_id
           AND        mpg.customer_id = r.customer_id
           WHERE      rn = 1
           AND        b.genre = mpg.genre
           AND        r.rating < 3
           GROUP BY   mpg.customer_id,
                      mpg.customer_name,
                      mpg.genre)
SELECT   *
FROM     low_rated_spending
ORDER BY total_spent DESC limit 3;
