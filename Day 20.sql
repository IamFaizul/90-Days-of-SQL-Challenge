use 90daysofsql;

-- Q47. Find the top 3 departments with the highest total salary paid per present/remote working 
-- day between January and June 2024.

WITH total_salary AS
(
           SELECT     d.department_id,
                      d.department_name,
                      Sum(salary_amount) AS total_salary
           FROM       departments d
           INNER JOIN employees e
           ON         d.department_id = e.department_id
           INNER JOIN salaries s
           ON         e.employee_id = s.employee_id
           WHERE      Month(s.salary_month) BETWEEN 1 AND        6
           AND        Year(s.salary_month) = 2024
           GROUP BY   d.department_id,
                      d.department_name ), working_days AS
(
           SELECT     d.department_id,
                      Count(*) AS total_working_days
           FROM       departments d
           INNER JOIN employees e
           ON         d.department_id = e.department_id
           INNER JOIN attendance a
           ON         e.employee_id = a.employee_id
           WHERE      (
                                 a.status = 'Present'
                      OR         a.status = 'Remote')
           AND        Month(a.attendance_date) BETWEEN 1 AND        6
           AND        Year(a.attendance_date) = 2024
           GROUP BY   d.department_id )
SELECT   ts.department_id,
         ts.department_name,
         Round(ts.total_salary / wd.total_working_days, 2) AS salary_per_working_day
FROM     total_salary ts
JOIN     working_days wd
ON       ts.department_id = wd.department_id
ORDER BY salary_per_working_day DESC limit 3;