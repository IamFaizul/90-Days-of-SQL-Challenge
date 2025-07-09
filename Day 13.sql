use 90daysofsql;


-- 1. DEPARTMENTS TABLE
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Engineering'), (2, 'HR'), (3, 'Finance'), (4, 'Marketing'), (5, 'Sales'),
(6, 'Support'), (7, 'R&D'), (8, 'Product'), (9, 'Legal');

-- 2. EMPLOYEES TABLE
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    gender VARCHAR(20),
    department_id INT,
    job_title VARCHAR(50),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees (employee_id, employee_name, gender, department_id, job_title, hire_date) VALUES
(101, 'Arefin Rahman', 'Male', 1, 'Software Engineer', '2021-06-12'),
(102, 'Nasima Akter', 'Female', 2, 'HR Manager', '2020-03-15'),
(103, 'Tariqul Islam', 'Male', 3, 'Accountant', '2019-11-10'),
(104, 'Shabnam Jahan', 'Female', 4, 'Marketing Exec', '2022-02-01'),
(105, 'Shahriar Hossain', 'Male', 5, 'Sales Rep', '2021-09-05'),
(106, 'Farzana Haque', 'Female', 6, 'Customer Support', '2020-07-17'),
(107, 'Omar Khaled', 'Male', 7, 'Researcher', '2018-12-20'),
(108, 'Anika Sultana', 'Female', 8, 'Product Manager', '2019-04-22'),
(109, 'Mahbub Alam', 'Male', 9, 'Legal Advisor', '2021-01-10'),
(110, 'Rehana Parveen', 'Female', 1, 'Software Engineer', '2022-03-11'),
(111, 'Jahidul Islam', 'Male', 3, 'Accountant', '2021-10-01'),
(112, 'Salma Khatun', 'Female', 5, 'Sales Rep', '2020-01-23'),
(113, 'Naim Hasan', 'Male', 6, 'Customer Support', '2019-06-30'),
(114, 'Lamia Hossain', 'Female', 2, 'HR Executive', '2023-02-14'),
(115, 'Tanvir Mahmud', 'Male', 7, 'Researcher', '2020-08-08');

-- 3. SALARIES TABLE
CREATE TABLE salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    salary_month DATE,
    salary_amount DECIMAL(10,2),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO salaries (salary_id, employee_id, salary_month, salary_amount) VALUES
(1, 101, '2024-06-01', 6800), (2, 101, '2024-05-01', 6800), (3, 101, '2024-04-01', 6800),
(4, 102, '2024-06-01', 7200), (5, 102, '2024-05-01', 7200), (6, 102, '2024-04-01', 7200),
(7, 103, '2024-06-01', 6500), (8, 104, '2024-06-01', 6100), (9, 105, '2024-06-01', 5800),
(10, 106, '2024-06-01', 5600), (11, 107, '2024-06-01', 7700), (12, 108, '2024-06-01', 8000);

-- 4. PERFORMANCE_REVIEWS TABLE
CREATE TABLE performance_reviews (
    review_id INT PRIMARY KEY,
    employee_id INT,
    review_date DATE,
    performance_score INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO performance_reviews (review_id, employee_id, review_date, performance_score) VALUES
(1, 101, '2024-06-01', 4), (2, 101, '2024-03-01', 5),
(3, 102, '2024-06-01', 3), (4, 102, '2024-03-01', 4),
(5, 103, '2024-06-01', 4), (6, 104, '2024-06-01', 5), (7, 105, '2024-06-01', 3);

-- 5. ATTENDANCE TABLE
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    employee_id INT,
    login_date DATE,
    check_in_time TIME,
    check_out_time TIME,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO attendance (attendance_id, employee_id, login_date, check_in_time, check_out_time) VALUES
(1, 101, '2024-07-01', '09:15:00', '17:20:00'),
(2, 101, '2024-07-02', '09:05:00', '17:00:00'),
(3, 102, '2024-07-01', '09:10:00', '17:30:00'),
(4, 102, '2024-07-02', '09:00:00', '17:10:00'),
(5, 103, '2024-07-01', '09:00:00', '17:00:00'),
(6, 104, '2024-07-01', '09:20:00', '17:15:00');

-- 6. PROMOTIONS TABLE
CREATE TABLE promotions (
    promotion_id INT PRIMARY KEY,
    employee_id INT,
    promotion_date DATE,
    new_job_title VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO promotions (promotion_id, employee_id, promotion_date, new_job_title) VALUES
(1, 101, '2023-09-01', 'Senior Software Engineer'),
(2, 102, '2022-06-01', 'HR Lead'),
(3, 108, '2023-01-01', 'Senior Product Manager');






















