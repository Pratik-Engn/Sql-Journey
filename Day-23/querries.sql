- SQL Journey - Day 23
- Date Functions + String Functions Revision


- DATE FUNCTIONS

SELECT CURRENT_DATE;

SELECT CURRENT_TIMESTAMP;

SELECT
    order_date,
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    EXTRACT(DAY FROM order_date) AS order_day
FROM orders;

SELECT *
FROM orders
WHERE order_date >= '2026-01-01';

SELECT *
FROM orders
WHERE order_date BETWEEN '2026-01-01' AND '2026-03-31';

SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    COUNT(*) AS total_orders
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY order_year;

SELECT
    EXTRACT(MONTH FROM order_date) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY order_month;

SELECT
    order_timestamp,
    CAST(order_timestamp AS DATE) AS order_date
FROM orders;

SELECT
    order_date,
    delivery_date,
    delivery_date - order_date AS delivery_days
FROM orders;


-- STRING FUNCTIONS---

SELECT
    first_name,
    UPPER(first_name) AS uppercase_name,
    LOWER(first_name) AS lowercase_name,
    LENGTH(first_name) AS name_length
FROM employees;

SELECT
    first_name,
    TRIM(first_name) AS cleaned_name
FROM employees;

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

SELECT
    first_name,
    SUBSTRING(first_name, 1, 3) AS first_three_characters
FROM employees;

SELECT
    phone_number,
    REPLACE(phone_number, '-', '') AS cleaned_phone
FROM employees;

SELECT *
FROM employees
WHERE first_name LIKE 'A%';

SELECT *
FROM employees
WHERE first_name LIKE '%n';

SELECT *
FROM employees
WHERE first_name LIKE '%an%';


-- COMBINING STRING FUNCTIONS

SELECT
    UPPER(TRIM(first_name)) AS cleaned_name
FROM employees;

SELECT
    CONCAT(
        UPPER(TRIM(first_name)),
        ' ',
        UPPER(TRIM(last_name))
    ) AS full_name
FROM employees;


-- DATE + STRING FUNCTIONS

SELECT
    CONCAT(
        UPPER(TRIM(first_name)),
        ' ',
        UPPER(TRIM(last_name))
    ) AS employee_name,
    EXTRACT(YEAR FROM joining_date) AS joining_year,
    EXTRACT(MONTH FROM joining_date) AS joining_month
FROM employees;


-- DATE + STRING + FILTERING

SELECT
    CONCAT(
        UPPER(TRIM(first_name)),
        ' ',
        UPPER(TRIM(last_name))
    ) AS employee_name,
    joining_date,
    salary
FROM employees
WHERE EXTRACT(YEAR FROM joining_date) = 2026
ORDER BY joining_date;


-- FINAL REVISION QUERY

SELECT
    CONCAT(
        UPPER(TRIM(first_name)),
        ' ',
        UPPER(TRIM(last_name))
    ) AS employee_name,
    EXTRACT(YEAR FROM joining_date) AS joining_year,
    EXTRACT(MONTH FROM joining_date) AS joining_month,
    salary
FROM employees
WHERE joining_date IS NOT NULL
ORDER BY joining_date DESC;
