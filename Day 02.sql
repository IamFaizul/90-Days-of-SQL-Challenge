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

-- Q3. Find the top 2 cities with the highest number of distinct customers who made a purchase.
-- Show the city and the unique_customer_count.

select city, count(distinct(c.customer_id)) as unique_customer_count from customers c inner join sales s 
on c.customer_id = s.customer_id 
group by city
order by unique_customer_count desc limit 5;

-- Q4. Find the top 3 store locations (cities) that generated the highest total revenue.
-- Show: store_location, total_revenue and Order by: total_revenue descending

select store_location, sum(price * quantity) as total_revenue from products p inner join sales s
on p.product_id = s.product_id
group by store_location 
order by total_revenue desc limit 3;
