use 90daysofsql;
-- Q38. Which department had the highest average number of absent days per employee in the first half of 2024?

SELECT d.department_id,
       d.department_name,
       Count(CASE
               WHEN status = "absent" THEN 1
             end) / Count(DISTINCT e.employee_id) AS average_absent_days
FROM   departments d
       INNER JOIN employees e
               ON d.department_id = e.department_id
       INNER JOIN attendance a
               ON a.employee_id = e.employee_id
GROUP  BY d.department_id,
          d.department_name
ORDER  BY average_absent_days DESC
LIMIT  1;

-- Q39. Identify the top 3 employees who received the highest number of promotions between January and June 2024.

SELECT e.employee_id,
       Count(*) AS number_of_promotions
FROM   employees e
       INNER JOIN promotions p
               ON e.employee_id = p.employee_id
WHERE  Month(promotion_date) BETWEEN 1 AND 6
       AND Year(promotion_date) = 2024
GROUP  BY e.employee_id
ORDER  BY number_of_promotions DESC
LIMIT  3;











