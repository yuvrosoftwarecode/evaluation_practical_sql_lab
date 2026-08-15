CREATE TABLE customers (id INTEGER PRIMARY KEY, name TEXT, email TEXT);
INSERT INTO customers (id, name, email) VALUES (1, 'John Doe', 'john@example.com'), (2, 'Jane Smith', 'jane@example.com'), (3, 'Bob Johnson', 'bob@example.com');

CREATE TABLE orders (id INTEGER PRIMARY KEY, customer_id INTEGER, amount REAL, order_date TEXT);
INSERT INTO orders (id, customer_id, amount, order_date) VALUES (1, 1, 500.00, '2023-01-01'), (2, 2, 450.00, '2023-01-02'), (3, 3, 400.00, '2023-01-03');

CREATE TABLE departments (id INTEGER PRIMARY KEY, name TEXT);
INSERT INTO departments (id, name) VALUES (1, 'IT'), (2, 'Sales');

CREATE TABLE employees (id INTEGER PRIMARY KEY, name TEXT, salary REAL, department_id INTEGER);
INSERT INTO employees (id, name, salary, department_id) VALUES (1, 'Alice', 80000, 1), (2, 'Bob', 60000, 1), (3, 'Charlie', 70000, 2), (4, 'David', 50000, 2);

CREATE TABLE transactions (transaction_id INTEGER PRIMARY KEY, amount REAL, transaction_date TEXT);
INSERT INTO transactions (transaction_id, amount, transaction_date) VALUES (1, 100.00, '2023-10-01'), (2, 150.00, '2023-10-02'), (3, 200.00, '2023-10-03'), (4, 50.00, '2023-10-04'), (5, 300.00, '2023-10-05'), (6, 100.00, '2023-10-06'), (7, 153.50, '2023-10-07'), (8, 166.50, '2023-10-08');

CREATE TABLE products (id INTEGER PRIMARY KEY, name TEXT, category TEXT);
INSERT INTO products (id, name, category) VALUES (101, 'Old Widget', 'Gadgets'), (105, 'Discontinued Gadget', 'Gadgets'), (102, 'New Widget', 'Gadgets');

CREATE TABLE sales (id INTEGER PRIMARY KEY, product_id INTEGER, sale_date TEXT, quantity INTEGER);
INSERT INTO sales (id, product_id, sale_date, quantity) VALUES (1, 102, date('now', '-1 month'), 10);

CREATE TABLE users (id INTEGER PRIMARY KEY, username TEXT);
INSERT INTO users (id, username) VALUES (1, 'influencer_x'), (2, 'superfan1'), (3, 'loyal_follower'), (4, 'casual_user');

CREATE TABLE posts (id INTEGER PRIMARY KEY, author_id INTEGER, content TEXT);
INSERT INTO posts (id, author_id, content) VALUES (1, 1, 'Hello World'), (2, 1, 'Another post');

CREATE TABLE likes (user_id INTEGER, post_id INTEGER);
INSERT INTO likes (user_id, post_id) VALUES (2, 1), (2, 2), (3, 1), (3, 2), (4, 1);

CREATE TABLE patients (id INTEGER PRIMARY KEY, name TEXT);
INSERT INTO patients (id, name) VALUES (1, 'Mary'), (2, 'John');

CREATE TABLE visits (id INTEGER PRIMARY KEY, patient_id INTEGER, visit_date TEXT);
INSERT INTO visits (id, patient_id, visit_date) VALUES (1, 1, '2023-11-01'), (2, 1, '2023-11-15'), (3, 2, '2023-11-05');

CREATE TABLE students (id INTEGER PRIMARY KEY, name TEXT);
INSERT INTO students (id, name) VALUES (1, 'Alice'), (2, 'Bob');

CREATE TABLE grades (id INTEGER PRIMARY KEY, student_id INTEGER, course TEXT, grade REAL);
INSERT INTO grades (id, student_id, course, grade) VALUES (1, 1, 'Math', 90), (2, 1, 'Science', 85), (3, 2, 'Math', 70), (4, 2, 'Science', 80);