use 90daysofsql;

-- Q45. Find the department(s) with the highest number of total working days (i.e., days marked either as "Present" or "Remote") by their employees between
--  January and June 2024.

SELECT d.department_id,
       d.department_name,
       Count(*) AS total_working_days
FROM   departments d
       INNER JOIN employees e
               ON d.department_id = e.department_id
       INNER JOIN attendance a
               ON e.employee_id = a.employee_id
WHERE  ( status = "present"
          OR status = "remote" )
       AND Month(attendance_date) BETWEEN 1 AND 6
       AND Year(attendance_date) = 2024
GROUP  BY d.department_id,
          d.department_name
ORDER  BY total_working_days DESC
LIMIT  3;


-- Q46. Which employees had perfect attendance (i.e., no "Absent" days) in the first half of 2024?
-- Return their employee_id, employee_name, and the total number of attendance records during that period

SELECT e.employee_id,
       e.employee_name,
       ( Count(CASE
                 WHEN status = "present"
                       OR status = "remote" THEN 1
               END) / Count(*) ) * 100 AS attendance_status
FROM   employees e
       INNER JOIN attendance a
               ON e.employee_id = a.employee_id
WHERE  Month(attendance_date) BETWEEN 1 AND 6
       AND Year(attendance_date) = 2024
GROUP  BY e.employee_id,
          e.employee_name
HAVING attendance_status = 100; 









