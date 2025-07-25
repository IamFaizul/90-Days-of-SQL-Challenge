use 90daysofsql;

-- Q59. Identify the top 2 departments with the highest total revenue generated from male patients only.
-- Also, show the total number of male patients treated in each of those departments.

select h.department_id, h.department_name, sum(b.total_amount) as total_revenue_generated,
count(distinct p.patient_id) as male_patients
from hdepartments h inner join doctors d 
on h.department_id = d.department_id
inner join appointments a on d.doctor_id = a.doctor_id
inner join patients p on a.patient_id = p.patient_id
inner join treatments t on a.appointment_id = t.appointment_id
inner join billing b on t.treatment_id = b.treatment_id
where gender = "Male"
group by h.department_id, h.department_name
order by total_revenue_generated desc limit 2;


-- Q60. For each department, calculate the average treatment cost per patient.
-- Only consider patients who have received at least 2 treatments.
-- Show the department name, total number of such patients, and their average treatment cost.

WITH patient_costs AS (
    SELECT 
        h.department_id,
        h.department_name,
        p.patient_id,
        SUM(b.total_amount) AS total_patient_cost,
        COUNT(t.treatment_id) AS treatment_count
    FROM hdepartments h
    JOIN doctors d ON h.department_id = d.department_id
    JOIN appointments a ON d.doctor_id = a.doctor_id
    JOIN patients p ON a.patient_id = p.patient_id
    JOIN treatments t ON a.appointment_id = t.appointment_id
    JOIN billing b ON t.treatment_id = b.treatment_id
    GROUP BY h.department_id, h.department_name, p.patient_id
    HAVING COUNT(t.treatment_id) >= 2
)

SELECT 
    department_name,
    COUNT(patient_id) AS num_patients_with_2_or_more_treatments,
    ROUND(AVG(total_patient_cost), 2) AS avg_treatment_cost_per_patient
FROM patient_costs
GROUP BY department_name;











