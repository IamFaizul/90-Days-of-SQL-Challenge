use 90daysofsql;

-- Q43.  Find the top 3 departments with the highest average salary per employee for the first half of 2024.

SELECT d.department_id,
       d.department_name,
       Avg(salary_amount) AS average_salary
FROM   departments d
       INNER JOIN employees e
               ON d.department_id = e.department_id
       INNER JOIN salaries s
               ON e.employee_id = s.employee_id
WHERE  Month(salary_month) BETWEEN 1 AND 6
       AND Year(salary_month) = 2024
GROUP  BY d.department_id,
          d.department_name
ORDER  BY average_salary DESC
LIMIT  3; 

-- Q44. Identify the employee(s) who received the highest number of promotions between January and June 2024. 
-- Return their ID, name, and number of promotions.

SELECT e.employee_id,
       e.employee_name,
       Count(p.employee_id) AS promotions_obtained
FROM   employees e
       INNER JOIN promotions p
               ON e.employee_id = p.employee_id
WHERE  Month(promotion_date) BETWEEN 1 AND 6
       AND Year(promotion_date) = 2024
GROUP  BY e.employee_id,
          e.employee_name
ORDER  BY promotions_obtained DESC
LIMIT  1; 








