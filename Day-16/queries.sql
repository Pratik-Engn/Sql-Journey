USE sql_practice;

-- DATASETS USED:
-- employees(employee_id, first_name, hire_date)
-- orders(order_id, order_date)
-- customers(customer_id, customer_name, registration_date_string)
-- events(event_id, event_name, event_datetime)

-- ==================================================
-- SECTION 1: DATE/TIME ALREADY PRESENT IN DATABASE
-- ==================================================

-- 1. View employee hire dates
SELECT employee_id, first_name, hire_date
FROM employees;

-- 2. Extract year from hire date
SELECT first_name, YEAR(hire_date) AS hire_year
FROM employees;

-- 3. Extract month from order date
SELECT order_id, MONTH(order_date) AS order_month
FROM orders;

-- 4. Extract day from event datetime
SELECT event_name, DAY(event_datetime) AS event_day
FROM events;

-- 5. Extract date only from datetime
SELECT event_name, DATE(event_datetime) AS event_date
FROM events;

-- ==================================================
-- SECTION 2: DATE STORED AS STRING
-- ==================================================

-- Example string format: '2026-05-27'

-- 6. Convert string to date
SELECT customer_name,
       STR_TO_DATE(registration_date_string, '%Y-%m-%d') AS actual_date
FROM customers;

-- 7. Extract year from converted string date
SELECT customer_name,
       YEAR(STR_TO_DATE(registration_date_string, '%Y-%m-%d')) AS registration_year
FROM customers;

-- 8. Extract month from converted string date
SELECT customer_name,
       MONTH(STR_TO_DATE(registration_date_string, '%Y-%m-%d')) AS registration_month
FROM customers;

-- ==================================================
-- SECTION 3: SYSTEM GENERATED DATE/TIME FUNCTIONS
-- ==================================================

-- 9. Current date and time
SELECT NOW();

-- 10. Current date only
SELECT CURDATE();

-- 11. Current time only
SELECT CURTIME();

-- 12. Employee working days since joining
SELECT first_name,
       DATEDIFF(CURDATE(), hire_date) AS days_worked
FROM employees;

-- 13. Days since event happened
SELECT event_name,
       DATEDIFF(CURDATE(), DATE(event_datetime)) AS days_since_event
FROM events;

-- 14. Orders placed this month
SELECT *
FROM orders
WHERE MONTH(order_date) = MONTH(CURDATE());

-- 15. Events happening today
SELECT *
FROM events
WHERE DATE(event_datetime) = CURDATE();