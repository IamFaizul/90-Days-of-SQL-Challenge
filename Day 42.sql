use 90daysofsql;
-- 1. Customers Table
CREATE TABLE onlinecustomers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100)
);

INSERT INTO onlinecustomers (customer_id, customer_name, email, city) VALUES
(1, 'Fahim Hossain', 'fahim.hossain@example.com', 'Dhaka'),
(2, 'Sadia Rahman', 'sadia.rahman@example.com', 'Chittagong'),
(3, 'Tanvir Ahmed', 'tanvir.ahmed@example.com', 'Sylhet'),
(4, 'Jannat Jahan', 'jannat.jahan@example.com', 'Khulna'),
(5, 'Rakib Hasan', 'rakib.hasan@example.com', 'Rajshahi'),
(6, 'Nusrat Jahan', 'nusrat.jahan@example.com', 'Barisal'),
(7, 'Mamun Mia', 'mamun.mia@example.com', 'Comilla'),
(8, 'Ruma Akter', 'ruma.akter@example.com', 'Rangpur'),
(9, 'Shakib Al Hasan', 'shakib.al@example.com', 'Narayanganj'),
(10, 'Sabina Yasmin', 'sabina.yasmin@example.com', 'Mymensingh'),
(11, 'Raihan Kabir', 'raihan.kabir@example.com', 'Gazipur'),
(12, 'Maliha Akter', 'maliha.akter@example.com', 'Tangail'),
(13, 'Asif Chowdhury', 'asif.chowdhury@example.com', 'Dhaka'),
(14, 'Tanjim Alam', 'tanjim.alam@example.com', 'Sylhet'),
(15, 'Sumaiya Haque', 'sumaiya.haque@example.com', 'Khulna'),
(16, 'Arif Mahmud', 'arif.mahmud@example.com', 'Comilla'),
(17, 'Lamia Sultana', 'lamia.sultana@example.com', 'Rajshahi'),
(18, 'Faruk Ahmed', 'faruk.ahmed@example.com', 'Dhaka'),
(19, 'Shila Khan', 'shila.khan@example.com', 'Barisal'),
(20, 'Nasir Uddin', 'nasir.uddin@example.com', 'Mymensingh'),
(21, 'Tumpa Das', 'tumpa.das@example.com', 'Chittagong'),
(22, 'Hasan Mahmud', 'hasan.mahmud@example.com', 'Narayanganj'),
(23, 'Ayesha Siddika', 'ayesha.siddika@example.com', 'Gazipur'),
(24, 'Habib Rahman', 'habib.rahman@example.com', 'Sylhet'),
(25, 'Rokeya Begum', 'rokeya.begum@example.com', 'Rangpur'),
(26, 'Emran Hossain', 'emran.hossain@example.com', 'Khulna'),
(27, 'Faria Haque', 'faria.haque@example.com', 'Tangail'),
(28, 'Mehedi Hasan', 'mehedi.hasan@example.com', 'Barisal'),
(29, 'Tasnim Rahman', 'tasnim.rahman@example.com', 'Dhaka'),
(30, 'Kawsar Ali', 'kawsar.ali@example.com', 'Rajshahi'),
(31, 'Nadia Ferdous', 'nadia.ferdous@example.com', 'Comilla'),
(32, 'Jahidul Islam', 'jahidul.islam@example.com', 'Chittagong'),
(33, 'Munmun Akter', 'munmun.akter@example.com', 'Sylhet'),
(34, 'Omar Faruk', 'omar.faruk@example.com', 'Mymensingh'),
(35, 'Rashedul Islam', 'rashedul.islam@example.com', 'Rangpur'),
(36, 'Rafiq Mia', 'rafiq.mia@example.com', 'Gazipur'),
(37, 'Salma Khatun', 'salma.khatun@example.com', 'Dhaka'),
(38, 'Mohsin Ahmed', 'mohsin.ahmed@example.com', 'Tangail'),
(39, 'Tariq Hossain', 'tariq.hossain@example.com', 'Barisal'),
(40, 'Papia Rahman', 'papia.rahman@example.com', 'Narayanganj'),
(41, 'Faysal Kabir', 'faysal.kabir@example.com', 'Rajshahi'),
(42, 'Mou Sultana', 'mou.sultana@example.com', 'Khulna'),
(43, 'Shuvo Roy', 'shuvo.roy@example.com', 'Comilla'),
(44, 'Sadia Anjum', 'sadia.anjum@example.com', 'Sylhet'),
(45, 'Rumi Jahan', 'rumi.jahan@example.com', 'Rangpur'),
(46, 'Rezaul Karim', 'rezaul.karim@example.com', 'Dhaka'),
(47, 'Tamanna Islam', 'tamanna.islam@example.com', 'Mymensingh'),
(48, 'Shamim Reza', 'shamim.reza@example.com', 'Gazipur'),
(49, 'Fardin Khan', 'fardin.khan@example.com', 'Tangail'),
(50, 'Rukhsar Rahman', 'rukhsar.rahman@example.com', 'Khulna');


-- 2. Restaurants Table
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(100)
);

INSERT INTO restaurants (restaurant_id, restaurant_name, city) VALUES
(1, 'Spice Hub', 'Dhaka'),
(2, 'Taste Town', 'Chittagong'),
(3, 'Curry Corner', 'Sylhet'),
(4, 'Flavor Palace', 'Khulna'),
(5, 'Grill House', 'Rajshahi'),
(6, 'Tandoori Treats', 'Barisal'),
(7, 'Sizzler Shack', 'Comilla'),
(8, 'The Food Spot', 'Rangpur'),
(9, 'Yummy Delight', 'Narayanganj'),
(10, 'Biryani Bliss', 'Mymensingh'),
(11, 'Cafe Zest', 'Gazipur'),
(12, 'Foodie’s Paradise', 'Tangail'),
(13, 'Hot & Spicy', 'Dhaka'),
(14, 'Flavor Junction', 'Sylhet'),
(15, 'Taste Street', 'Chittagong'),
(16, 'The Grill Hub', 'Khulna'),
(17, 'Spice Villa', 'Rajshahi'),
(18, 'Food Fiesta', 'Barisal'),
(19, 'Chilli’s Place', 'Comilla'),
(20, 'Delicious Bites', 'Rangpur'),
(21, 'Momo Magic', 'Narayanganj'),
(22, 'The Saucy Spoon', 'Mymensingh'),
(23, 'Biryani House', 'Gazipur'),
(24, 'Food Haven', 'Tangail'),
(25, 'Curry House', 'Dhaka'),
(26, 'Grill & Chill', 'Sylhet'),
(27, 'Masala Mania', 'Chittagong'),
(28, 'Flavor Feast', 'Khulna'),
(29, 'Savor Spot', 'Rajshahi'),
(30, 'Taste Express', 'Barisal'),
(31, 'Food Hub', 'Comilla'),
(32, 'Grill Master', 'Rangpur'),
(33, 'Delight Kitchen', 'Narayanganj'),
(34, 'Yummy Hub', 'Mymensingh'),
(35, 'Sizzle Stop', 'Gazipur'),
(36, 'Tasty Treats', 'Tangail'),
(37, 'Biryani Express', 'Dhaka'),
(38, 'Chow Time', 'Sylhet'),
(39, 'Food Junction', 'Chittagong'),
(40, 'Grill Express', 'Khulna'),
(41, 'Spice Delight', 'Rajshahi'),
(42, 'Taste Bowl', 'Barisal'),
(43, 'Momo House', 'Comilla'),
(44, 'Flavors & More', 'Rangpur'),
(45, 'Yummy Bites', 'Narayanganj'),
(46, 'Food Fiesta', 'Mymensingh'),
(47, 'Grill Delight', 'Gazipur'),
(48, 'Curry Express', 'Tangail'),
(49, 'Taste Hub', 'Dhaka'),
(50, 'Food Corner', 'Khulna');

-- 3. Menu Items Table
CREATE TABLE menu_items (
    menu_item_id INT PRIMARY KEY,
    restaurant_id INT,
    item_name VARCHAR(100),
    price DECIMAL(6,2),
    category VARCHAR(50),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

INSERT INTO menu_items (menu_item_id, restaurant_id, item_name, price, category) VALUES
(1, 1, 'Chicken Biryani', 150.00, 'Main Course'),
(2, 1, 'Beef Kabab', 200.00, 'Appetizer'),
(3, 1, 'Vegetable Curry', 100.00, 'Main Course'),
(4, 2, 'Fish Fry', 180.00, 'Appetizer'),
(5, 2, 'Mutton Korma', 250.00, 'Main Course'),
(6, 2, 'Dal Fry', 90.00, 'Main Course'),
(7, 3, 'Egg Curry', 120.00, 'Main Course'),
(8, 3, 'Chicken Tikka', 210.00, 'Appetizer'),
(9, 3, 'Roti', 20.00, 'Bread'),
(10, 4, 'Beef Stew', 220.00, 'Main Course'),
(11, 4, 'Prawn Curry', 300.00, 'Main Course'),
(12, 4, 'Mixed Salad', 80.00, 'Salad'),
(13, 5, 'Grilled Chicken', 230.00, 'Main Course'),
(14, 5, 'Vegetable Salad', 90.00, 'Salad'),
(15, 5, 'Garlic Naan', 25.00, 'Bread'),
(16, 6, 'Lamb Chops', 270.00, 'Main Course'),
(17, 6, 'Paneer Butter Masala', 150.00, 'Main Course'),
(18, 6, 'Fruit Salad', 70.00, 'Salad'),
(19, 7, 'Chicken Shawarma', 180.00, 'Main Course'),
(20, 7, 'French Fries', 60.00, 'Side Dish'),
(21, 7, 'Chocolate Cake', 120.00, 'Dessert'),
(22, 8, 'Mutton Biryani', 250.00, 'Main Course'),
(23, 8, 'Beef Steak', 280.00, 'Main Course'),
(24, 8, 'Caesar Salad', 100.00, 'Salad'),
(25, 9, 'Fish Curry', 190.00, 'Main Course'),
(26, 9, 'Chicken Nuggets', 150.00, 'Appetizer'),
(27, 9, 'Ice Cream', 90.00, 'Dessert'),
(28, 10, 'Vegetable Fried Rice', 130.00, 'Main Course'),
(29, 10, 'Beef Burger', 180.00, 'Main Course'),
(30, 10, 'Mango Lassi', 50.00, 'Beverages'),
(31, 11, 'Paneer Tikka', 160.00, 'Appetizer'),
(32, 11, 'Chicken Curry', 220.00, 'Main Course'),
(33, 11, 'Veg Spring Roll', 90.00, 'Appetizer'),
(34, 12, 'Beef Kebab', 210.00, 'Appetizer'),
(35, 12, 'Fish Fry', 170.00, 'Appetizer'),
(36, 12, 'Mixed Veg Curry', 110.00, 'Main Course'),
(37, 13, 'Chicken Biryani', 150.00, 'Main Course'),
(38, 13, 'Mutton Curry', 270.00, 'Main Course'),
(39, 13, 'Cucumber Salad', 70.00, 'Salad'),
(40, 14, 'Vegetable Soup', 60.00, 'Appetizer'),
(41, 14, 'Beef Steak', 280.00, 'Main Course'),
(42, 14, 'Pasta Alfredo', 190.00, 'Main Course'),
(43, 15, 'Chicken Wings', 160.00, 'Appetizer'),
(44, 15, 'Fish Curry', 200.00, 'Main Course'),
(45, 15, 'Chocolate Mousse', 130.00, 'Dessert'),
(46, 16, 'Veggie Pizza', 180.00, 'Main Course'),
(47, 16, 'Lamb Kebab', 240.00, 'Main Course'),
(48, 16, 'Fruit Juice', 70.00, 'Beverages'),
(49, 17, 'Chicken Shawarma', 180.00, 'Main Course'),
(50, 17, 'French Fries', 60.00, 'Side Dish');


-- 4. Orders Table
CREATE TABLE onlineorders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES onlinecustomers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

INSERT INTO onlineorders (order_id, customer_id, restaurant_id, order_date) VALUES
(1, 1, 1, '2025-01-01'),
(2, 2, 1, '2025-01-02'),
(3, 3, 2, '2025-01-03'),
(4, 4, 2, '2025-01-04'),
(5, 5, 3, '2025-01-05'),
(6, 6, 3, '2025-01-06'),
(7, 7, 4, '2025-01-07'),
(8, 8, 4, '2025-01-08'),
(9, 9, 5, '2025-01-09'),
(10, 10, 5, '2025-01-10'),
(11, 11, 6, '2025-01-11'),
(12, 12, 6, '2025-01-12'),
(13, 13, 7, '2025-01-13'),
(14, 14, 7, '2025-01-14'),
(15, 15, 8, '2025-01-15'),
(16, 16, 8, '2025-01-16'),
(17, 17, 9, '2025-01-17'),
(18, 18, 9, '2025-01-18'),
(19, 19, 10, '2025-01-19'),
(20, 20, 10, '2025-01-20'),
(21, 21, 11, '2025-01-21'),
(22, 22, 11, '2025-01-22'),
(23, 23, 12, '2025-01-23'),
(24, 24, 12, '2025-01-24'),
(25, 25, 13, '2025-01-25'),
(26, 26, 13, '2025-01-26'),
(27, 27, 14, '2025-01-27'),
(28, 28, 14, '2025-01-28'),
(29, 29, 15, '2025-01-29'),
(30, 30, 15, '2025-01-30'),
(31, 31, 16, '2025-01-31'),
(32, 32, 16, '2025-02-01'),
(33, 33, 17, '2025-02-02'),
(34, 34, 17, '2025-02-03'),
(35, 35, 18, '2025-02-04'),
(36, 36, 18, '2025-02-05'),
(37, 37, 19, '2025-02-06'),
(38, 38, 19, '2025-02-07'),
(39, 39, 20, '2025-02-08'),
(40, 40, 20, '2025-02-09'),
(41, 41, 21, '2025-02-10'),
(42, 42, 21, '2025-02-11'),
(43, 43, 22, '2025-02-12'),
(44, 44, 22, '2025-02-13'),
(45, 45, 23, '2025-02-14'),
(46, 46, 23, '2025-02-15'),
(47, 47, 24, '2025-02-16'),
(48, 48, 24, '2025-02-17'),
(49, 49, 25, '2025-02-18'),
(50, 50, 25, '2025-02-19');

-- Create Payments Table

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    payment_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES onlineorders(order_id)
);

-- Insert 50 payments records
INSERT INTO payments (payment_id, order_id, payment_method, payment_status, payment_date, amount) VALUES
(1, 1, 'Credit Card', 'Completed', '2024-07-01', 450.00),
(2, 2, 'Cash', 'Completed', '2024-07-01', 270.00),
(3, 3, 'Mobile Payment', 'Completed', '2024-07-02', 320.00),
(4, 4, 'Credit Card', 'Pending', '2024-07-02', 390.00),
(5, 5, 'Cash', 'Completed', '2024-07-03', 150.00),
(6, 6, 'Credit Card', 'Completed', '2024-07-03', 780.00),
(7, 7, 'Mobile Payment', 'Failed', '2024-07-04', 210.00),
(8, 8, 'Cash', 'Completed', '2024-07-04', 500.00),
(9, 9, 'Credit Card', 'Completed', '2024-07-05', 640.00),
(10, 10, 'Mobile Payment', 'Completed', '2024-07-05', 330.00),
(11, 11, 'Cash', 'Completed', '2024-07-06', 220.00),
(12, 12, 'Credit Card', 'Completed', '2024-07-06', 460.00),
(13, 13, 'Mobile Payment', 'Pending', '2024-07-07', 120.00),
(14, 14, 'Cash', 'Completed', '2024-07-07', 590.00),
(15, 15, 'Credit Card', 'Completed', '2024-07-08', 400.00),
(16, 16, 'Mobile Payment', 'Completed', '2024-07-08', 280.00),
(17, 17, 'Cash', 'Failed', '2024-07-09', 190.00),
(18, 18, 'Credit Card', 'Completed', '2024-07-09', 700.00),
(19, 19, 'Mobile Payment', 'Completed', '2024-07-10', 430.00),
(20, 20, 'Cash', 'Completed', '2024-07-10', 350.00),
(21, 21, 'Credit Card', 'Completed', '2024-07-11', 480.00),
(22, 22, 'Mobile Payment', 'Pending', '2024-07-11', 300.00),
(23, 23, 'Cash', 'Completed', '2024-07-12', 260.00),
(24, 24, 'Credit Card', 'Completed', '2024-07-12', 530.00),
(25, 25, 'Mobile Payment', 'Completed', '2024-07-13', 150.00),
(26, 26, 'Cash', 'Completed', '2024-07-13', 410.00),
(27, 27, 'Credit Card', 'Completed', '2024-07-14', 380.00),
(28, 28, 'Mobile Payment', 'Failed', '2024-07-14', 290.00),
(29, 29, 'Cash', 'Completed', '2024-07-15', 540.00),
(30, 30, 'Credit Card', 'Completed', '2024-07-15', 600.00),
(31, 31, 'Mobile Payment', 'Completed', '2024-07-16', 210.00),
(32, 32, 'Cash', 'Pending', '2024-07-16', 320.00),
(33, 33, 'Credit Card', 'Completed', '2024-07-17', 470.00),
(34, 34, 'Mobile Payment', 'Completed', '2024-07-17', 340.00),
(35, 35, 'Cash', 'Completed', '2024-07-18', 390.00),
(36, 36, 'Credit Card', 'Completed', '2024-07-18', 560.00),
(37, 37, 'Mobile Payment', 'Failed', '2024-07-19', 230.00),
(38, 38, 'Cash', 'Completed', '2024-07-19', 270.00),
(39, 39, 'Credit Card', 'Completed', '2024-07-20', 410.00),
(40, 40, 'Mobile Payment', 'Completed', '2024-07-20', 350.00),
(41, 41, 'Cash', 'Completed', '2024-07-21', 220.00),
(42, 42, 'Credit Card', 'Completed', '2024-07-21', 480.00),
(43, 43, 'Mobile Payment', 'Pending', '2024-07-22', 300.00),
(44, 44, 'Cash', 'Completed', '2024-07-22', 520.00),
(45, 45, 'Credit Card', 'Completed', '2024-07-23', 600.00),
(46, 46, 'Mobile Payment', 'Completed', '2024-07-23', 430.00),
(47, 47, 'Cash', 'Completed', '2024-07-24', 370.00),
(48, 48, 'Credit Card', 'Failed', '2024-07-24', 290.00),
(49, 49, 'Mobile Payment', 'Completed', '2024-07-25', 510.00),
(50, 50, 'Cash', 'Completed', '2024-07-25', 450.00);


-- Q85. Find the top 5 customers who have spent the most money on orders from restaurants located in the city 'Dhaka'.

WITH dhakaiarestaurants AS
(
           SELECT     c.customer_id,
                      c.customer_name,
                      Sum(amount) AS total_spent
           FROM       onlinecustomers c
           INNER JOIN onlineorders o
           ON         c.customer_id = o.customer_id
           INNER JOIN restaurants r
           ON         r.restaurant_id = o.restaurant_id
           INNER JOIN payments p
           ON         o.order_id = p.order_id
           WHERE      r.city = 'Dhaka'
           GROUP BY   c.customer_id,
                      c.customer_name)
SELECT   customer_id,
         customer_name,
         total_spent
FROM     dhakaiarestaurants
ORDER BY total_spent DESC limit 5;























