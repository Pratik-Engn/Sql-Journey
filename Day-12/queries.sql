-- DATASETS USED:
-- employees(employee_id, first_name, last_name)
-- customers(customer_id, customer_name)
-- products(product_id, product_name)
-- students(student_id, student_name)
-- books(book_id, book_name)

-- =========================
-- CONCAT QUERIES
-- =========================

-- 1. Combine first and last name
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

-- 2. Greeting message
SELECT CONCAT('Hello ', first_name) AS greeting
FROM employees;

-- 3. Product label
SELECT CONCAT('Product: ', product_name) AS product_label
FROM products;

-- =========================
-- UPPER QUERIES
-- =========================

-- 4. Employee names in uppercase
SELECT UPPER(first_name) AS upper_name
FROM employees;

-- 5. Customer names in uppercase
SELECT UPPER(customer_name) AS customer_upper
FROM customers;

-- 6. Product names in uppercase
SELECT UPPER(product_name) AS product_upper
FROM products;

-- =========================
-- LOWER QUERIES
-- =========================

-- 7. Employee names in lowercase
SELECT LOWER(first_name) AS lower_name
FROM employees;

-- 8. Student names in lowercase
SELECT LOWER(student_name) AS student_lower
FROM students;

-- 9. Book names in lowercase
SELECT LOWER(book_name) AS book_lower
FROM books;

-- =========================
-- TRIM QUERIES
-- =========================

-- 10. Remove extra spaces from customer names
SELECT TRIM(customer_name) AS clean_name
FROM customers;

-- 11. Remove spaces from student names
SELECT TRIM(student_name) AS clean_student
FROM students;

-- 12. Remove spaces from product names
SELECT TRIM(product_name) AS clean_product
FROM products;

-- =========================
-- REPLACE QUERIES
-- =========================

-- 13. Replace 'Laptop' with 'Notebook'
SELECT REPLACE(product_name, 'Laptop', 'Notebook') AS updated_name
FROM products;

-- 14. Replace 'Mr' with 'Mister'
SELECT REPLACE(customer_name, 'Mr', 'Mister') AS updated_customer
FROM customers;

-- 15. Replace spaces with underscores
SELECT REPLACE(book_name, ' ', '_') AS formatted_book_name
FROM books;