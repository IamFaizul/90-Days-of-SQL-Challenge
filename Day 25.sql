use 90daysofsql;

-- Q55. Which treatment type generated the highest total revenue for the hospital?

SELECT t.treatment_description,
       Sum(total_amount) AS total_revenue
FROM   treatments t
       INNER JOIN billing b
               ON t.treatment_id = b.treatment_id
WHERE  payment_status = "paid"
GROUP  BY t.treatment_description
ORDER  BY total_revenue DESC
LIMIT  1; 

-- Q56. Identify the top 3 doctors who generated the highest total treatment revenue in 2024, 
-- considering only treatments where a payment has been made. 
-- Also, display the number of unique patients they treated and the number of different treatment types they performed.


SELECT d.doctor_id,
       d.doctor_name,
       Sum(b.total_amount)                     AS total_revenue_generated,
       Count(DISTINCT a.patient_id)            AS total_patient_treated,
       Count(DISTINCT t.treatment_description) AS number_of_treatments
FROM   doctors d
       INNER JOIN appointments a
               ON d.doctor_id = a.doctor_id
       INNER JOIN treatments t
               ON a.appointment_id = t.appointment_id
       INNER JOIN billing b
               ON t.treatment_id = b.treatment_id
WHERE  b.payment_status = 'Paid'
GROUP  BY d.doctor_id,
          d.doctor_name
ORDER  BY total_revenue_generated DESC
LIMIT  3; 














