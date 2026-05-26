USE sql_practice;

-- DATASETS USED:
-- employees(employee_id, first_name, last_name)
-- customers(customer_id, customer_name, email)
-- products(product_id, product_name)
-- students(student_id, student_name)
-- books(book_id, book_name)

-- =========================
-- SUBSTRING QUERIES
-- =========================

-- 1. First 3 letters of employee first name
SELECT SUBSTRING(first_name, 1, 3) AS short_name
FROM employees;

-- 2. First 5 letters of customer name
SELECT SUBSTRING(customer_name, 1, 5) AS customer_short
FROM customers;

-- 3. First 4 letters of product name
SELECT SUBSTRING(product_name, 1, 4) AS product_short
FROM products;

-- 4. Extract middle letters from student name
SELECT SUBSTRING(student_name, 2, 4) AS middle_part
FROM students;

-- 5. First 6 letters of book name
SELECT SUBSTRING(book_name, 1, 6) AS book_short
FROM books;

-- 6. Extract first 2 letters of employee last name
SELECT SUBSTRING(last_name, 1, 2) AS last_initials
FROM employees;

-- 7. Extract domain from email
SELECT SUBSTRING(email, 7) AS email_domain
FROM customers;

-- 8. Extract first letter from student name
SELECT SUBSTRING(student_name, 1, 1) AS first_letter
FROM students;

-- 9. Extract first 8 letters of product name
SELECT SUBSTRING(product_name, 1, 8) AS product_prefix
FROM products;

-- 10. Extract part of customer email
SELECT SUBSTRING(email, 1, 10) AS email_preview
FROM customers;

-- 11. Extract last name partial
SELECT SUBSTRING(last_name, 2, 3) AS partial_last_name
FROM employees;

-- 12. Extract book code
SELECT SUBSTRING(book_name, 1, 3) AS book_code
FROM books;

-- 13. Extract customer initials
SELECT SUBSTRING(customer_name, 1, 1) AS first_initial
FROM customers;

-- 14. Extract letters from product middle
SELECT SUBSTRING(product_name, 3, 5) AS middle_product
FROM products;

-- 15. Extract short student code
SELECT SUBSTRING(student_name, 1, 3) AS student_code
FROM students;