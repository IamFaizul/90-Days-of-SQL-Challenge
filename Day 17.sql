use 90daysofsql;

-- Q40. Find the top 3 departments with the highest total number of “Present” attendance records during 
-- the first half of 2024.

SELECT d.department_id,
       d.department_name,
       Count(CASE
               WHEN status = "present" THEN 1
             end) AS Total_Present_Days
FROM   departments d
       INNER JOIN employees e
               ON d.department_id = e.department_id
       INNER JOIN attendance a
               ON e.employee_id = a.employee_id
WHERE  Year(attendance_date) = 2024
       AND Month(attendance_date) BETWEEN 1 AND 6
GROUP  BY d.department_id,
          d.department_name
ORDER  BY total_present_days DESC
LIMIT  3; 

-- Q41. Find the top 3 employees with the highest average performance rating from January to June 2024.
-- Only include employees who have received at least 3 reviews during this period.

SELECT e.employee_id,
       Round(Avg(rating), 1) AS average_rating
FROM   employees e
       INNER JOIN performance_reviews p
               ON e.employee_id = p.employee_id
WHERE  Month(review_date) BETWEEN 1 AND 6
       AND Year(review_date) = 2024
GROUP  BY e.employee_id
HAVING Count(*) >= 3
ORDER  BY average_rating DESC
LIMIT  3; 

-- Q42. Find the departments where more than 50% of employees received at least 
-- one promotion between January and June 2024.

SELECT d.department_id,
       d.department_name,
       Round(Count(DISTINCT CASE
                              WHEN p.promotion_id IS NOT NULL THEN e.employee_id
                            END) * 100.0 / Count(DISTINCT e.employee_id), 2) AS
       promotion_percentage
FROM   departments d
       INNER JOIN employees e
               ON d.department_id = e.department_id
       LEFT JOIN promotions p
              ON p.employee_id = e.employee_id
                 AND Month(promotion_date) BETWEEN 1 AND 6
                 AND Year(promotion_date) = 2024
GROUP  BY d.department_id,
          d.department_name
HAVING promotion_percentage > 50; 









