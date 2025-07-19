use 90daysofsql;

-- Q52. Identify employees who were promoted but had an average performance rating below 3.

WITH promoted_employees
     AS (SELECT e.employee_id,
                e.employee_name,
                Count(p.promotion_id) AS total_promotions,
                Avg(pr.rating)        AS average_rating
         FROM   employees e
                INNER JOIN promotions p
                        ON e.employee_id = p.employee_id
                INNER JOIN performance_reviews pr
                        ON e.employee_id = pr.employee_id
         GROUP  BY e.employee_id,
                   e.employee_name)
SELECT employee_id,
       employee_name,
       total_promotions,
       Round(average_rating, 2) AS average_rating
FROM   promoted_employees
WHERE  average_rating < 3
ORDER  BY average_rating ASC; 


-- Q53. Find the top 3 departments with the highest average rating across all performance reviews, 
-- but only include those departments that have at least 5 different employees reviewed. 

SELECT d.department_id,
       d.department_name,
       Round(Avg(rating), 2)         AS average_rating,
       Count(DISTINCT e.employee_id) AS number_of_employees_reviewed
FROM   departments d
       INNER JOIN employees e
               ON d.department_id = e.department_id
       INNER JOIN performance_reviews pr
               ON e.employee_id = pr.employee_id
GROUP  BY d.department_id,
          d.department_name
HAVING Count(DISTINCT e.employee_id) >= 5
ORDER  BY average_rating DESC
LIMIT  3; 










