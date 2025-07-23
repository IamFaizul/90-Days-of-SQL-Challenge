use 90daysofsql;

-- Q57. Identify the top 3 hospital departments that have the highest patient retention rate.
WITH patient_treatment_counts
     AS (SELECT h.department_id,
                h.department_name,
                a.patient_id,
                Count(DISTINCT t.treatment_id) AS paid_treatment_count
         FROM   hdepartments h
                INNER JOIN doctors d
                        ON h.department_id = d.department_id
                INNER JOIN appointments a
                        ON d.doctor_id = a.doctor_id
                INNER JOIN treatments t
                        ON a.appointment_id = t.appointment_id
                INNER JOIN billing b
                        ON t.treatment_id = b.treatment_id
         WHERE  b.payment_status = 'Paid'
         GROUP  BY h.department_id,
                   h.department_name,
                   a.patient_id),
     department_retention
     AS (SELECT department_id,
                department_name,
                Count(*)   AS total_patients,
                Count(CASE
                        WHEN paid_treatment_count > 1 THEN 1
                      END) AS retained_patients
         FROM   patient_treatment_counts
         GROUP  BY department_id,
                   department_name)
SELECT department_id,
       department_name,
       total_patients,
       retained_patients,
       Round(( retained_patients * 100.0 ) / total_patients, 2) AS
       retention_rate_percentage
FROM   department_retention
ORDER  BY retention_rate_percentage DESC; 