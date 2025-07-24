use 90daysofsql;

-- Q58. Find the department with the highest average revenue per patient, where only paid treatments are considered.

SELECT 
    h.department_id,
    h.department_name,
    ROUND(SUM(b.total_amount) / COUNT(DISTINCT a.patient_id), 2) AS avg_revenue_per_patient
FROM 
    hdepartments h
INNER JOIN doctors d ON h.department_id = d.department_id
INNER JOIN appointments a ON d.doctor_id = a.doctor_id
INNER JOIN treatments t ON a.appointment_id = t.appointment_id
INNER JOIN billing b ON t.treatment_id = b.treatment_id
WHERE 
    b.payment_status = 'Paid'
GROUP BY 
    h.department_id, h.department_name
ORDER BY 
    avg_revenue_per_patient DESC
LIMIT 1;
