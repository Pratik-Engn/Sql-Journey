-- ============================================
-- Problems Day 1
-- SQL Solutions — Questions 1 to 12
-- ============================================


-- Question 1 — Find Customer Referee

SELECT name
FROM Customer
WHERE referee_id <> 2
   OR referee_id IS NULL;


-- Question 2 — Big Countries

SELECT name, population, area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;


-- Question 3 — Article Views I

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id ASC;


-- Question 4 — Invalid Tweets

SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;


-- Question 5 — Product Sales Analysis I

SELECT p.product_name, s.year, s.price
FROM Sales s
JOIN Product p
    ON s.product_id = p.product_id;


-- Question 6 — Customer Who Visited but Did Not Make Any Transactions

SELECT DISTINCT v.customer_id
FROM Visits v
LEFT JOIN Transactions t
    ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL;


-- Question 7 — Number of Unique Subjects Taught by Each Teacher

SELECT teacher_id,
       COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;


-- Question 8 — Count Exams Written by Each Student

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
    s.student_id,
    sub.subject_id;


-- Question 9 — Managers With at Least One Report

SELECT m.name
FROM Employee m
JOIN Employee e
    ON m.id = e.managerId
GROUP BY m.id, m.name
HAVING COUNT(e.id) >= 1;


-- Question 10 — Employee Bonus

SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b
    ON e.empId = b.empId
WHERE b.bonus < 1000
   OR b.bonus IS NULL
ORDER BY e.empId;


-- Question 11 — Average Selling Price

SELECT
    u.product_id,
    ROUND(
        1.0 * SUM(p.price * u.units) / SUM(u.units),
        2
    ) AS average_price
FROM UnitsSold u
JOIN Prices p
    ON u.product_id = p.product_id
   AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY u.product_id;


-- Question 12 — Immediate Food Delivery II

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
WHERE (d.customer_id, d.order_date) IN (
    SELECT customer_id, MIN(order_date)
    FROM Delivery
    GROUP BY customer_id
);