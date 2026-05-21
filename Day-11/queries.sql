-- DATASETS USED:
-- employees(employee_id, first_name, last_name)
-- customers(customer_id, first_name, last_name)
-- students(student_id, student_name)
-- products(product_id, product_name)
-- books(book_id, book_name)
-- movies(movie_id, movie_name)

-- =========================
-- CONCAT FUNCTION QUERIES
-- =========================

-- 1. Full employee name
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

-- 2. Full customer name
SELECT CONCAT(first_name, ' ', last_name) AS customer_name
FROM customers;

-- 3. Add greeting message
SELECT CONCAT('Hello ', first_name) AS greeting
FROM employees;

-- 4. Product label
SELECT CONCAT('Product: ', product_name) AS product_label
FROM products;

-- 5. Student welcome message
SELECT CONCAT('Welcome ', student_name) AS welcome_message
FROM students;

-- =========================
-- LEFT FUNCTION QUERIES
-- =========================

-- 6. First 3 letters of employee names
SELECT LEFT(first_name, 3) AS short_name
FROM employees;

-- 7. First 5 letters of product names
SELECT LEFT(product_name, 5) AS short_product
FROM products;

-- 8. First 4 letters of student names
SELECT LEFT(student_name, 4) AS student_short
FROM students;

-- 9. First 2 letters of movie names
SELECT LEFT(movie_name, 2) AS movie_prefix
FROM movies;

-- 10. First 6 letters of book names
SELECT LEFT(book_name, 6) AS book_short
FROM books;

-- =========================
-- RIGHT FUNCTION QUERIES
-- =========================

-- 11. Last 3 letters of employee names
SELECT RIGHT(first_name, 3) AS ending_letters
FROM employees;

-- 12. Last 5 letters of product names
SELECT RIGHT(product_name, 5) AS product_end
FROM products;

-- 13. Last 4 letters of student names
SELECT RIGHT(student_name, 4) AS student_end
FROM students;

-- 14. Last 3 letters of movie names
SELECT RIGHT(movie_name, 3) AS movie_end
FROM movies;

-- 15. Last 6 letters of book names
SELECT RIGHT(book_name, 6) AS book_end
FROM books;