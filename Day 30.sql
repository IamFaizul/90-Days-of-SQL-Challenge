use 90daysofsql;
-- Customers Table
CREATE TABLE bookcustomers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    registration_date DATE
);

-- Books Table
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150),
    author VARCHAR(100),
    genre VARCHAR(50),
    price DECIMAL(6,2)
);

-- Orders Table
CREATE TABLE bookorders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES bookcustomers(customer_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Reviews Table
CREATE TABLE bookreviews (
    review_id INT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (customer_id) REFERENCES bookcustomers(customer_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);


INSERT INTO bookcustomers (customer_id, customer_name, email, registration_date) VALUES
(1, 'Faizul Kabir', 'faizul.kabir1@gmail.com', '2022-03-03'),
(2, 'Tanjina Chowdhury', 'tanjina.chowdhury2@gmail.com', '2023-07-26'),
(3, 'Amina Begum', 'amina.begum3@gmail.com', '2022-06-07'),
(4, 'Sabbir Sultana', 'sabbir.sultana4@gmail.com', '2023-04-11'),
(5, 'Mahbub Rahman', 'mahbub.rahman5@gmail.com', '2023-11-07'),
(6, 'Tanvir Akter', 'tanvir.akter6@gmail.com', '2022-12-12'),
(7, 'Tanjina Khan', 'tanjina.khan7@gmail.com', '2022-02-05'),
(8, 'Mahbub Uddin', 'mahbub.uddin8@gmail.com', '2023-11-07'),
(9, 'Nayeem Kabir', 'nayeem.kabir9@gmail.com', '2022-11-02'),
(10, 'Fahim Mollah', 'fahim.mollah10@gmail.com', '2023-04-06'),
(11, 'Afsana Rahman', 'afsana.rahman11@gmail.com', '2023-11-29'),
(12, 'Riyad Ahmed', 'riyad.ahmed12@gmail.com', '2022-09-27'),
(13, 'Rafi Uddin', 'rafi.uddin13@gmail.com', '2022-10-01'),
(14, 'Taslima Uddin', 'taslima.uddin14@gmail.com', '2022-04-15'),
(15, 'Mahbub Uddin', 'mahbub.uddin15@gmail.com', '2022-08-16'),
(16, 'Riyad Mollah', 'riyad.mollah16@gmail.com', '2022-02-14'),
(17, 'Fahim Uddin', 'fahim.uddin17@gmail.com', '2023-11-27'),
(18, 'Sumaiya Kabir', 'sumaiya.kabir18@gmail.com', '2023-03-13'),
(19, 'Faizul Ahmed', 'faizul.ahmed19@gmail.com', '2023-12-25'),
(20, 'Maliha Ahmed', 'maliha.ahmed20@gmail.com', '2022-07-01'),
(21, 'Shuvo Khan', 'shuvo.khan21@gmail.com', '2022-09-20'),
(22, 'Afsana Uddin', 'afsana.uddin22@gmail.com', '2023-05-26'),
(23, 'Riyad Chowdhury', 'riyad.chowdhury23@gmail.com', '2022-08-04'),
(24, 'Tanjina Islam', 'tanjina.islam24@gmail.com', '2022-02-15'),
(25, 'Maliha Ahmed', 'maliha.ahmed25@gmail.com', '2022-11-17'),
(26, 'Taslima Ahmed', 'taslima.ahmed26@gmail.com', '2023-09-07'),
(27, 'Rafi Akter', 'rafi.akter27@gmail.com', '2022-04-12'),
(28, 'Maliha Hossain', 'maliha.hossain28@gmail.com', '2022-05-06'),
(29, 'Maliha Chowdhury', 'maliha.chowdhury29@gmail.com', '2022-02-12'),
(30, 'Fahim Sultana', 'fahim.sultana30@gmail.com', '2022-07-26'),
(31, 'Maliha Uddin', 'maliha.uddin31@gmail.com', '2022-09-10'),
(32, 'Sumaiya Hasan', 'sumaiya.hasan32@gmail.com', '2023-10-27'),
(33, 'Riyad Islam', 'riyad.islam33@gmail.com', '2022-01-05'),
(34, 'Taslima Islam', 'taslima.islam34@gmail.com', '2022-01-26'),
(35, 'Nusrat Ahmed', 'nusrat.ahmed35@gmail.com', '2022-11-09'),
(36, 'Riyad Akter', 'riyad.akter36@gmail.com', '2023-10-16'),
(37, 'Rafi Hossain', 'rafi.hossain37@gmail.com', '2023-07-22'),
(38, 'Tanjina Sultana', 'tanjina.sultana38@gmail.com', '2022-11-04'),
(39, 'Fahim Rahman', 'fahim.rahman39@gmail.com', '2023-04-12'),
(40, 'Maliha Sarker', 'maliha.sarker40@gmail.com', '2022-05-10'),
(41, 'Tanvir Khan', 'tanvir.khan41@gmail.com', '2023-07-21'),
(42, 'Afsana Akter', 'afsana.akter42@gmail.com', '2022-05-31'),
(43, 'Shuvo Ahmed', 'shuvo.ahmed43@gmail.com', '2022-02-13'),
(44, 'Nusrat Begum', 'nusrat.begum44@gmail.com', '2022-07-28'),
(45, 'Shuvo Rahman', 'shuvo.rahman45@gmail.com', '2022-11-22'),
(46, 'Tanvir Begum', 'tanvir.begum46@gmail.com', '2022-06-23'),
(47, 'Sabbir Mollah', 'sabbir.mollah47@gmail.com', '2022-08-08'),
(48, 'Maliha Hossain', 'maliha.hossain48@gmail.com', '2023-09-29'),
(49, 'Nayeem Akter', 'nayeem.akter49@gmail.com', '2022-08-07'),
(50, 'Maliha Mollah', 'maliha.mollah50@gmail.com', '2022-01-05');

INSERT INTO books (book_id, title, author, genre, price) VALUES
(1, 'Book_1', 'Taslima Begum', 'Self-help', 20.33),
(2, 'Book_2', 'Nayeem Sarker', 'Thriller', 19.1),
(3, 'Book_3', 'Shuvo Sultana', 'Fiction', 29.91),
(4, 'Book_4', 'Rafi Mollah', 'Productivity', 13.28),
(5, 'Book_5', 'Mahbub Khan', 'Self-help', 15.79),
(6, 'Book_6', 'Sabbir Mollah', 'Technology', 17.42),
(7, 'Book_7', 'Riyad Ahmed', 'Memoir', 21.38),
(8, 'Book_8', 'Afsana Akter', 'Self-help', 13.93),
(9, 'Book_9', 'Nusrat Hasan', 'Productivity', 18.26),
(10, 'Book_10', 'Riyad Hossain', 'Spirituality', 15.15),
(11, 'Book_11', 'Tanvir Chowdhury', 'Spirituality', 23.71),
(12, 'Book_12', 'Nayeem Rahman', 'Technology', 14.7),
(13, 'Book_13', 'Afsana Islam', 'Thriller', 22.78),
(14, 'Book_14', 'Afsana Kabir', 'Self-help', 12.64),
(15, 'Book_15', 'Maliha Chowdhury', 'Self-help', 25.61),
(16, 'Book_16', 'Nayeem Uddin', 'Technology', 12.11),
(17, 'Book_17', 'Shuvo Rahman', 'Spirituality', 15.07),
(18, 'Book_18', 'Nayeem Hossain', 'Productivity', 11.16),
(19, 'Book_19', 'Fahim Sarker', 'Technology', 15.89),
(20, 'Book_20', 'Tanvir Hossain', 'Spirituality', 27.03),
(21, 'Book_21', 'Tanjina Sultana', 'Productivity', 27.79),
(22, 'Book_22', 'Nusrat Kabir', 'Memoir', 22.76),
(23, 'Book_23', 'Afsana Sarker', 'Productivity', 10.95),
(24, 'Book_24', 'Mahbub Chowdhury', 'Thriller', 18.91),
(25, 'Book_25', 'Maliha Khan', 'Thriller', 29.86),
(26, 'Book_26', 'Rafi Rahman', 'Productivity', 23.4),
(27, 'Book_27', 'Afsana Sultana', 'Thriller', 19.53),
(28, 'Book_28', 'Mahbub Islam', 'Productivity', 11.35),
(29, 'Book_29', 'Sumaiya Hasan', 'Self-help', 10.86),
(30, 'Book_30', 'Nayeem Chowdhury', 'Productivity', 11.61),
(31, 'Book_31', 'Nusrat Chowdhury', 'Thriller', 12.71),
(32, 'Book_32', 'Tanvir Mollah', 'Spirituality', 26.58),
(33, 'Book_33', 'Fahim Begum', 'Spirituality', 11.48),
(34, 'Book_34', 'Rafi Alam', 'Spirituality', 12.54),
(35, 'Book_35', 'Fahim Rahman', 'Spirituality', 10.69),
(36, 'Book_36', 'Nusrat Khan', 'Productivity', 19.44),
(37, 'Book_37', 'Mahbub Sarker', 'Productivity', 12.8),
(38, 'Book_38', 'Tanvir Khan', 'Self-help', 14.1),
(39, 'Book_39', 'Sabbir Alam', 'Self-help', 25.52),
(40, 'Book_40', 'Taslima Ahmed', 'Self-help', 15.28),
(41, 'Book_41', 'Afsana Begum', 'Self-help', 14.75),
(42, 'Book_42', 'Taslima Kabir', 'Memoir', 11.11),
(43, 'Book_43', 'Nayeem Akter', 'Self-help', 10.75),
(44, 'Book_44', 'Sumaiya Mollah', 'Spirituality', 11.91),
(45, 'Book_45', 'Taslima Sultana', 'Fiction', 23.43),
(46, 'Book_46', 'Sumaiya Khan', 'Fiction', 27.03),
(47, 'Book_47', 'Sumaiya Hossain', 'Self-help', 23.27),
(48, 'Book_48', 'Taslima Uddin', 'Thriller', 27.33),
(49, 'Book_49', 'Sumaiya Mollah', 'Thriller', 13.47),
(50, 'Book_50', 'Sumaiya Sarker', 'Productivity', 24.73);

INSERT INTO bookorders (order_id, customer_id, book_id, quantity, order_date) VALUES
(1, 47, 8, 2, '2022-10-05'),
(2, 27, 6, 5, '2023-11-10'),
(3, 12, 23, 3, '2022-02-14'),
(4, 30, 4, 3, '2022-08-01'),
(5, 37, 47, 5, '2022-10-30'),
(6, 4, 36, 1, '2022-06-24'),
(7, 33, 19, 4, '2022-01-14'),
(8, 16, 10, 1, '2022-07-24'),
(9, 8, 32, 3, '2022-12-28'),
(10, 22, 32, 3, '2023-11-26'),
(11, 18, 30, 4, '2023-07-04'),
(12, 11, 42, 4, '2023-04-23'),
(13, 7, 30, 5, '2023-10-07'),
(14, 13, 24, 3, '2022-11-08'),
(15, 37, 32, 4, '2022-04-21'),
(16, 14, 49, 4, '2023-08-29'),
(17, 7, 48, 1, '2023-06-10'),
(18, 14, 4, 5, '2023-01-07'),
(19, 20, 16, 4, '2023-06-05'),
(20, 41, 23, 3, '2023-10-04'),
(21, 50, 24, 5, '2023-05-25'),
(22, 4, 37, 4, '2023-09-23'),
(23, 5, 13, 3, '2023-05-01'),
(24, 12, 31, 5, '2022-01-08'),
(25, 31, 45, 3, '2023-09-20'),
(26, 24, 1, 1, '2022-06-08'),
(27, 15, 30, 2, '2022-10-19'),
(28, 37, 30, 2, '2023-05-07'),
(29, 42, 7, 2, '2023-03-24'),
(30, 36, 13, 4, '2022-11-13'),
(31, 18, 42, 3, '2022-04-21'),
(32, 26, 21, 2, '2023-07-18'),
(33, 12, 5, 4, '2022-05-05'),
(34, 26, 10, 5, '2023-04-07'),
(35, 5, 9, 5, '2023-02-02'),
(36, 46, 3, 2, '2023-12-17'),
(37, 49, 39, 5, '2023-07-28'),
(38, 1, 41, 4, '2023-03-23'),
(39, 21, 24, 1, '2023-03-15'),
(40, 38, 10, 1, '2022-09-27'),
(41, 45, 5, 2, '2022-11-18'),
(42, 18, 41, 4, '2022-08-29'),
(43, 12, 12, 4, '2023-02-03'),
(44, 15, 30, 2, '2022-06-23'),
(45, 50, 32, 1, '2023-01-08'),
(46, 3, 34, 1, '2023-12-29'),
(47, 10, 14, 2, '2022-08-29'),
(48, 36, 27, 4, '2022-12-04'),
(49, 44, 28, 4, '2023-07-27'),
(50, 39, 45, 2, '2023-03-27');

INSERT INTO bookreviews (review_id, customer_id, book_id, rating, review_text, review_date) VALUES
(1, 13, 29, 5, 'Average chilo, abar porbo na mone hoy.', '2023-08-07'),
(2, 25, 10, 4, 'Onno rokom ekta golpo. Darun!', '2023-08-05'),
(3, 27, 49, 1, 'Besi bhalo lagse ei boita!', '2023-06-22'),
(4, 8, 20, 2, 'Onno rokom ekta golpo. Darun!', '2022-12-19'),
(5, 46, 1, 2, 'Real life example gulo onek helpful chilo.', '2022-11-30'),
(6, 39, 27, 4, 'Khubi upokari ekta boi.', '2022-12-17'),
(7, 50, 7, 4, 'Average chilo, abar porbo na mone hoy.', '2022-05-15'),
(8, 37, 21, 3, 'Valo chilo, kintu aro details thakle valo hoto.', '2022-05-07'),
(9, 6, 31, 4, 'Boi ta amar expect er cheye valo chilo.', '2022-12-28'),
(10, 25, 3, 2, 'Boi ta amar expect er cheye valo chilo.', '2023-01-11'),
(11, 29, 2, 2, 'Pore moja paisi, onek kichu shikhlam.', '2023-11-24'),
(12, 14, 13, 2, 'Khubi upokari ekta boi.', '2023-01-08'),
(13, 13, 16, 2, 'Average chilo, abar porbo na mone hoy.', '2023-07-31'),
(14, 31, 13, 4, 'Ekdom time waste.', '2023-09-10'),
(15, 50, 38, 3, 'Real life example gulo onek helpful chilo.', '2023-12-29'),
(16, 23, 40, 2, 'Ei boita sobai ke porar suggestion dibo.', '2022-05-14'),
(17, 9, 33, 2, 'Khubi upokari ekta boi.', '2023-04-11'),
(18, 46, 27, 4, 'Real life example gulo onek helpful chilo.', '2022-03-31'),
(19, 7, 48, 1, 'Ekdom time waste.', '2023-07-21'),
(20, 35, 46, 5, 'Onno rokom ekta golpo. Darun!', '2022-10-31'),
(21, 36, 38, 2, 'Pore moja paisi, onek kichu shikhlam.', '2022-12-05'),
(22, 24, 45, 4, 'Khubi upokari ekta boi.', '2022-12-11'),
(23, 26, 41, 5, 'Ekdom time waste.', '2022-07-16'),
(24, 21, 32, 3, 'Real life example gulo onek helpful chilo.', '2022-10-25'),
(25, 41, 34, 5, 'Besi bhalo lagse ei boita!', '2023-10-08'),
(26, 10, 46, 1, 'Ei boita sobai ke porar suggestion dibo.', '2023-05-02'),
(27, 8, 17, 3, 'Onno rokom ekta golpo. Darun!', '2022-10-26'),
(28, 20, 40, 4, 'Average chilo, abar porbo na mone hoy.', '2022-03-13'),
(29, 35, 32, 1, 'Real life example gulo onek helpful chilo.', '2022-01-26'),
(30, 29, 25, 3, 'Besi bhalo lagse ei boita!', '2023-07-11'),
(31, 7, 26, 3, 'Besi bhalo lagse ei boita!', '2023-02-02'),
(32, 45, 48, 4, 'Onno rokom ekta golpo. Darun!', '2022-01-11'),
(33, 28, 5, 1, 'Ekdom time waste.', '2023-07-30'),
(34, 38, 24, 2, 'Real life example gulo onek helpful chilo.', '2022-09-26'),
(35, 38, 2, 2, 'Onno rokom ekta golpo. Darun!', '2023-02-26'),
(36, 16, 42, 3, 'Onno rokom ekta golpo. Darun!', '2023-12-14'),
(37, 14, 5, 3, 'Besi bhalo lagse ei boita!', '2022-11-12'),
(38, 14, 7, 3, 'Average chilo, abar porbo na mone hoy.', '2023-01-12'),
(39, 42, 33, 1, 'Besi bhalo lagse ei boita!', '2023-01-07'),
(40, 6, 26, 4, 'Besi bhalo lagse ei boita!', '2022-12-07'),
(41, 39, 25, 3, 'Khubi upokari ekta boi.', '2023-01-17'),
(42, 7, 39, 2, 'Real life example gulo onek helpful chilo.', '2023-07-14'),
(43, 4, 18, 5, 'Pore moja paisi, onek kichu shikhlam.', '2023-03-10'),
(44, 18, 4, 5, 'Real life example gulo onek helpful chilo.', '2022-01-01'),
(45, 8, 14, 2, 'Ekdom time waste.', '2023-05-05'),
(46, 49, 46, 4, 'Boi ta amar expect er cheye valo chilo.', '2022-07-28'),
(47, 3, 16, 3, 'Valo chilo, kintu aro details thakle valo hoto.', '2023-09-03'),
(48, 14, 15, 3, 'Khubi upokari ekta boi.', '2022-03-21'),
(49, 39, 20, 4, 'Besi bhalo lagse ei boita!', '2022-10-17'),
(50, 25, 2, 1, 'Ekdom time waste.', '2022-03-31');


-- Q61. Using a CTE, find the top 5 customers who have spent the most money on book orders.

WITH mostspent AS (
    SELECT c.customer_id, c.customer_name, SUM(b.price * o.quantity) AS total_spent
    FROM bookcustomers c
    INNER JOIN bookorders o ON c.customer_id = o.customer_id
    INNER JOIN books b ON o.book_id = b.book_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_id, customer_name, total_spent
FROM mostspent
ORDER BY total_spent DESC
LIMIT 5;

-- Q62. Find the top 3 most popular book genres based on the total quantity sold.

with popular_books as (

select b.genre, sum(o.quantity) as total_quantity_sold from books b inner join bookorders o 
on b.book_id = o.book_id
group by genre
)

select * from popular_books order by total_quantity_sold desc limit 3;

-- Q63. Find the top 3 customers who bought the highest number of different genres. 
-- Also show how many different genres each of them bought.
WITH genres_bought AS (
    SELECT 
        c.customer_id, 
        COUNT(DISTINCT b.genre) AS different_genres_bought
    FROM 
        bookcustomers c 
        INNER JOIN bookorders o ON c.customer_id = o.customer_id 
        INNER JOIN books b ON b.book_id = o.book_id
    GROUP BY 
        c.customer_id
)

SELECT 
    gb.customer_id, 
    bc.customer_name, 
    gb.different_genres_bought
FROM 
    genres_bought gb
    INNER JOIN bookcustomers bc ON gb.customer_id = bc.customer_id
ORDER BY 
    gb.different_genres_bought DESC
LIMIT 3;


-- Alternative answer (without using CTE)

select c.customer_id, c.customer_name, count(distinct genre) as genres_purchased from bookcustomers c inner join bookorders o 
on c.customer_id = o.customer_id
inner join books b on b.book_id = o.book_id
group by c.customer_id, c.customer_name
order by genres_purchased desc limit 3;



























