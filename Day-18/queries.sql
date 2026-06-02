USE sql_practice;

-- DATASETS USED:
-- employees(employee_id, first_name, hire_date)
-- orders(order_id, order_date)
-- customers(customer_id, customer_name, registration_date)
-- events(event_id, event_name, event_datetime)

-- ==========================================
-- DATEPART vs DATENAME
-- ==========================================

-- 1. DATEPART returns INTEGER
SELECT DATEPART(MONTH, GETDATE()) AS month_number;

-- Example Output:
-- 5

-- 2. DATENAME returns STRING
SELECT DATENAME(MONTH, GETDATE()) AS month_name;

-- Example Output:
-- May

-- 3. Employee hire month number
SELECT first_name,
       DATEPART(MONTH, hire_date) AS hire_month_number
FROM employees;

-- 4. Employee hire month name
SELECT first_name,
       DATENAME(MONTH, hire_date) AS hire_month_name
FROM employees;

-- 5. Order weekday number
SELECT order_id,
       DATEPART(WEEKDAY, order_date) AS weekday_number
FROM orders;

-- 6. Order weekday name
SELECT order_id,
       DATENAME(WEEKDAY, order_date) AS weekday_name
FROM orders;

-- ==========================================
-- DATETRUNC
-- ==========================================

-- 7. Beginning of current month
SELECT DATETRUNC(MONTH, GETDATE()) AS first_day_of_month;

-- 8. Beginning of hire month
SELECT first_name,
       DATETRUNC(MONTH, hire_date) AS hire_month_start
FROM employees;

-- 9. Beginning of current year
SELECT DATETRUNC(YEAR, GETDATE()) AS first_day_of_year;

-- 10. Beginning of current quarter
SELECT DATETRUNC(QUARTER, GETDATE()) AS first_day_of_quarter;

-- 11. Beginning of order month
SELECT order_id,
       DATETRUNC(MONTH, order_date) AS order_month_start
FROM orders;

-- ==========================================
-- EOMONTH
-- ==========================================

-- 12. End of current month
SELECT EOMONTH(GETDATE()) AS end_of_month;

-- 13. End of hire month
SELECT first_name,
       EOMONTH(hire_date) AS hire_month_end
FROM employees;

-- 14. End of order month
SELECT order_id,
       EOMONTH(order_date) AS order_month_end
FROM orders;

-- 15. End of next month
SELECT EOMONTH(GETDATE(), 1) AS next_month_end;

-- ==========================================
-- BONUS
-- FIRST DAY AND LAST DAY TOGETHER
-- ==========================================

SELECT
    DATETRUNC(MONTH, GETDATE()) AS first_day,
    EOMONTH(GETDATE()) AS last_day;