use 90daysofsql;

-- Q8. For each city, calculate the average order value per order (total order value per order_id).
-- Return city and average_order_value, rounded to 2 decimal places.

select city, round(sum(price * quantity)/count(*),2) as avergae_order_value from products p inner join sales s
on p.product_id = s.product_id inner join customers c on s.customer_id = c.customer_id
group by city;

-- Q9. Which city generated the highest total revenue across all orders?

select city, sum(price * quantity) as revenue from products p inner join sales s 
on p.product_id = s.product_id inner join customers c on c.customer_id = s.customer_id 
group by city order by revenue desc limit 1;

-- Q10. Which customer has purchased the widest variety of products?
-- Show: customer_id, customer_name, unique_products_purchased

select c.customer_id , c.customer_name, count(distinct(product_id)) as unique_products_purchased
from customers c inner join sales s on c.customer_id = s.customer_id 
group by c.customer_id
order by unique_products_purchased desc limit 1;