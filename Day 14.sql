use 90daysofsql;

-- Q33. Which department had the highest average performance review rating in June 2024?

select d.department_id, d.department_name, avg(rating) as average_rating from departments d inner join employees e 
on d.department_id = e.department_id inner join 
performance_reviews p on e.employee_id = p.employee_id
where year(review_date) = 2024 and month(review_date) = 6
group by d.department_id, d.department_name
order by average_rating desc limit 1
;

-- Q34. Which 3 employees had the highest number of absent days in the first half of 2024 (January to June)?

select e.employee_id, count(*) as total_absent_days from employees e inner join attendance a 
on e.employee_id = a.employee_id
where year(attendance_date) = 2024
and month(attendance_date) between 1 and 6
and status = "Absent" 
group by e.employee_id
order by total_absent_days desc limit 3;










