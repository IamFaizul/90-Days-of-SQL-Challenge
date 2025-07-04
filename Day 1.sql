-- Stores all customers
create database 90DaysOfSQL;
use 90DaysOfSQL;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE,
    store_location VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO customers (customer_id, customer_name, city, signup_date) VALUES
(1, 'Alice Smith', 'Dhaka', '2023-01-05'),
(2, 'Bob Rahman', 'Chattogram', '2023-02-15'),
(3, 'Charlie Khan', 'Sylhet', '2023-03-10'),
(4, 'Dana Haque', 'Khulna', '2023-01-20'),
(5, 'Evan Islam', 'Dhaka', '2023-03-12'),
(6, 'Farah Ahmed', 'Chattogram', '2023-02-28'),
(7, 'George Karim', 'Sylhet', '2023-01-18'),
(8, 'Hira Zaman', 'Khulna', '2023-03-01'),
(9, 'Ibrahim Hossain', 'Dhaka', '2023-02-22'),
(10, 'Jannat Chowdhury', 'Chattogram', '2023-03-05'),
(11, 'Kamal Uddin', 'Sylhet', '2023-01-30'),
(12, 'Lubna Yasmin', 'Khulna', '2023-02-02'),
(13, 'Mahmud Alam', 'Dhaka', '2023-01-10'),
(14, 'Nadia Sultana', 'Chattogram', '2023-02-17'),
(15, 'Omar Sheikh', 'Sylhet', '2023-01-25'),
(16, 'Parveen Akter', 'Khulna', '2023-02-20'),
(17, 'Qazi Hasan', 'Dhaka', '2023-03-02'),
(18, 'Rafiq Islam', 'Chattogram', '2023-03-08'),
(19, 'Shirin Hossain', 'Sylhet', '2023-02-14'),
(20, 'Tanvir Kabir', 'Khulna', '2023-01-28');

INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Shampoo', 'Personal Care', 3.50),
(102, 'Toothpaste', 'Personal Care', 2.00),
(103, 'Body Wash', 'Personal Care', 4.00),
(104, 'Rice 5kg', 'Grocery', 8.00),
(105, 'Flour 2kg', 'Grocery', 3.25),
(106, 'Cooking Oil 1L', 'Grocery', 5.50),
(107, 'Salt 1kg', 'Grocery', 1.00),
(108, 'Tissue Box', 'Household', 1.25),
(109, 'Detergent 1kg', 'Household', 2.50),
(110, 'Mop', 'Household', 6.00),
(111, 'Biscuits Pack', 'Snacks', 1.75),
(112, 'Chips', 'Snacks', 1.50),
(113, 'Soft Drink 1L', 'Beverages', 1.75),
(114, 'Tea Pack', 'Beverages', 2.25),
(115, 'Coffee Jar', 'Beverages', 4.50);

INSERT INTO sales (sale_id, customer_id, product_id, quantity, sale_date, store_location) VALUES
(1001, 13, 112, 3, '2023-03-22', 'Dhaka'),
(1002, 15, 110, 5, '2023-03-03', 'Dhaka'),
(1003, 4, 111, 4, '2023-04-03', 'Dhaka'),
(1004, 5, 109, 1, '2023-04-07', 'Dhaka'),
(1005, 14, 112, 3, '2023-03-15', 'Dhaka'),
(1006, 11, 102, 3, '2023-03-17', 'Dhaka'),
(1007, 20, 115, 1, '2023-04-14', 'Dhaka'),
(1008, 11, 112, 2, '2023-03-01', 'Dhaka'),
(1009, 5, 104, 3, '2023-04-11', 'Dhaka'),
(1010, 17, 102, 2, '2023-03-11', 'Dhaka'),
(1011, 16, 113, 1, '2023-04-13', 'Dhaka'),
(1012, 2, 114, 1, '2023-03-01', 'Dhaka'),
(1013, 17, 109, 5, '2023-03-26', 'Dhaka'),
(1014, 4, 107, 3, '2023-03-03', 'Dhaka'),
(1015, 7, 113, 5, '2023-03-22', 'Dhaka'),
(1016, 9, 114, 2, '2023-03-01', 'Dhaka'),
(1017, 13, 103, 1, '2023-04-24', 'Dhaka'),
(1018, 15, 103, 5, '2023-04-04', 'Dhaka'),
(1019, 13, 112, 4, '2023-03-24', 'Dhaka'),
(1020, 10, 108, 1, '2023-03-24', 'Dhaka'),
(1021, 4, 114, 4, '2023-03-08', 'Dhaka'),
(1022, 2, 115, 3, '2023-04-20', 'Dhaka'),
(1023, 17, 103, 2, '2023-04-06', 'Dhaka'),
(1024, 1, 112, 1, '2023-04-16', 'Dhaka'),
(1025, 10, 102, 4, '2023-03-04', 'Dhaka'),
(1026, 7, 109, 3, '2023-04-08', 'Dhaka'),
(1027, 4, 109, 1, '2023-04-06', 'Dhaka'),
(1028, 3, 101, 2, '2023-04-24', 'Dhaka'),
(1029, 13, 103, 1, '2023-04-28', 'Dhaka'),
(1030, 4, 113, 3, '2023-04-08', 'Dhaka'),
(1031, 11, 101, 2, '2023-03-25', 'Dhaka'),
(1032, 6, 113, 5, '2023-03-20', 'Dhaka'),
(1033, 3, 101, 4, '2023-03-21', 'Dhaka'),
(1034, 1, 106, 3, '2023-03-20', 'Dhaka'),
(1035, 3, 110, 5, '2023-04-06', 'Dhaka'),
(1036, 10, 109, 5, '2023-03-04', 'Dhaka'),
(1037, 17, 114, 5, '2023-03-06', 'Dhaka'),
(1038, 15, 109, 3, '2023-04-24', 'Dhaka'),
(1039, 17, 113, 1, '2023-03-08', 'Dhaka'),
(1040, 15, 111, 1, '2023-04-24', 'Dhaka'),

-- Chattogram: 25 sales
(1041, 7, 111, 5, '2023-03-21', 'Chattogram'),
(1042, 2, 105, 2, '2023-03-27', 'Chattogram'),
(1043, 15, 101, 3, '2023-03-16', 'Chattogram'),
(1044, 2, 106, 1, '2023-04-17', 'Chattogram'),
(1045, 3, 113, 5, '2023-03-04', 'Chattogram'),
(1046, 11, 109, 1, '2023-03-13', 'Chattogram'),
(1047, 13, 109, 4, '2023-04-06', 'Chattogram'),
(1048, 2, 101, 2, '2023-04-04', 'Chattogram'),
(1049, 4, 101, 1, '2023-03-28', 'Chattogram'),
(1050, 12, 108, 5, '2023-04-02', 'Chattogram'),
(1051, 19, 107, 2, '2023-03-27', 'Chattogram'),
(1052, 7, 114, 3, '2023-03-03', 'Chattogram'),
(1053, 7, 105, 4, '2023-04-03', 'Chattogram'),
(1054, 18, 112, 3, '2023-04-04', 'Chattogram'),
(1055, 1, 111, 3, '2023-03-28', 'Chattogram'),
(1056, 3, 112, 2, '2023-04-06', 'Chattogram'),
(1057, 2, 115, 3, '2023-04-04', 'Chattogram'),
(1058, 14, 105, 3, '2023-03-11', 'Chattogram'),
(1059, 19, 101, 5, '2023-04-28', 'Chattogram'),
(1060, 10, 105, 3, '2023-03-15', 'Chattogram'),
(1061, 8, 102, 4, '2023-03-19', 'Chattogram'),
(1062, 11, 115, 1, '2023-04-18', 'Chattogram'),
(1063, 8, 110, 1, '2023-03-21', 'Chattogram'),
(1064, 1, 111, 5, '2023-04-26', 'Chattogram'),
(1065, 19, 112, 5, '2023-03-18', 'Chattogram'),

-- Sylhet: 20 sales
(1066, 3, 101, 2, '2023-03-17', 'Sylhet'),
(1067, 18, 105, 2, '2023-03-03', 'Sylhet'),
(1068, 10, 103, 2, '2023-04-08', 'Sylhet'),
(1069, 10, 115, 1, '2023-03-07', 'Sylhet'),
(1070, 7, 114, 2, '2023-03-08', 'Sylhet'),
(1071, 2, 113, 2, '2023-04-23', 'Sylhet'),
(1072, 14, 110, 3, '2023-03-04', 'Sylhet'),
(1073, 7, 102, 4, '2023-03-30', 'Sylhet'),
(1074, 12, 115, 3, '2023-04-04', 'Sylhet'),
(1075, 6, 114, 2, '2023-03-03', 'Sylhet'),
(1076, 20, 112, 1, '2023-04-04', 'Sylhet'),
(1077, 5, 103, 2, '2023-04-07', 'Sylhet'),
(1078, 6, 109, 5, '2023-04-06', 'Sylhet'),
(1079, 19, 114, 2, '2023-04-14', 'Sylhet'),
(1080, 20, 101, 2, '2023-03-24', 'Sylhet'),
(1081, 8, 113, 1, '2023-04-17', 'Sylhet'),
(1082, 6, 104, 3, '2023-04-09', 'Sylhet'),
(1083, 12, 109, 1, '2023-04-11', 'Sylhet'),
(1084, 16, 108, 3, '2023-04-06', 'Sylhet'),
(1085, 14, 110, 2, '2023-04-11', 'Sylhet'),

-- Khulna: 15 sales
(1086, 6, 101, 2, '2023-04-14', 'Khulna'),
(1087, 9, 105, 5, '2023-03-13', 'Khulna'),
(1088, 11, 110, 1, '2023-03-03', 'Khulna'),
(1089, 19, 104, 2, '2023-04-14', 'Khulna'),
(1090, 3, 106, 1, '2023-03-03', 'Khulna'),
(1091, 14, 113, 3, '2023-04-23', 'Khulna'),
(1092, 20, 110, 1, '2023-04-04', 'Khulna'),
(1093, 6, 105, 3, '2023-03-04', 'Khulna'),
(1094, 15, 102, 4, '2023-03-06', 'Khulna'),
(1095, 20, 107, 3, '2023-04-08', 'Khulna'),
(1096, 12, 114, 4, '2023-04-04', 'Khulna'),
(1097, 8, 110, 5, '2023-03-11', 'Khulna'),
(1098, 5, 101, 3, '2023-04-16', 'Khulna'),
(1099, 14, 109, 3, '2023-03-26', 'Khulna'),
(1100, 8, 115, 4, '2023-04-28', 'Khulna');


-- Day 1

-- Q1. Find the top 3 customers who spent the most money in total, across all purchases. 
-- Show the customer_id, customer_name, and total_spent, ordered by total_spent in descending order.

select c.customer_id,customer_name, sum(s.quantity * p.price) as total_spent from customers c inner join sales s
on c.customer_id = s.customer_id
inner join products p
on s.product_id = p.product_id
group by c.customer_id, c.customer_name
order by total_spent desc limit 3;

-- Alternative Query 

with spendings as (
select c.customer_id,c.customer_name, sum(p.price * s.quantity) as total_spent from customers c
inner join sales s on c.customer_id = s.customer_id 
inner join products p on s.product_id = p.product_id
group by c.customer_id, c.customer_name
order by total_spent desc limit 3
)
select customer_id, customer_name,total_spent from spendings
order by total_spent desc limit 3;
