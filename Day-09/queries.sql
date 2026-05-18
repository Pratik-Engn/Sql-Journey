-- ============================================
-- SQL JOURNEY DAY 9 : UNION
-- ============================================

USE company_db;

-- ============================================
-- TABLE 1
-- ============================================

CREATE TABLE current_employees (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO current_employees VALUES
(1, 'John', 'IT', 50000),
(2, 'Sarah', 'HR', 45000),
(3, 'Mike', 'Finance', 55000),
(4, 'David', 'IT', 60000);

-- ============================================
-- TABLE 2
-- ============================================

CREATE TABLE former_employees (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO former_employees VALUES
(3, 'Mike', 'Finance', 55000),
(5, 'Emma', 'Sales', 40000),
(6, 'Chris', 'Marketing', 48000),
(7, 'Ryan', 'IT', 52000);

-- ============================================
-- 1. Basic UNION
-- ============================================

SELECT * FROM current_employees
UNION
SELECT * FROM former_employees;

-- ============================================
-- 2. UNION ALL
-- ============================================

SELECT * FROM current_employees
UNION ALL
SELECT * FROM former_employees;

-- ============================================
-- 3. UNION with selected columns
-- ============================================

SELECT name, department
FROM current_employees

UNION

SELECT name, department
FROM former_employees;

-- ============================================
-- 4. UNION ALL with selected columns
-- ============================================

SELECT name, department
FROM current_employees

UNION ALL

SELECT name, department
FROM former_employees;

-- ============================================
-- 5. UNION with WHERE condition
-- ============================================

SELECT name, department
FROM current_employees
WHERE department = 'IT'

UNION

SELECT name, department
FROM former_employees
WHERE department = 'Sales';

-- ============================================
-- 6. UNION ALL with WHERE
-- ============================================

SELECT name, salary
FROM current_employees
WHERE salary > 50000

UNION ALL

SELECT name, salary
FROM former_employees
WHERE salary > 45000;

-- ============================================
-- 7. UNION with ORDER BY
-- ============================================

SELECT name
FROM current_employees

UNION

SELECT name
FROM former_employees
ORDER BY name;

-- ============================================
-- 8. UNION ALL with labels
-- ============================================

SELECT name, 'Current Employee' AS employee_status
FROM current_employees

UNION ALL

SELECT name, 'Former Employee' AS employee_status
FROM former_employees;

-- ============================================
-- 9. UNION of salaries only
-- ============================================

SELECT salary
FROM current_employees

UNION

SELECT salary
FROM former_employees;

-- ============================================
-- 10. UNION ALL of salaries
-- ============================================

SELECT salary
FROM current_employees

UNION ALL

SELECT salary
FROM former_employees;

-- ============================================
-- 11. Combining customer and supplier names
-- ============================================

CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50)
);

CREATE TABLE suppliers (
    supplier_id INT,
    supplier_name VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Rohan'),
(2, 'Amit'),
(3, 'Sneha');

INSERT INTO suppliers VALUES
(1, 'Vikas'),
(2, 'Neha'),
(3, 'Amit');

SELECT customer_name
FROM customers

UNION

SELECT supplier_name
FROM suppliers;

-- ============================================
-- 12. UNION ALL customer and supplier names
-- ============================================

SELECT customer_name
FROM customers

UNION ALL

SELECT supplier_name
FROM suppliers;

-- ============================================
-- 13. Multi-table UNION
-- ============================================

CREATE TABLE interns (
    intern_id INT,
    intern_name VARCHAR(50)
);

INSERT INTO interns VALUES
(1, 'Kabir'),
(2, 'Amit');

SELECT name
FROM current_employees

UNION

SELECT customer_name
FROM customers

UNION

SELECT intern_name
FROM interns;

-- ============================================
-- 14. UNION with aliases
-- ============================================

SELECT name AS person_name
FROM current_employees

UNION

SELECT customer_name
FROM customers;

-- ============================================
-- 15. Practice query
-- ============================================

SELECT name
FROM current_employees
WHERE department = 'IT'

UNION ALL

SELECT name
FROM former_employees
WHERE department = 'IT';