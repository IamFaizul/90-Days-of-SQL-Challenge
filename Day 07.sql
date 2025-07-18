use 90daysofsql;

-- Q15. Find the top 3 product categories that generated the highest total revenue.

select p.category, sum(ot.quantity * ot.price_per_unit) as total_revenue from product_catalog p inner join order_items ot
on p.product_id = ot.product_id inner join orders o on
ot.order_id = o.order_id
group by p.category
order by total_revenue desc limit 3;  