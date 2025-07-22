use 90daysofsql;

-- Q57. Q56. Find the top 3 departments with the highest average billing amount per treatment in fully paid cases. 
-- Include the department name and average billing amount.

select 
  h.department_id, 
  h.department_name,  
  round(avg(b.total_amount), 2) as average_amount_per_treatment
from hdepartments h 
inner join doctors d on h.department_id = d.department_id
inner join appointments a on d.doctor_id = a.doctor_id
inner join treatments t on a.appointment_id = t.appointment_id 
inner join billing b on t.treatment_id = b.treatment_id
where b.payment_status = 'Paid'
group by h.department_id, h.department_name
order by average_amount_per_treatment desc 
limit 3;

