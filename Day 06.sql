-- Day 6 to 10 tables

 CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50),
    gender VARCHAR(10),
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE product_catalog (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(12,2),
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price_per_unit DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product_catalog(product_id)
);


INSERT INTO users (user_id, user_name, gender, city, signup_date) VALUES
(1, 'Danielle', 'Male', 'Dhaka', '2024-01-05'),
(2, 'Judith', 'Female', 'Chattogram', '2024-02-17'),
(3, 'Jeffrey', 'Male', 'Chattogram', '2024-05-23'),
(4, 'Curtis', 'Male', 'Barishal', '2024-05-23'),
(5, 'Patricia', 'Male', 'Barishal', '2024-01-17'),
(6, 'Brittany', 'Female', 'Dhaka', '2024-01-07'),
(7, 'Anthony', 'Male', 'Dhaka', '2024-02-12'),
(8, 'Jesse', 'Male', 'Chattogram', '2024-04-26'),
(9, 'Anthony', 'Male', 'Barishal', '2024-02-08'),
(10, 'Jennifer', 'Male', 'Barishal', '2024-05-16'),
(11, 'Amy', 'Female', 'Chattogram', '2024-02-12'),
(12, 'Shane', 'Female', 'Barishal', '2024-02-24'),
(13, 'Lisa', 'Female', 'Dhaka', '2024-01-02'),
(14, 'Katherine', 'Male', 'Khulna', '2024-02-01'),
(15, 'Helen', 'Female', 'Sylhet', '2024-03-07'),
(16, 'Joshua', 'Male', 'Chattogram', '2024-02-11'),
(17, 'Susan', 'Female', 'Dhaka', '2024-03-06'),
(18, 'Curtis', 'Male', 'Khulna', '2024-03-14'),
(19, 'Colin', 'Male', 'Sylhet', '2024-03-07'),
(20, 'Cassandra', 'Female', 'Barishal', '2024-01-09');

INSERT INTO product_catalog (product_id, product_name, category, price) VALUES
(1, 'Smartphone', 'Electronics', 25000),
(2, 'T-shirt', 'Clothing', 700),
(3, 'Laptop', 'Electronics', 85000),
(4, 'Novel', 'Books', 450),
(5, 'Backpack', 'Accessories', 1200),
(6, 'Shoes', 'Footwear', 2500),
(7, 'Bluetooth Speaker', 'Electronics', 3200),
(8, 'Jeans', 'Clothing', 1500),
(9, 'Notebook Set', 'Stationery', 300),
(10, 'Watch', 'Accessories', 5000);

INSERT INTO orders (order_id, user_id, order_date, total_amount, status) VALUES
(101, 9, '2024-06-05', 2100.0, 'Pending'),
(102, 15, '2024-05-23', 8100.0, 'Completed'),
(103, 13, '2024-05-27', 3600.0, 'Completed'),
(104, 10, '2024-05-07', 2300.0, 'Pending'),
(105, 20, '2024-06-14', 92500.0, 'Pending'),
(106, 12, '2024-05-19', 10000.0, 'Completed'),
(107, 3, '2024-05-04', 56400.0, 'Completed'),
(108, 8, '2024-05-27', 2100.0, 'Pending'),
(109, 3, '2024-05-15', 262700.0, 'Pending'),
(110, 4, '2024-06-10', 11850.0, 'Completed'),
(111, 15, '2024-05-31', 13200.0, 'Completed'),
(112, 12, '2024-05-31', 6800.0, 'Completed'),
(113, 12, '2024-06-12', 2500.0, 'Completed'),
(114, 9, '2024-06-11', 5450.0, 'Pending'),
(115, 3, '2024-05-18', 450.0, 'Completed'),
(116, 6, '2024-05-29', 2500.0, 'Completed'),
(117, 8, '2024-05-10', 5700.0, 'Completed'),
(118, 13, '2024-06-04', 8000.0, 'Completed'),
(119, 18, '2024-05-04', 7900.0, 'Completed'),
(120, 11, '2024-05-03', 81850.0, 'Pending'),
(121, 2, '2024-06-02', 1200.0, 'Completed'),
(122, 2, '2024-05-12', 92600.0, 'Pending'),
(123, 13, '2024-06-07', 300.0, 'Completed'),
(124, 7, '2024-05-15', 450.0, 'Cancelled'),
(125, 19, '2024-05-04', 14850.0, 'Pending'),
(126, 11, '2024-06-11', 6400.0, 'Completed'),
(127, 16, '2024-05-12', 9800.0, 'Completed'),
(128, 15, '2024-06-12', 2500.0, 'Completed'),
(129, 5, '2024-05-05', 10000.0, 'Completed'),
(130, 18, '2024-05-19', 25300.0, 'Completed'),
(131, 19, '2024-05-14', 5000.0, 'Completed'),
(132, 19, '2024-05-23', 10300.0, 'Completed'),
(133, 8, '2024-05-31', 5000.0, 'Cancelled'),
(134, 5, '2024-06-10', 183400.0, 'Completed'),
(135, 3, '2024-05-18', 10800.0, 'Pending'),
(136, 4, '2024-05-08', 8600.0, 'Completed'),
(137, 6, '2024-05-18', 2100.0, 'Pending'),
(138, 14, '2024-05-18', 2700.0, 'Completed'),
(139, 13, '2024-05-11', 900.0, 'Completed'),
(140, 15, '2024-06-02', 263100.0, 'Completed');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price_per_unit) VALUES
(1001, 101, 2, 3, 700),
(1002, 102, 6, 2, 2500),
(1003, 102, 2, 1, 700),
(1004, 102, 5, 2, 1200),
(1005, 103, 5, 3, 1200),
(1006, 104, 9, 3, 300),
(1007, 104, 2, 2, 700),
(1008, 105, 3, 1, 85000),
(1009, 105, 6, 3, 2500),
(1010, 106, 10, 2, 5000),
(1011, 107, 1, 2, 25000),
(1012, 107, 2, 1, 700),
(1013, 107, 6, 1, 2500),
(1014, 107, 7, 1, 3200),
(1015, 108, 2, 3, 700),
(1016, 109, 2, 3, 700),
(1017, 109, 9, 2, 300),
(1018, 109, 3, 3, 85000),
(1019, 109, 10, 1, 5000),
(1020, 110, 9, 3, 300),
(1021, 110, 7, 3, 3200),
(1022, 110, 4, 3, 450),
(1023, 111, 5, 3, 1200),
(1024, 111, 7, 3, 3200),
(1025, 112, 8, 1, 1500),
(1026, 112, 9, 1, 300),
(1027, 112, 10, 1, 5000),
(1028, 113, 6, 1, 2500),
(1029, 114, 10, 1, 5000),
(1030, 114, 4, 1, 450),
(1031, 115, 4, 1, 450),
(1032, 116, 6, 1, 2500),
(1033, 117, 5, 1, 1200),
(1034, 117, 8, 3, 1500),
(1035, 118, 10, 1, 5000),
(1036, 118, 8, 2, 1500),
(1037, 119, 4, 2, 450),
(1038, 119, 2, 2, 700),
(1039, 119, 9, 2, 300),
(1040, 119, 6, 2, 2500),
(1041, 120, 1, 3, 25000),
(1042, 120, 2, 2, 700),
(1043, 120, 10, 1, 5000),
(1044, 120, 4, 1, 450),
(1045, 121, 4, 2, 450),
(1046, 121, 9, 1, 300),
(1047, 122, 3, 1, 85000),
(1048, 122, 5, 2, 1200),
(1049, 122, 8, 3, 1500),
(1050, 122, 2, 1, 700),
(1051, 123, 9, 1, 300),
(1052, 124, 4, 1, 450),
(1053, 125, 8, 2, 1500),
(1054, 125, 10, 1, 5000),
(1055, 125, 4, 1, 450),
(1056, 125, 7, 2, 3200),
(1057, 126, 7, 2, 3200),
(1058, 127, 5, 1, 1200),
(1059, 127, 7, 2, 3200),
(1060, 127, 8, 1, 1500),
(1061, 127, 2, 1, 700),
(1062, 128, 6, 1, 2500),
(1063, 129, 10, 2, 5000),
(1064, 130, 1, 1, 25000),
(1065, 130, 9, 1, 300),
(1066, 131, 10, 1, 5000),
(1067, 132, 7, 3, 3200),
(1068, 132, 2, 1, 700),
(1069, 133, 10, 1, 5000),
(1070, 134, 10, 1, 5000),
(1071, 134, 9, 3, 300),
(1072, 134, 6, 3, 2500),
(1073, 134, 3, 2, 85000),
(1074, 135, 5, 1, 1200),
(1075, 135, 7, 3, 3200),
(1076, 136, 8, 1, 1500),
(1077, 136, 6, 2, 2500),
(1078, 136, 2, 3, 700),
(1079, 137, 2, 3, 700),
(1080, 138, 9, 1, 300),
(1081, 138, 5, 2, 1200),
(1082, 139, 4, 2, 450),
(1083, 140, 3, 3, 85000),
(1084, 140, 8, 3, 1500),
(1085, 140, 5, 3, 1200);


-- Day 6

-- Q13. Which 3 cities generated the highest total order revenue?

select city, sum(total_amount) as total_order_revenue from orders o inner join users u
on o.user_id = u.user_id 
group by city order by total_order_revenue desc limit 3;

-- Q14. List the top 3 users who placed the highest number of orders.

select o.user_id,user_name, count(o.user_id) as number_of_orders from orders o inner join users u 
on o.user_id = u.user_id
where status = "Completed"
group by o.user_id
order by number_of_orders desc limit 3;