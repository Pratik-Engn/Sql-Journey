-- DATASETS USED:
-- products(product_id, product_name, price)
-- employees(employee_id, first_name, salary)
-- students(student_id, student_name, marks)

-- =========================
-- ABS FUNCTION
-- =========================

-- 1. Absolute value
SELECT ABS(-150);

-- 2. Absolute salary difference
SELECT first_name, ABS(salary - 50000) AS salary_difference
FROM employees;

-- =========================
-- ROUND FUNCTION
-- =========================

-- 3. Round decimal number
SELECT ROUND(45.6789);

-- 4. Round to 2 decimal places
SELECT ROUND(45.6789, 2);

-- 5. Rounded product prices
SELECT product_name, ROUND(price, 2) AS rounded_price
FROM products;

-- =========================
-- CEIL FUNCTION
-- =========================

-- 6. Ceiling value
SELECT CEIL(45.2);

-- 7. Round salary upward
SELECT first_name, CEIL(salary)
FROM employees;

-- =========================
-- FLOOR FUNCTION
-- =========================

-- 8. Floor value
SELECT FLOOR(45.9);

-- 9. Round salary downward
SELECT first_name, FLOOR(salary)
FROM employees;

-- =========================
-- MOD FUNCTION
-- =========================

-- 10. Find remainder
SELECT MOD(10, 3);

-- 11. Check student mark remainder
SELECT student_name, MOD(marks, 5)
FROM students;

-- =========================
-- POWER FUNCTION
-- =========================

-- 12. Power calculation
SELECT POWER(2, 3);

-- 13. Square of student marks
SELECT student_name, POWER(marks, 2)
FROM students;

-- =========================
-- SQRT FUNCTION
-- =========================

-- 14. Square root
SELECT SQRT(64);

-- 15. Square root of marks
SELECT student_name, SQRT(marks)
FROM students;