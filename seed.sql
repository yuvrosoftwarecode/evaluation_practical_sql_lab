PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;

-- 1. Customers Table (12 customers)
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    city TEXT NOT NULL,
    country TEXT NOT NULL,
    created_at TEXT NOT NULL
);

-- 2. Categories Table (5 categories)
CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_name TEXT NOT NULL UNIQUE,
    description TEXT
);

-- 3. Products Table (16 products)
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_name TEXT NOT NULL,
    category_id INTEGER NOT NULL,
    unit_price REAL NOT NULL,
    stock_quantity INTEGER NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories (category_id)
);

-- 4. Orders Table (22 orders)
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER NOT NULL,
    order_date TEXT NOT NULL,
    status TEXT NOT NULL,
    total_amount REAL NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

-- 5. Order Items Table (31 order items)
CREATE TABLE order_items (
    item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price REAL NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

-- SEED DATA

INSERT INTO categories (category_id, category_name, description) VALUES
(1, 'Electronics', 'Consumer electronics, accessories, and gadgets'),
(2, 'Clothing', 'Men and women casual and formal apparel'),
(3, 'Books', 'Educational books, literature, and fiction'),
(4, 'Home & Kitchen', 'Cookware, small appliances, and home decor'),
(5, 'Sports & Outdoors', 'Sporting goods, fitness equipment, and activewear');

INSERT INTO customers (customer_id, first_name, last_name, email, city, country, created_at) VALUES
(1, 'Alice', 'Smith', 'alice.smith@example.com', 'New York', 'USA', '2023-01-15'),
(2, 'Bob', 'Jones', 'bob.jones@example.com', 'London', 'UK', '2023-02-20'),
(3, 'Charlie', 'Brown', 'charlie.brown@example.com', 'Toronto', 'Canada', '2023-03-10'),
(4, 'Diana', 'Prince', 'diana.prince@example.com', 'Chicago', 'USA', '2023-04-05'),
(5, 'Ethan', 'Hunt', 'ethan.hunt@example.com', 'Sydney', 'Australia', '2023-05-12'),
(6, 'Fiona', 'Gallagher', 'fiona.g@example.com', 'Dublin', 'Ireland', '2023-06-18'),
(7, 'George', 'Clark', 'george.clark@example.com', 'Seattle', 'USA', '2023-07-22'),
(8, 'Hannah', 'Abbott', 'hannah.a@example.com', 'Manchester', 'UK', '2023-08-30'),
(9, 'Ian', 'Malcolm', 'ian.m@example.com', 'Austin', 'USA', '2023-09-14'),
(10, 'Julia', 'Roberts', 'julia.r@example.com', 'Los Angeles', 'USA', '2023-10-01'),
(11, 'Kevin', 'Bacon', 'kevin.b@example.com', 'Boston', 'USA', '2023-11-11'),
(12, 'Laura', 'Croft', 'laura.c@example.com', 'Berlin', 'Germany', '2023-12-05');

INSERT INTO products (product_id, product_name, category_id, unit_price, stock_quantity) VALUES
(1, 'Wireless Noise-Canceling Headphones', 1, 150.00, 45),
(2, 'Mechanical Gaming Keyboard', 1, 90.00, 30),
(3, 'Ergonomic Wireless Mouse', 1, 40.00, 60),
(4, 'Ultra HD 4K Monitor', 1, 350.00, 15),
(5, 'Cotton Graphic T-Shirt', 2, 25.00, 100),
(6, 'Slim Fit Denim Jeans', 2, 60.00, 50),
(7, 'Lightweight Running Shoes', 2, 80.00, 40),
(8, 'Waterproof Winter Jacket', 2, 120.00, 20),
(9, 'SQL Practical Guidebook', 3, 45.00, 80),
(10, 'Data Science Essentials', 3, 55.00, 60),
(11, 'Fiction Best-Seller Novel', 3, 15.00, 120),
(12, 'Stainless Steel Water Bottle', 4, 20.00, 90),
(13, 'Non-Stick Ceramic Frying Pan', 4, 35.00, 35),
(14, 'Standing Desk Converter', 4, 180.00, 25),
(15, 'Yoga Mat Extra Thick', 5, 30.00, 70),
(16, 'Adjustable Dumbbell Set', 5, 200.00, 10);

INSERT INTO orders (order_id, customer_id, order_date, status, total_amount) VALUES
(1, 1, '2024-01-10', 'Completed', 190.00),
(2, 1, '2024-02-14', 'Completed', 350.00),
(3, 1, '2024-03-20', 'Completed', 65.00),
(4, 2, '2024-01-18', 'Completed', 150.00),
(5, 2, '2024-03-05', 'Pending', 90.00),
(6, 2, '2024-04-12', 'Completed', 160.00),
(7, 3, '2024-01-22', 'Completed', 450.00),
(8, 3, '2024-02-28', 'Cancelled', 120.00),
(9, 3, '2024-05-15', 'Completed', 85.00),
(10, 4, '2024-02-01', 'Completed', 75.00),
(11, 4, '2024-03-18', 'Completed', 200.00),
(12, 4, '2024-06-02', 'Completed', 140.00),
(13, 5, '2024-02-10', 'Completed', 150.00),
(14, 5, '2024-04-25', 'Cancelled', 350.00),
(15, 6, '2024-03-12', 'Processing', 80.00),
(16, 7, '2024-03-30', 'Completed', 115.00),
(17, 7, '2024-05-08', 'Completed', 210.00),
(18, 8, '2024-04-04', 'Completed', 120.00),
(19, 8, '2024-06-19', 'Completed', 60.00),
(20, 9, '2024-04-15', 'Pending', 40.00),
(21, 9, '2024-05-20', 'Completed', 175.00),
(22, 10, '2024-05-01', 'Completed', 270.00);

INSERT INTO order_items (item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1, 150.00),
(2, 1, 3, 1, 40.00),
(3, 2, 4, 1, 350.00),
(4, 3, 5, 1, 25.00),
(5, 3, 3, 1, 40.00),
(6, 4, 1, 1, 150.00),
(7, 5, 2, 1, 90.00),
(8, 6, 7, 2, 80.00),
(9, 7, 1, 3, 150.00),
(10, 8, 8, 1, 120.00),
(11, 9, 9, 1, 45.00),
(12, 9, 3, 1, 40.00),
(13, 10, 5, 3, 25.00),
(14, 11, 6, 2, 60.00),
(15, 11, 7, 1, 80.00),
(16, 12, 2, 1, 90.00),
(17, 12, 5, 2, 25.00),
(18, 13, 1, 1, 150.00),
(19, 14, 4, 1, 350.00),
(20, 15, 7, 1, 80.00),
(21, 16, 10, 1, 55.00),
(22, 16, 6, 1, 60.00),
(23, 17, 1, 1, 150.00),
(24, 17, 12, 3, 20.00),
(25, 18, 9, 2, 45.00),
(26, 18, 11, 2, 15.00),
(27, 19, 15, 2, 30.00),
(28, 20, 3, 1, 40.00),
(29, 21, 10, 1, 55.00),
(30, 21, 8, 1, 120.00),
(31, 22, 2, 3, 90.00);