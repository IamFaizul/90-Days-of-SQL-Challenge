use 90daysofsql;
-- SQL script to create a large hospital dataset with 6 tables

-- 1. Departments Table
CREATE TABLE Hdepartments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- 2. Doctors Table
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 3. Patients Table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    gender VARCHAR(10),
    date_of_birth DATE,
    contact_number VARCHAR(15)
);

-- 4. Appointments Table
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- 5. Treatments Table
CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY,
    appointment_id INT,
    treatment_description TEXT,
    medicine_prescribed VARCHAR(255),
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- 6. Billing Table
CREATE TABLE billing (
    bill_id INT PRIMARY KEY,
    treatment_id INT,
    billing_date DATE,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id)
);

-- Sample Insert Scripts (To be expanded for large dataset)
-- Insert Departments
INSERT INTO Hdepartments VALUES
(1, 'Cardiology'), (2, 'Neurology'), (3, 'Pediatrics'), (4, 'Orthopedics'), (5, 'Oncology');

-- Insert Doctors
INSERT INTO doctors VALUES
(1, 'Dr. Alice Smith', 'Cardiologist', 1),
(2, 'Dr. Bob Johnson', 'Neurologist', 2),
(3, 'Dr. Carol Lee', 'Pediatrician', 3),
(4, 'Dr. David Brown', 'Orthopedic Surgeon', 4),
(5, 'Dr. Eva Davis', 'Oncologist', 5);

-- Insert Patients (10 shown, can be extended to 200+)
INSERT INTO patients VALUES
(1, 'John Doe', 'Male', '1985-06-15', '01710000001'),
(2, 'Jane Roe', 'Female', '1992-08-22', '01710000002'),
(3, 'Mike Lee', 'Male', '2001-12-01', '01710000003'),
(4, 'Emily Chen', 'Female', '1978-04-10', '01710000004'),
(5, 'Tom Ford', 'Male', '1990-03-30', '01710000005'),
(6, 'Lisa Ray', 'Female', '1982-10-05', '01710000006'),
(7, 'Robert Paul', 'Male', '1999-11-11', '01710000007'),
(8, 'Laura Stone', 'Female', '1965-01-25', '01710000008'),
(9, 'Jake Hill', 'Male', '2004-07-17', '01710000009'),
(10, 'Nina Cook', 'Female', '1995-09-19', '01710000010');

-- Insert Appointments (10 shown, can be extended to 500+)
INSERT INTO appointments VALUES
(1, 1, 1, '2024-06-01', 'Completed'),
(2, 2, 2, '2024-06-03', 'Completed'),
(3, 3, 3, '2024-06-05', 'Cancelled'),
(4, 4, 4, '2024-06-07', 'Completed'),
(5, 5, 5, '2024-06-09', 'Pending'),
(6, 6, 1, '2024-06-11', 'Completed'),
(7, 7, 2, '2024-06-13', 'Completed'),
(8, 8, 3, '2024-06-15', 'No-show'),
(9, 9, 4, '2024-06-17', 'Completed'),
(10, 10, 5, '2024-06-19', 'Completed');

-- Insert Treatments
INSERT INTO treatments VALUES
(1, 1, 'Blood Pressure Control', 'Amlodipine', 100.00),
(2, 2, 'Migraine Management', 'Sumatriptan', 150.00),
(3, 4, 'Knee Check-up', 'Ibuprofen', 120.00),
(4, 6, 'Cardiac Stress Test', 'None', 200.00),
(5, 7, 'Seizure Assessment', 'Valproate', 180.00),
(6, 9, 'Bone Fracture Follow-up', 'Calcium Supplements', 130.00),
(7, 10, 'Chemotherapy Consultation', 'Doxorubicin', 250.00);

-- Insert Billing
INSERT INTO billing VALUES
(1, 1, '2024-06-02', 100.00, 'Paid'),
(2, 2, '2024-06-04', 150.00, 'Paid'),
(3, 3, '2024-06-08', 120.00, 'Unpaid'),
(4, 4, '2024-06-12', 200.00, 'Paid'),
(5, 5, '2024-06-14', 180.00, 'Pending'),
(6, 6, '2024-06-18', 130.00, 'Paid'),
(7, 7, '2024-06-20', 250.00, 'Paid');

-- Q54. Find the top 5 doctors who have treated the highest number of unique patients in the last 6 months. 
-- Show doctor_id, doctor_name, and the count of distinct patients treated.

SELECT 
    d.doctor_id, 
    d.doctor_name,
    COUNT(DISTINCT a.patient_id) AS patient_treated
FROM 
    doctors d
    INNER JOIN appointments a ON d.doctor_id = a.doctor_id
    INNER JOIN treatments t ON a.appointment_id = t.appointment_id
WHERE 
    a.status = 'Completed'
GROUP BY 
    d.doctor_id, d.doctor_name
ORDER BY 
    patient_treated DESC
LIMIT 5;





















