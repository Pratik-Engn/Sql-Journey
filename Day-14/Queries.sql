-- DATASETS USED:
-- employees(employee_id, first_name)
-- managers(manager_id, first_name)
-- customers(customer_id, customer_name)
-- premium_customers(customer_id, customer_name)
-- students(student_id, student_name)
-- graduates(student_id, student_name)

-- =========================
-- UNION
-- =========================

-- 1. Combine employees and managers without duplicates
SELECT first_name
FROM employees

UNION

SELECT first_name
FROM managers;

-- 2. Combine customers and premium customers
SELECT customer_name
FROM customers

UNION

SELECT customer_name
FROM premium_customers;

-- =========================
-- UNION ALL
-- =========================

-- 3. Combine employees and managers with duplicates
SELECT first_name
FROM employees

UNION ALL

SELECT first_name
FROM managers;

-- 4. Combine all customer lists including duplicates
SELECT customer_name
FROM customers

UNION ALL

SELECT customer_name
FROM premium_customers;

-- =========================
-- INTERSECT
-- =========================

-- 5. Common names between employees and managers
SELECT first_name
FROM employees

INTERSECT

SELECT first_name
FROM managers;

-- 6. Customers who are also premium customers
SELECT customer_name
FROM customers

INTERSECT

SELECT customer_name
FROM premium_customers;

-- =========================
-- EXCEPT
-- =========================

-- 7. Employees who are not managers
SELECT first_name
FROM employees

EXCEPT

SELECT first_name
FROM managers;

-- 8. Regular customers who are not premium customers
SELECT customer_name
FROM customers

EXCEPT

SELECT customer_name
FROM premium_customers;

-- =========================
-- STUDENT EXAMPLES
-- =========================

-- 9. All students and graduates
SELECT student_name
FROM students

UNION

SELECT student_name
FROM graduates;

-- 10. Students who graduated
SELECT student_name
FROM students

INTERSECT

SELECT student_name
FROM graduates;

-- 11. Students who have not graduated
SELECT student_name
FROM students

EXCEPT

SELECT student_name
FROM graduates;