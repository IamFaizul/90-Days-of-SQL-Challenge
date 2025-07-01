use 90daysofsql;

-- Q2. Find the total quantity sold and total revenue for each product category.
-- Only include categories where the total revenue is more than 20, and order the results by revenue in descending order.

select p.category, sum(quantity) as total_quantity_sold,
sum(p.price * s.quantity) as total_revenue
from products p inner join sales s
on p.product_id = s.product_id 
group by p.category
having total_revenue > 20
order by total_revenue desc; 