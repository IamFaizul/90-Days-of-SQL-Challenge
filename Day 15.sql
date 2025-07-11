use 90daysofsql;

-- Q35. Which department had the highest promotion rate between January and June 2024?"

SELECT d.department_id,
       d.department_name,
       Round(( Count(CASE
                       WHEN Year(promotion_date) = 2024
                            AND Month(promotion_date) BETWEEN 1 AND 6 THEN 1
                     END) / Count(*) ) * 100, 2) AS promotion_rate
FROM   departments d
       INNER JOIN employees e
               ON d.department_id = e.department_id
       LEFT JOIN promotions p
              ON e.employee_id = p.employee_id
GROUP  BY d.department_id
ORDER  BY promotion_rate DESC; 




-- Q36. "Which employees had perfect attendance (i.e., no 'Absent' records) in the first half of 2024?"

SELECT e.employee_id,
       e.employee_name,
       Round(Count(CASE
                     WHEN status = 'Present' THEN 1
                   END) * 100.0 / Count(*), 2) AS attendance
FROM   employees e
       INNER JOIN attendance a
               ON e.employee_id = a.employee_id
WHERE  Year(attendance_date) = 2024
       AND Month(attendance_date) BETWEEN 1 AND 6
GROUP  BY e.employee_id,
          e.employee_name
HAVING attendance = 100; 

-- Alternative way of solving Q36

SELECT e.employee_id,
       e.employee_name,
       Round(Count(CASE
                     WHEN attendance_date BETWEEN '2024-01-01' AND '2024-06-30'
                          AND status = 'Present' THEN 1
                   END) * 100.0 / Count(CASE
                                          WHEN attendance_date BETWEEN
                                               '2024-01-01' AND '2024-06-30'
                                        THEN 1
                                        END), 2) AS attendance
FROM   employees e
       INNER JOIN attendance a
               ON e.employee_id = a.employee_id
GROUP  BY e.employee_id,
          e.employee_name
HAVING attendance = 100; 

-- Q37. Which 5 employees received the highest total salary in the first half of 2024?

select e.employee_id, e.employee_name, sum(salary_amount) as total_salary_received from employees e inner join salaries s 
on e.employee_id = s.employee_id
where month(salary_month) between 1 and 6 and year(salary_month) = 2024
group by s.employee_id
order by total_salary_received desc limit 5;














