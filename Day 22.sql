use 90daysofsql;

-- Q50. Find the top 3 employees (by name and ID) who received at least one promotion
-- and had an average performance review rating of 4.5 or higher during the same period. 
-- Return employee ID, employee name, average rating, and total number of promotions.

SELECT e.employee_id,
       e.employee_name,
       Round(Avg(rating), 2) AS average_rating,
       Count(*)              AS total_number_of_promotions
FROM   employees e
       INNER JOIN promotions p
               ON e.employee_id = p.employee_id
       INNER JOIN performance_reviews pr
               ON p.employee_id = pr.employee_id
GROUP  BY e.employee_id,
          e.employee_name
HAVING average_rating >= 4.5;


-- Q51. Find the top 3 departments with the highest number of employees who received at least one promotion and had 
-- an average performance rating of 4.0 or above.

WITH eligible_employees AS
(
           SELECT     e.employee_id,
                      e.employee_name,
                      e.department_id,
                      Avg(pr.rating)        AS average_rating,
                      Count(p.promotion_id) AS total_number_of_promotions
           FROM       employees e
           INNER JOIN promotions p
           ON         e.employee_id = p.employee_id
           INNER JOIN performance_reviews pr
           ON         p.employee_id = pr.employee_id
           GROUP BY   e.employee_id,
                      e.department_id
           HAVING     average_rating >= 4
           AND        total_number_of_promotions >= 1 )
SELECT     d.department_id,
           d.department_name,
           Count(ee.employee_id) AS eligible_employee_count
FROM       eligible_employees ee
INNER JOIN departments d
ON         ee.department_id = d.department_id
GROUP BY   d.department_id,
           d.department_name
ORDER BY   eligible_employee_count DESC limit 3;










