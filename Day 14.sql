use 90daysofsql;

-- Q33. Which department had the highest average performance review rating in June 2024?

select d.department_id, d.department_name, avg(rating) as average_rating from departments d inner join employees e 
on d.department_id = e.department_id inner join 
performance_reviews p on e.employee_id = p.employee_id
where year(review_date) = 2024 and month(review_date) = 6
group by d.department_id, d.department_name
order by average_rating desc limit 1
;