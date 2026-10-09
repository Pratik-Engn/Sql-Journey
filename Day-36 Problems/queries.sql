-- ============================================
-- Problems Day 2
-- SQL Solutions — Questions 13 to 24
-- SQLite / MySQL-compatible syntax where possible
-- ============================================


-- Question 13 — Count Users Registered per Contest

SELECT
    contest_id,
    COUNT(DISTINCT user_id) AS total_users
FROM Register
GROUP BY contest_id
ORDER BY contest_id ASC;


-- Question 14 — Was First Order Delivered On Time

WITH FirstOrders AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order
    FROM Delivery
    GROUP BY customer_id
)
SELECT
    d.customer_id,
    CASE
        WHEN d.order_date = d.customer_pref_delivery_date
        THEN 'Yes'
        ELSE 'No'
    END AS delivered_on_time
FROM Delivery d
JOIN FirstOrders f
    ON d.customer_id = f.customer_id
   AND d.order_date = f.first_order
ORDER BY d.customer_id ASC;


-- Question 15 — Category Employees by Salary

SELECT
    id,
    CASE
        WHEN salary < 4000 THEN 'Low'
        WHEN salary <= 7000 THEN 'Medium'
        ELSE 'High'
    END AS category
FROM Employee;


-- Question 16 — Queries Quality and Percentage

SELECT
    u.user_id,
    u.user_name,
    ROUND(
        100.0 * SUM(
            CASE WHEN q.score >= 60 THEN 1 ELSE 0 END
        ) / COUNT(q.query_id),
        2
    ) AS quality_percentage
FROM Users u
JOIN Queries q
    ON u.user_id = q.user_id
GROUP BY u.user_id, u.user_name
ORDER BY u.user_id ASC;


-- Question 17 — Students and Examinations

SELECT
    s.student_id,
    s.student_name,
    sub.subject_id,
    sub.subject_name,
    COUNT(e.subject_id) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
    ON s.student_id = e.student_id
   AND sub.subject_id = e.subject_id
GROUP BY
    s.student_id,
    s.student_name,
    sub.subject_id,
    sub.subject_name
ORDER BY
    s.student_id ASC,
    sub.subject_id ASC;


-- Question 18 — Managers with at Least 5 Direct Reports

SELECT m.name
FROM Employee m
JOIN Employee e
    ON m.id = e.managerId
GROUP BY m.id, m.name
HAVING COUNT(e.id) >= 5;


-- Question 19 — Percentage of Users Attended a Contest

SELECT
    r.contest_id,
    ROUND(
        100.0 * COUNT(DISTINCT r.user_id)
        / (SELECT COUNT(*) FROM Users),
        2
    ) AS percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC;


-- Question 20 — Immediate Food Delivery II

WITH FirstOrders AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order
    FROM Delivery
    GROUP BY customer_id
)
SELECT
    ROUND(
        100.0 * SUM(
            CASE
                WHEN d.order_date = d.customer_pref_delivery_date
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS immediate_percentage
FROM Delivery d
JOIN FirstOrders f
    ON d.customer_id = f.customer_id
   AND d.order_date = f.first_order;


-- Question 21 — Classes With at Least 5 Students

SELECT class
FROM Classes
GROUP BY class
HAVING COUNT(DISTINCT student_id) >= 5
ORDER BY class ASC;


-- Question 22 — Product Sales Analysis III

SELECT
    product_id,
    store_id,
    price
FROM Sales s
WHERE price = (
    SELECT MAX(s2.price)
    FROM Sales s2
    WHERE s2.product_id = s.product_id
)
ORDER BY product_id ASC, store_id ASC;


-- Question 23 — Find Followers Count

WITH AllUsers AS (
    SELECT user_id FROM Followers
    UNION
    SELECT follower_id AS user_id FROM Followers
)
SELECT
    a.user_id,
    COUNT(f.user_id) AS follower_count
FROM AllUsers a
LEFT JOIN Followers f
    ON a.user_id = f.user_id
GROUP BY a.user_id
ORDER BY a.user_id ASC;


-- Question 24 — Count Salary Categories

SELECT 'High' AS category, COUNT(*) AS employee_count
FROM Employee
WHERE salary > 7000

UNION ALL

SELECT 'Low' AS category, COUNT(*) AS employee_count
FROM Employee
WHERE salary < 4000

UNION ALL

SELECT 'Medium' AS category, COUNT(*) AS employee_count
FROM Employee
WHERE salary >= 4000 AND salary <= 7000

ORDER BY
    CASE category
        WHEN 'High' THEN 1
        WHEN 'Low' THEN 2
        WHEN 'Medium' THEN 3
    END;
