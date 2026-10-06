-- Database initialization and seed script for E-Commerce SQL Investigation Lab
-- Database: ecommerce_evaluation
-- Target Database: defaultdb (or active connected database)

-- Drop child tables first to respect foreign keys
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- -------------------------------------------------------------
-- Table 1: customers
-- -------------------------------------------------------------
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    city VARCHAR(80) NOT NULL,
    signup_date DATE NOT NULL
);

-- -------------------------------------------------------------
-- Table 2: products
-- -------------------------------------------------------------
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(80) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- -------------------------------------------------------------
-- Table 3: orders
-- -------------------------------------------------------------
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL,
    FOREIGN KEY (customer_id)   w REFERENCES customers(customer_id)
);

-- -------------------------------------------------------------
-- Table 4: order_items
-- -------------------------------------------------------------
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- -------------------------------------------------------------
-- Seed Data: customers (12 customers across diverse cities)
-- -------------------------------------------------------------
INSERT INTO customers (customer_id, full_name, email, city, signup_date) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', 'New York', '2023-01-15'),
(2, 'Bob Smith', 'bob.smith@example.com', 'Los Angeles', '2023-02-20'),
(3, 'Charlie Davis', 'charlie.davis@example.com', 'Chicago', '2023-03-10'),
(4, 'Diana Evans', 'diana.evans@example.com', 'Houston', '2023-04-05'),
(5, 'Evan Wright', 'evan.wright@example.com', 'Phoenix', '2023-05-12'),
(6, 'Fiona Green', 'fiona.green@example.com', 'Philadelphia', '2023-06-18'),
(7, 'George Harris', 'george.harris@example.com', 'San Antonio', '2023-07-22'),
(8, 'Hannah Martin', 'hannah.martin@example.com', 'San Diego', '2023-08-14'),
(9, 'Ian Clark', 'ian.clark@example.com', 'Dallas', '2023-09-01'),
(10, 'Julia Lewis', 'julia.lewis@example.com', 'San Jose', '2023-10-10'),
(11, 'Kevin Hall', 'kevin.hall@example.com', 'Austin', '2023-11-05'),
(12, 'Laura Allen', 'laura.allen@example.com', 'Jacksonville', '2023-12-01');

-- -------------------------------------------------------------
-- Seed Data: products (10 products across 4 categories)
-- Categories: Electronics, Accessories, Home, Books
-- -------------------------------------------------------------
INSERT INTO products (product_id, product_name, category, price, stock_quantity) VALUES
(1, 'Pro Laptop 15-inch', 'Electronics', 1200.00, 25),
(2, 'Noise-Cancelling Headphones', 'Electronics', 250.00, 40),
(3, 'Wireless Ergonomic Mouse', 'Accessories', 50.00, 100),
(4, 'Mechanical USB Keyboard', 'Accessories', 100.00, 60),
(5, '4K Ultra HD Monitor', 'Electronics', 400.00, 30),
(6, 'Smart Coffee Maker', 'Home', 150.00, 20),
(7, 'Ergonomic Desk Chair', 'Home', 300.00, 15),
(8, 'Mastering SQL Handbook', 'Books', 45.00, 80),
(9, 'Cloud Computing Guide', 'Books', 55.00, 50),
(10, 'USB-C Multiport Hub', 'Accessories', 60.00, 75);

-- -------------------------------------------------------------
-- Seed Data: orders (18 orders: completed, pending, cancelled)
-- -------------------------------------------------------------
INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(1, 1, '2023-02-01', 'completed'),
(2, 1, '2023-03-15', 'completed'),
(3, 2, '2023-03-01', 'completed'),
(4, 2, '2023-04-10', 'completed'),
(5, 2, '2023-05-05', 'pending'),
(6, 3, '2023-04-15', 'completed'),
(7, 3, '2023-05-20', 'completed'),
(8, 4, '2023-05-01', 'completed'),
(9, 4, '2023-06-12', 'cancelled'),
(10, 5, '2023-06-01', 'completed'),
(11, 6, '2023-07-04', 'pending'),
(12, 7, '2023-08-01', 'cancelled'),
(13, 7, '2023-08-15', 'cancelled'),
(14, 8, '2023-09-02', 'completed'),
(15, 8, '2023-09-25', 'pending'),
(16, 9, '2023-10-05', 'pending'),
(17, 9, '2023-10-20', 'cancelled'),
(18, 1, '2023-11-10', 'completed');

-- -------------------------------------------------------------
-- Seed Data: order_items (29 order items)
-- Includes historical unit_price differences, products never ordered (10),
-- and orders with multiple products.
-- -------------------------------------------------------------
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 2, 1150.00),
(2, 1, 3, 2, 50.00),
(3, 2, 5, 2, 400.00),
(4, 2, 2, 2, 240.00),
(5, 18, 1, 2, 1200.00),
(6, 18, 4, 2, 100.00),
(7, 3, 1, 2, 1200.00),
(8, 3, 2, 2, 250.00),
(9, 4, 6, 2, 140.00),
(10, 4, 7, 8, 300.00),
(11, 5, 2, 3, 250.00),
(12, 6, 5, 1, 400.00),
(13, 6, 4, 1, 100.00),
(14, 7, 8, 6, 45.00),
(15, 7, 7, 3, 300.00),
(16, 8, 1, 4, 1200.00),
(17, 8, 3, 6, 50.00),
(18, 8, 4, 2, 100.00),
(19, 9, 1, 3, 1200.00),
(20, 10, 6, 2, 150.00),
(21, 10, 2, 2, 250.00),
(22, 11, 9, 2, 55.00),
(23, 12, 5, 2, 400.00),
(24, 13, 4, 4, 100.00),
(25, 14, 8, 2, 45.00),
(26, 14, 9, 2, 55.00),
(27, 15, 3, 5, 50.00),
(28, 16, 1, 1, 1200.00),
(29, 17, 2, 1, 250.00);