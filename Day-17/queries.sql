USE sql_practice;

-- DATASETS USED:
-- employees(employee_id, first_name, hire_date)
-- orders(order_id, order_date)
-- customers(customer_id, customer_name, registration_date)
-- events(event_id, event_name, event_datetime)

-- ==========================================
-- YEAR EXTRACTION
-- ==========================================

-- 1. Extract employee hire year
SELECT first_name,
       YEAR(hire_date) AS hire_year
FROM employees;

-- 2. Extract customer registration year
SELECT customer_name,
       YEAR(registration_date) AS registration_year
FROM customers;

-- ==========================================
-- MONTH EXTRACTION
-- ==========================================

-- 3. Extract employee hire month
SELECT first_name,
       MONTH(hire_date) AS hire_month
FROM employees;

-- 4. Extract order month
SELECT order_id,
       MONTH(order_date) AS order_month
FROM orders;

-- ==========================================
-- DAY EXTRACTION
-- ==========================================

-- 5. Extract hire day
SELECT first_name,
       DAY(hire_date) AS hire_day
FROM employees;

-- 6. Extract registration day
SELECT customer_name,
       DAY(registration_date) AS registration_day
FROM customers;

-- ==========================================
-- DATE EXTRACTION
-- ==========================================

-- 7. Extract date from datetime
SELECT event_name,
       CAST(event_datetime AS DATE) AS event_date
FROM events;

-- 8. Today's current date
SELECT CAST(GETDATE() AS DATE) AS current_date;

-- ==========================================
-- DATEPART FUNCTION
-- ==========================================

-- 9. Extract year using DATEPART
SELECT first_name,
       DATEPART(YEAR, hire_date) AS hire_year
FROM employees;

-- 10. Extract month using DATEPART
SELECT order_id,
       DATEPART(MONTH, order_date) AS order_month
FROM orders;

-- 11. Extract day using DATEPART
SELECT customer_name,
       DATEPART(DAY, registration_date) AS registration_day
FROM customers;

-- 12. Extract hour from event datetime
SELECT event_name,
       DATEPART(HOUR, event_datetime) AS event_hour
FROM events;

-- 13. Extract minute from event datetime
SELECT event_name,
       DATEPART(MINUTE, event_datetime) AS event_minute
FROM events;

-- 14. Extract current year
SELECT DATEPART(YEAR, GETDATE()) AS current_year;

-- 15. Extract current month
SELECT DATEPART(MONTH, GETDATE()) AS current_month;