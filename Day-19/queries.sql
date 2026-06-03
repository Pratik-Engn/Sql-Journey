USE sql_practice;

-- DATASETS USED:
-- employees(employee_id, first_name, hire_date)
-- orders(order_id, order_date)
-- customers(customer_id, customer_name, registration_date)
-- events(event_id, event_name, event_datetime)

-- ==========================================
-- CAST()
-- ==========================================

-- 1. Convert current datetime to date
SELECT CAST(GETDATE() AS DATE) AS current_date;

-- 2. Convert current datetime to time
SELECT CAST(GETDATE() AS TIME) AS current_time;

-- 3. Convert hire_date to datetime
SELECT CAST(hire_date AS DATETIME)
FROM employees;

-- 4. Convert order date to varchar
SELECT CAST(order_date AS VARCHAR(30))
FROM orders;

-- ==========================================
-- CONVERT()
-- ==========================================

-- 5. Convert current date to DD/MM/YYYY
SELECT CONVERT(VARCHAR, GETDATE(), 103);

-- 6. Convert current date to MM/DD/YYYY
SELECT CONVERT(VARCHAR, GETDATE(), 101);

-- 7. Convert current date to YYYY-MM-DD
SELECT CONVERT(VARCHAR, GETDATE(), 23);

-- 8. Convert hire date into formatted string
SELECT first_name,
       CONVERT(VARCHAR, hire_date, 103)
FROM employees;

-- ==========================================
-- FORMAT()
-- ==========================================

-- 9. Format current date
SELECT FORMAT(GETDATE(), 'dd/MM/yyyy');

-- 10. Format current date US style
SELECT FORMAT(GETDATE(), 'MM/dd/yyyy');

-- 11. Format current date with month name
SELECT FORMAT(GETDATE(), 'dd MMMM yyyy');

-- 12. Format current time
SELECT FORMAT(GETDATE(), 'HH:mm:ss');

-- 13. Format employee hire date
SELECT first_name,
       FORMAT(hire_date, 'dd-MMM-yyyy')
FROM employees;

-- ==========================================
-- PRACTICAL QUERIES
-- ==========================================

-- 14. Employee hire date in readable format
SELECT first_name,
       FORMAT(hire_date, 'dddd, dd MMMM yyyy')
FROM employees;

-- 15. Event datetime formatted
SELECT event_name,
       FORMAT(event_datetime, 'dd/MM/yyyy HH:mm:ss')
FROM events;

-- 16. Registration date formatted
SELECT customer_name,
       FORMAT(registration_date, 'MMMM yyyy')
FROM customers;

-- 17. Current month and year
SELECT FORMAT(GETDATE(), 'MMMM yyyy');

-- 18. Current day name
SELECT FORMAT(GETDATE(), 'dddd');

-- 19. Current month name
SELECT FORMAT(GETDATE(), 'MMMM');

-- 20. Current year
SELECT FORMAT(GETDATE(), 'yyyy');