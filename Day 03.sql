use 90daysofsql;

-- Q5. Find the customer who made the highest single transaction (i.e., maximum revenue from a single sale).
-- Show: customer_id, customer_name, sale_id, transaction_value and Sort by: transaction_value descending

select s.customer_id,s.sale_id, c.customer_name, s.quantity * p.price as transaction_value from sales s 
inner join products p on s.product_id = p.product_id
inner join customers c on c.customer_id = s.customer_id
order by transaction_value desc limit 1;

-- Q6. Which product generated the highest total revenue across all sales?
-- Show: product_id, product_name, total_revenue

select p.product_id, p.product_name, sum(p.price * s.quantity) as total_revenue from sales s inner join products p 
on s.product_id = p.product_id
group by p.product_id, p.product_name
order by total_revenue desc limit 1;

-- Q7. Find the top 5 customers who spent the most overall. Return customer_id and their total spending.

select c.customer_id,sum(price * quantity) as total_spent from products p inner join sales s on p.product_id = s.product_id 
inner join customers c on s.customer_id = c.customer_id 
group by c.customer_id
order by total_spent desc limit 5;