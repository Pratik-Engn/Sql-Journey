-- ============================================================
-- SQL JOURNEY - DAY 25
-- DATE FUNCTION PROBLEM SOLVING
-- MySQL
-- ============================================================


-- ============================================================
-- BASIC DATE FUNCTIONS
-- ============================================================

-- Q1. Display today's date.

SELECT CURDATE();


-- Q2. Display the current date and time.

SELECT NOW();


-- Q3. Display the current time.

SELECT CURTIME();


-- Q4. From the orders table, display the order date,
-- year, month and day for every order.

SELECT
    order_date,
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    DAY(order_date) AS order_day
FROM orders;


-- Q5. Display the month name for every order.

SELECT
    order_date,
    MONTHNAME(order_date) AS month_name
FROM orders;


-- Q6. Display the weekday name for every order.

SELECT
    order_date,
    DAYNAME(order_date) AS weekday_name
FROM orders;


-- ============================================================
-- DATE FILTERING
-- ============================================================

-- Q7. Find all orders placed in 2026.

SELECT *
FROM orders
WHERE YEAR(order_date) = 2026;


-- Q8. Find all orders placed in January 2026.

SELECT *
FROM orders
WHERE YEAR(order_date) = 2026
  AND MONTH(order_date) = 1;


-- Q9. Find all orders placed between
-- January 1 and March 31, 2026.

SELECT *
FROM orders
WHERE order_date BETWEEN '2026-01-01' AND '2026-03-31';


-- Q10. Find all orders placed after June 30, 2026.

SELECT *
FROM orders
WHERE order_date > '2026-06-30';


-- Q11. Find all orders placed before January 1, 2026.

SELECT *
FROM orders
WHERE order_date < '2026-01-01';


-- ============================================================
-- DATE FORMATTING
-- ============================================================

-- Q12. Display order dates in the format:
-- YYYY-MM-DD

SELECT
    DATE_FORMAT(order_date, '%Y-%m-%d') AS formatted_date
FROM orders;


-- Q13. Display order dates in the format:
-- Month Year
-- Example: September 2026

SELECT
    DATE_FORMAT(order_date, '%M %Y') AS formatted_date
FROM orders;


-- Q14. Display:
-- Day Month Year
-- Example: 27 September 2026

SELECT
    DATE_FORMAT(order_date, '%d %M %Y') AS formatted_date
FROM orders;


-- ============================================================
-- DATE ARITHMETIC
-- ============================================================

-- Q15. Display the order date and the date
-- exactly 7 days after the order.

SELECT
    order_date,
    DATE_ADD(order_date, INTERVAL 7 DAY) AS date_after_7_days
FROM orders;


-- Q16. Display the order date and the date
-- exactly 30 days before the order.

SELECT
    order_date,
    DATE_SUB(order_date, INTERVAL 30 DAY) AS date_before_30_days
FROM orders;


-- Q17. Find the expected delivery date
-- if every order takes exactly 7 days.

SELECT
    order_date,
    DATE_ADD(order_date, INTERVAL 7 DAY) AS expected_delivery_date
FROM orders;


-- Q18. Find the date exactly 3 months after each order.

SELECT
    order_date,
    DATE_ADD(order_date, INTERVAL 3 MONTH) AS date_after_3_months
FROM orders;


-- Q19. Find the date exactly 1 year after each order.

SELECT
    order_date,
    DATE_ADD(order_date, INTERVAL 1 YEAR) AS date_after_1_year
FROM orders;


-- ============================================================
-- DATE DIFFERENCES
-- ============================================================

-- Q20. Calculate the number of days between
-- order_date and delivery_date.

SELECT
    order_id,
    order_date,
    delivery_date,
    DATEDIFF(delivery_date, order_date) AS delivery_days
FROM orders;


-- Q21. Find orders that took more than 7 days to deliver.

SELECT *
FROM orders
WHERE DATEDIFF(delivery_date, order_date) > 7;


-- Q22. Find orders that were delivered within 3 days.

SELECT *
FROM orders
WHERE DATEDIFF(delivery_date, order_date) <= 3;


-- Q23. Calculate the delivery time in months.

SELECT
    order_id,
    TIMESTAMPDIFF(
        MONTH,
        order_date,
        delivery_date
    ) AS delivery_months
FROM orders;


-- Q24. Calculate the delivery time in hours
-- if order_timestamp and delivery_timestamp exist.

SELECT
    order_id,
    TIMESTAMPDIFF(
        HOUR,
        order_timestamp,
        delivery_timestamp
    ) AS delivery_hours
FROM orders;


-- ============================================================
-- MONTH / WEEK ANALYSIS
-- ============================================================

-- Q25. Count the number of orders placed in each year.

SELECT
    YEAR(order_date) AS order_year,
    COUNT(*) AS total_orders
FROM orders
GROUP BY YEAR(order_date)
ORDER BY order_year;


-- Q26. Count the number of orders placed in each month.

SELECT
    MONTH(order_date) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY MONTH(order_date)
ORDER BY order_month;


-- Q27. Find the total order amount for each year.

SELECT
    YEAR(order_date) AS order_year,
    SUM(order_amount) AS total_revenue
FROM orders
GROUP BY YEAR(order_date)
ORDER BY order_year;


-- Q28. Find the total order amount for each month.

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(order_amount) AS total_revenue
FROM orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    order_year,
    order_month;


-- Q29. Find the average order value for each month.

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    AVG(order_amount) AS average_order_value
FROM orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    order_year,
    order_month;


-- Q30. Find the number of orders placed on each weekday.

SELECT
    DAYNAME(order_date) AS weekday_name,
    COUNT(*) AS total_orders
FROM orders
GROUP BY DAYNAME(order_date)
ORDER BY total_orders DESC;


-- ============================================================
-- MONTH-END PROBLEMS
-- ============================================================

-- Q31. Find the last day of the month
-- for every order.

SELECT
    order_date,
    LAST_DAY(order_date) AS month_end
FROM orders;


-- Q32. Find orders that were placed on the last day
-- of their respective month.

SELECT *
FROM orders
WHERE order_date = LAST_DAY(order_date);


-- Q33. Find the first day of the month
-- for every order.

SELECT
    order_date,
    DATE_SUB(
        order_date,
        INTERVAL (DAY(order_date) - 1) DAY
    ) AS month_start
FROM orders;


-- ============================================================
-- DATETIME PROBLEMS
-- ============================================================

-- Q34. Extract only the date from order_timestamp.

SELECT
    order_timestamp,
    DATE(order_timestamp) AS order_date
FROM orders;


-- Q35. Extract the hour from order_timestamp.

SELECT
    order_timestamp,
    HOUR(order_timestamp) AS order_hour
FROM orders;


-- Q36. Find all orders placed after 6 PM.

SELECT *
FROM orders
WHERE HOUR(order_timestamp) >= 18;


-- Q37. Find all orders placed between 9 AM and 12 PM.

SELECT *
FROM orders
WHERE HOUR(order_timestamp) BETWEEN 9 AND 11;


-- ============================================================
-- EMPLOYEE DATE PROBLEMS
-- ============================================================

-- Q38. Find the year each employee joined.

SELECT
    employee_id,
    employee_name,
    YEAR(joining_date) AS joining_year
FROM employees;


-- Q39. Find employees who joined in 2025.

SELECT *
FROM employees
WHERE YEAR(joining_date) = 2025;


-- Q40. Find the number of employees who joined each year.

SELECT
    YEAR(joining_date) AS joining_year,
    COUNT(*) AS employee_count
FROM employees
GROUP BY YEAR(joining_date)
ORDER BY joining_year;


-- Q41. Find the number of employees who joined each month.

SELECT
    MONTH(joining_date) AS joining_month,
    COUNT(*) AS employee_count
FROM employees
GROUP BY MONTH(joining_date)
ORDER BY joining_month;


-- Q42. Calculate how many days each employee
-- has been with the company.

SELECT
    employee_id,
    employee_name,
    joining_date,
    DATEDIFF(CURDATE(), joining_date) AS days_with_company
FROM employees;


-- Q43. Calculate employee tenure in years.

SELECT
    employee_id,
    employee_name,
    joining_date,
    TIMESTAMPDIFF(
        YEAR,
        joining_date,
        CURDATE()
    ) AS years_with_company
FROM employees;


-- ============================================================
-- INTERMEDIATE PROBLEMS
-- ============================================================

-- Q44. Find the first order date for each customer.

SELECT
    customer_id,
    MIN(order_date) AS first_order_date
FROM orders
GROUP BY customer_id;


-- Q45. Find the most recent order date for each customer.

SELECT
    customer_id,
    MAX(order_date) AS latest_order_date
FROM orders
GROUP BY customer_id;


-- Q46. Find the number of days between
-- a customer's first and most recent order.

SELECT
    customer_id,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS latest_order_date,
    DATEDIFF(
        MAX(order_date),
        MIN(order_date)
    ) AS days_between_orders
FROM orders
GROUP BY customer_id;


-- Q47. Find customers whose first order
-- was placed in 2026.

SELECT
    customer_id,
    MIN(order_date) AS first_order_date
FROM orders
GROUP BY customer_id
HAVING YEAR(MIN(order_date)) = 2026;


-- Q48. Find customers who placed an order
-- within 30 days of their previous order.
--
-- This problem requires comparing consecutive
-- orders and is normally solved using LAG().

SELECT
    customer_id,
    order_date,
    LAG(order_date) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_date
FROM orders;


-- ============================================================
-- ADVANCED DATE PROBLEMS
-- ============================================================

-- Q49. Find the monthly number of orders
-- and monthly total revenue.

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    COUNT(*) AS total_orders,
    SUM(order_amount) AS total_revenue
FROM orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    order_year,
    order_month;


-- Q50. Find the average number of days
-- between order and delivery.

SELECT
    AVG(
        DATEDIFF(delivery_date, order_date)
    ) AS average_delivery_days
FROM orders;


-- Q51. Find the month with the highest
-- number of orders.

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY total_orders DESC
LIMIT 1;


-- Q52. Find the year with the highest
-- total revenue.

SELECT
    YEAR(order_date) AS order_year,
    SUM(order_amount) AS total_revenue
FROM orders
GROUP BY YEAR(order_date)
ORDER BY total_revenue DESC
LIMIT 1;


-- Q53. Find customers who have not placed
-- an order in the last 90 days.

SELECT
    customer_id,
    MAX(order_date) AS latest_order_date
FROM orders
GROUP BY customer_id
HAVING MAX(order_date) < DATE_SUB(CURDATE(), INTERVAL 90 DAY);


-- Q54. Find orders placed during the current month.

SELECT *
FROM orders
WHERE YEAR(order_date) = YEAR(CURDATE())
  AND MONTH(order_date) = MONTH(CURDATE());


-- Q55. Find orders placed during the previous month.

SELECT *
FROM orders
WHERE YEAR(order_date) = YEAR(
        DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
      )
  AND MONTH(order_date) = MONTH(
        DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
      );


-- Q56. Find employees who have completed
-- more than 5 years with the company.

SELECT
    employee_id,
    employee_name,
    joining_date
FROM employees
WHERE TIMESTAMPDIFF(
    YEAR,
    joining_date,
    CURDATE()
) > 5;


-- ============================================================
-- CHALLENGE PROBLEMS
-- ============================================================

-- Q57. Find the number of orders placed in each month
-- and calculate the percentage of total orders
-- represented by each month.

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    COUNT(*) AS total_orders,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS order_percentage
FROM orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    order_year,
    order_month;


-- Q58. Find each customer's:
-- first order date,
-- last order date,
-- total number of orders,
-- total revenue.

SELECT
    customer_id,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS latest_order_date,
    COUNT(*) AS total_orders,
    SUM(order_amount) AS total_revenue
FROM orders
GROUP BY customer_id;


-- Q59. Calculate the average number of days
-- between consecutive orders for each customer.

SELECT
    customer_id,
    AVG(
        DATEDIFF(
            order_date,
            previous_order_date
        )
    ) AS average_days_between_orders
FROM (
    SELECT
        customer_id,
        order_date,
        LAG(order_date) OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS previous_order_date
    FROM orders
) AS order_history
WHERE previous_order_date IS NOT NULL
GROUP BY customer_id;


-- Q60. Find customers whose latest order
-- was more than 90 days ago.

SELECT
    customer_id,
    MAX(order_date) AS latest_order_date
FROM orders
GROUP BY customer_id
HAVING MAX(order_date) <
       DATE_SUB(CURDATE(), INTERVAL 90 DAY);


-- Q61. Find the longest delivery time
-- among all orders.

SELECT
    order_id,
    order_date,
    delivery_date,
    DATEDIFF(
        delivery_date,
        order_date
    ) AS delivery_days
FROM orders
ORDER BY delivery_days DESC
LIMIT 1;


-- Q62. Find the top 5 customers based on
-- total revenue during 2026.

SELECT
    customer_id,
    SUM(order_amount) AS total_revenue
FROM orders
WHERE YEAR(order_date) = 2026
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 5;


-- Q63. Find the number of orders placed
-- on weekdays versus weekends.

SELECT
    CASE
        WHEN DAYOFWEEK(order_date) IN (1, 7)
            THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    COUNT(*) AS total_orders
FROM orders
GROUP BY
    CASE
        WHEN DAYOFWEEK(order_date) IN (1, 7)
            THEN 'Weekend'
        ELSE 'Weekday'
    END;


-- Q64. Find the month with the highest
-- average order value.

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    AVG(order_amount) AS average_order_value
FROM orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY average_order_value DESC
LIMIT 1;


-- ============================================================
-- FINAL COMBINED PROBLEM
-- ============================================================

-- Q65.
-- Create a monthly sales report containing:
--
-- 1. Year
-- 2. Month number
-- 3. Month name
-- 4. Number of orders
-- 5. Total revenue
-- 6. Average order value
--
-- Sort chronologically.

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    MONTHNAME(order_date) AS month_name,
    COUNT(*) AS total_orders,
    SUM(order_amount) AS total_revenue,
    AVG(order_amount) AS average_order_value
FROM orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY
    order_year,
    order_month;


-- ============================================================
-- FINAL CHALLENGE
-- ============================================================

-- Q66.
-- For every customer, display:
--
-- customer_id
-- first_order_date
-- latest_order_date
-- total_orders
-- total_revenue
-- days_since_latest_order
--
-- Sort customers by total revenue descending.

SELECT
    customer_id,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS latest_order_date,
    COUNT(*) AS total_orders,
    SUM(order_amount) AS total_revenue,
    DATEDIFF(
        CURDATE(),
        MAX(order_date)
    ) AS days_since_latest_order
FROM orders
GROUP BY customer_id
ORDER BY total_revenue DESC;