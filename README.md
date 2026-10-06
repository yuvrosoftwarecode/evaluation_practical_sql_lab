# E-Commerce SQL Investigation

## Overview

Welcome to the **E-Commerce SQL Investigation** evaluation lab. An e-commerce business has pre-configured and populated a MySQL database named `ecommerce_evaluation`.

Your objective as a data analyst is to write standard, robust SQL queries that answer three specific business questions.

The database and data have already been seeded. Do not alter tables or modify data. Write your queries in the corresponding task files.

## Tasks

### Task 1: Customer Order Report (`task1.sql`)
Write a SQL query that returns customers who have completed orders and whose total spending exceeds 5000:
- Columns: `customer_id`, `full_name`, `city`, `total_completed_orders`, `total_spent`
- Calculate completed orders and total spending (`SUM(quantity * unit_price)` using historical unit price).
- Filter for completed orders only and total spending > 5000.
- Sort by `total_spent` descending, then `customer_id` ascending.

### Task 2: Best-Selling Products (`task2.sql`)
Identify products that have sold at least 5 units across completed orders in the Electronics and Accessories categories:
- Columns: `product_id`, `product_name`, `category`, `total_units_sold`, `total_revenue`
- Calculate `total_units_sold` and `total_revenue` (`quantity * unit_price`).
- Filter for completed orders only, categories in ('Electronics', 'Accessories'), and `total_units_sold >= 5`.
- Sort by `total_units_sold` descending, then `product_id` ascending.

### Task 3: Customers Who Have Never Placed a Completed Order (`task3.sql`)
Find registered customers who have never placed a completed order (including customers with only pending or cancelled orders, or no orders at all):
- Columns: `customer_id`, `full_name`, `email`, `city`, `signup_date`
- Sort by `signup_date` ascending, then `customer_id` ascending.
- Ensure each customer appears only once.
