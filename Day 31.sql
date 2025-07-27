use 90daysofsql;

-- Q64. Find all customers who have purchased books from at least 3 different genres and have spent 
-- more than 200 BDT in total.

with threedifgen as (

select c.customer_id, c.customer_name, count(distinct genre) as genres_bought,sum(price * quantity) as 
total_paid_amount from bookcustomers c inner join bookorders o 
on c.customer_id = o.customer_id
inner join books b 
on o.book_id = b.book_id
group by c.customer_id, c.customer_name

)

select * 
from threedifgen
where genres_bought >=3 and total_paid_amount > 200;


-- Q65. Find the top 3 customers who spent the most money only on the genre they purchased the most.


WITH mostmoney AS
(
           SELECT     c.customer_id,
                      c.customer_name,
                      b.genre                                                                        AS most_purchased_genre,
                      Sum(o.quantity)                                                                AS total_quantity,
                      Sum(b.price * o.quantity)                                                      AS total_spent,
                      Row_number() OVER ( partition BY c.customer_id ORDER BY Sum(o.quantity) DESC ) AS rn
           FROM       bookcustomers c
           INNER JOIN bookorders o
           ON         c.customer_id = o.customer_id
           INNER JOIN books b
           ON         o.book_id = b.book_id
           GROUP BY   c.customer_id,
                      c.customer_name,
                      b.genre )
SELECT   customer_id,
         customer_name,
         most_purchased_genre,
         total_quantity,
         total_spent
FROM     mostmoney
WHERE    rn = 1
ORDER BY total_spent DESC limit 3;












