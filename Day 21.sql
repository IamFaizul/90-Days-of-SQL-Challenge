use 90daysofsql;

-- Q48. Find the top 3 employees who have received the highest total salary only for the days they were marked 
-- 'Present' between January and June 2024.

SELECT e.employee_id,
       e.employee_name,
       Sum(salary_amount) AS total_salary
FROM   employees e
       INNER JOIN salaries s
               ON e.employee_id = s.employee_id
       INNER JOIN attendance a
               ON s.employee_id = a.employee_id
WHERE  status = "present"
       AND Year(attendance_date) = 2024
       AND Month(attendance_date) BETWEEN 1 AND 6
GROUP  BY e.employee_id,
          e.employee_name
ORDER  BY total_salary DESC
LIMIT  3; 

-- Q49. Find the departments where every employee had perfect attendance 
-- (i.e., both attendance records in July 2024 are either 'Present' or 'Remote').

SELECT d.department_id,
       d.department_name,
       Count(DISTINCT CASE
                        WHEN status = "present"
                              OR status = "remote" THEN 1
                      END) / Count(*) AS attendance_percentage
FROM   departments d
       INNER JOIN employees e
               ON d.department_id = e.department_id
       INNER JOIN attendance a
               ON e.employee_id = a.employee_id
GROUP  BY d.department_id,
          d.department_name
HAVING attendance_percentage = 1; 











