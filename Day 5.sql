use 90daysofsql;

-- Q11. Find the total number of unique customers who bought each product.
-- Show: product_id, product_name, unique_customers

select p.product_id, p.product_name, count(distinct(customer_id)) as unique_customers from products p 
inner join sales s on p.product_id = s.product_id
group by p.product_id
order by unique_customers desc;


-- Q12. For each city, find the product that generated the highest total revenue. Return only the top product per city.

with revenue_per_city as (

select product_name,p.product_id,store_location,sum(price * quantity) as total_revenue_per_city,
row_number() over(partition by store_location order by sum(price * quantity) desc) as rn
 from products p inner join sales s 
on p.product_id = s.product_id  
group by store_location,p.product_id
)

select product_name,product_id,store_location,total_revenue_per_city from revenue_per_city where rn = 1
order by total_revenue_per_city desc;
