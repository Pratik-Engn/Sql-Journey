-- ============================================================
- SQL JOURNEY - DAY 22
- SET OPERATORS AND JOINS REVISION
-- ============================================================


-- ============================================================
- PART 1: SET OPERATORS
-- ============================================================


-- ------------------------------------------------------------
- 1. UNION
-- ------------------------------------------------------------

SELECT employee_name
FROM employees

UNION

SELECT employee_name
FROM former_employees;


-- ------------------------------------------------------------
- 2. UNION ALL
-- ------------------------------------------------------------

SELECT employee_name
FROM employees

UNION ALL

SELECT employee_name
FROM former_employees;


-- ------------------------------------------------------------
- 3. UNION vs UNION ALL
-- ------------------------------------------------------------

-- UNION removes duplicate rows
SELECT department
FROM employees

UNION

SELECT department
FROM former_employees;


-- UNION ALL keeps duplicate rows
SELECT department
FROM employees

UNION ALL

SELECT department
FROM former_employees;


-- ------------------------------------------------------------
- 4. INTERSECT
-- ------------------------------------------------------------

-- Customers who exist in both datasets
SELECT customer_id
FROM online_customers

INTERSECT

SELECT customer_id
FROM store_customers;


-- ------------------------------------------------------------
- 5. EXCEPT
-- ------------------------------------------------------------

-- Customers who exist in customers
-- but have never placed an order
SELECT customer_id
FROM customers

EXCEPT

SELECT customer_id
FROM orders;


-- Reverse EXCEPT
SELECT customer_id
FROM orders

EXCEPT

SELECT customer_id
FROM customers;


-- ============================================================
- PART 2: INNER JOIN
-- ============================================================


-- ------------------------------------------------------------
- 6. Basic INNER JOIN
-- ------------------------------------------------------------

SELECT
    e.employee_id,
    e.employee_name,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;


-- ------------------------------------------------------------
- 7. INNER JOIN with WHERE
-- ------------------------------------------------------------

SELECT
    e.employee_name,
    d.department_name,
    e.salary
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary > 50000;


-- ------------------------------------------------------------
- 8. INNER JOIN with ORDER BY
-- ------------------------------------------------------------

SELECT
    e.employee_name,
    d.department_name,
    e.salary
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
ORDER BY e.salary DESC;


-- ============================================================
- PART 3: LEFT JOIN
-- ============================================================


-- ------------------------------------------------------------
- 9. Basic LEFT JOIN
-- ------------------------------------------------------------

SELECT
    e.employee_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id;


-- ------------------------------------------------------------
- 10. Find employees without departments
-- ------------------------------------------------------------

SELECT
    e.employee_id,
    e.employee_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;


-- ------------------------------------------------------------
- 11. LEFT JOIN with filtering
-- ------------------------------------------------------------

SELECT
    e.employee_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary > 50000;


-- ============================================================
- PART 4: RIGHT JOIN
-- ============================================================


-- ------------------------------------------------------------
- 12. Basic RIGHT JOIN
-- ------------------------------------------------------------

SELECT
    e.employee_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id;


-- ============================================================
- PART 5: FULL OUTER JOIN
-- ============================================================


-- ------------------------------------------------------------
- 13. FULL OUTER JOIN
-- ------------------------------------------------------------

SELECT
    e.employee_name,
    d.department_name
FROM employees e
FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;


-- ------------------------------------------------------------
- 14. Find unmatched records on either side
-- ------------------------------------------------------------

SELECT
    e.employee_name,
    d.department_name
FROM employees e
FULL OUTER JOIN departments d
    ON e.department_id = d.department_id
WHERE e.employee_id IS NULL
   OR d.department_id IS NULL;


-- ============================================================
- PART 6: CROSS JOIN
-- ============================================================


-- ------------------------------------------------------------
- 15. CROSS JOIN
-- ------------------------------------------------------------

SELECT
    e.employee_name,
    d.department_name
FROM employees e
CROSS JOIN departments d;


-- ============================================================
- PART 7: SELF JOIN
-- ============================================================


-- ------------------------------------------------------------
- 16. Employee and Manager
-- ------------------------------------------------------------

SELECT
    e.employee_name AS employee,
    m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id;


-- ============================================================
- PART 8: MULTIPLE JOINS
-- ============================================================


-- ------------------------------------------------------------
- 17. Joining three tables
-- ------------------------------------------------------------

SELECT
    e.employee_name,
    d.department_name,
    l.location_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id;


-- ============================================================
- PART 9: JOIN + AGGREGATION
-- ============================================================


-- ------------------------------------------------------------
- 18. Employee count by department
-- ------------------------------------------------------------

SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY employee_count DESC;


-- ------------------------------------------------------------
- 19. Average salary by department
-- ------------------------------------------------------------

SELECT
    d.department_name,
    AVG(e.salary) AS average_salary
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY average_salary DESC;


-- ============================================================
- PART 10: MULTIPLE JOIN CONDITIONS
-- ============================================================


-- ------------------------------------------------------------
- 20. JOIN using multiple conditions
-- ------------------------------------------------------------

SELECT *
FROM orders o
JOIN shipments s
    ON o.order_id = s.order_id
   AND o.customer_id = s.customer_id;


-- ============================================================
- PART 11: SET OPERATORS + ORDERING
-- ============================================================


-- ------------------------------------------------------------
- 21. UNION with ORDER BY
-- ------------------------------------------------------------

SELECT employee_name
FROM employees

UNION

SELECT employee_name
FROM former_employees

ORDER BY employee_name;


-- ============================================================
- PART 12: FINAL REVISION QUESTIONS
-- ============================================================


-- 22. Find customers who are in both online and store datasets

SELECT customer_id
FROM online_customers

INTERSECT

SELECT customer_id
FROM store_customers;


- 23. Find customers who have never placed an order

SELECT customer_id
FROM customers

EXCEPT

SELECT customer_id
FROM orders;


- 24. Find every department and its employee count,
-- including departments with zero employees

SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY employee_count DESC;


- 25. Find employees who do not have a valid department

SELECT
    e.employee_id,
    e.employee_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;


- 26. Find employee-manager relationships

SELECT
    e.employee_name AS employee,
    m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id;


- 27. Find departments with average salary above 60000

SELECT
    d.department_name,
    AVG(e.salary) AS average_salary
FROM departments d
INNER JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 60000
ORDER BY average_salary DESC;
