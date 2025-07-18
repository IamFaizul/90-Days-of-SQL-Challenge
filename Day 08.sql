use 90daysofsql;

-- Q16. Find users who placed orders only for products in a single category.

select o.user_id, count(distinct(category)) as total_categories from product_catalog p inner join order_items ot
on p.product_id = ot.product_id inner join orders o on ot.order_id = o.order_id
group by o.user_id
having total_categories = 1;

-- Q17. Find the product(s) that have never been ordered.

select p.product_id from product_catalog p 
where not exists
(select ot.product_id from order_items ot WHERE ot.product_id = p.product_id);

-- Q18. Find the top 2 cities where the average order value (i.e., average total_amount per order) is the highest.

select city, round(sum(ot.quantity * ot.price_per_unit)/ count(ot.order_id),2) as average_total_amount_per_order
from order_items ot inner join orders o on ot.order_id = o.order_id
inner join users u on o.user_id = u.user_id
group by u.city order by average_total_amount_per_order desc limit 2;











