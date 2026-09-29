
-- =========================================================
-- DAY 27 — SQL NULL FUNCTIONS
-- =========================================================
-- MySQL
-- Try solving each question before checking the answer.
-- =========================================================


-- =========================================================
-- DATASET
-- =========================================================

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    phone VARCHAR(20),
    email VARCHAR(100),
    manager_id INT
);

INSERT INTO employees
(employee_id, first_name, last_name, department, salary, bonus, phone, email, manager_id)
VALUES
(101, 'Aarav', 'Sharma', 'Data', 65000, 5000, '9876543210', 'aarav@example.com', 105),
(102, 'Priya', 'Das', 'Finance', 72000, NULL, NULL, 'priya@example.com', 110),
(103, 'Rohan', 'Singh', 'Data', NULL, 3000, '9876501234', NULL, 101),
(104, 'Ananya', 'Roy', 'HR', 54000, NULL, NULL, NULL, 105),
(105, 'Vikram', 'Mehta', 'IT', 80000, 10000, '9876512345', 'vikram@example.com', NULL),
(106, 'Neha', 'Kapoor', 'Finance', 68000, NULL, '9876523456', NULL, 110),
(107, 'Arjun', 'Sen', 'Data', 62000, 4000, NULL, 'arjun@example.com', 101),
(108, 'Sneha', 'Bose', 'IT', 75000, NULL, '9876534567', 'sneha@example.com', 105),
(109, 'Karan', 'Gupta', 'HR', NULL, NULL, NULL, NULL, 105),
(110, 'Meera', 'Nair', 'Finance', 70000, 5000, '9876545678', 'meera@example.com', NULL);


-- =========================================================
-- Q1. Find employees whose salary is NULL.
-- =========================================================

SELECT *
FROM employees
WHERE salary IS NULL;


-- =========================================================
-- Q2. Find employees whose salary is NOT NULL.
-- =========================================================

SELECT *
FROM employees
WHERE salary IS NOT NULL;


-- =========================================================
-- Q3. Find employees whose phone number is NULL.
-- =========================================================

SELECT *
FROM employees
WHERE phone IS NULL;


-- =========================================================
-- Q4. Find employees whose email is NULL.
-- =========================================================

SELECT *
FROM employees
WHERE email IS NULL;


-- =========================================================
-- Q5. Display NULL salaries as 0 using IFNULL().
-- =========================================================

SELECT
    first_name,
    IFNULL(salary, 0) AS salary
FROM employees;


-- =========================================================
-- Q6. Display NULL bonuses as 0 using COALESCE().
-- =========================================================

SELECT
    first_name,
    COALESCE(bonus, 0) AS bonus
FROM employees;


-- =========================================================
-- Q7. Display a contact number.
-- Use phone if available, otherwise display 'No Phone'.
-- =========================================================

SELECT
    first_name,
    COALESCE(phone, 'No Phone') AS contact_number
FROM employees;


-- =========================================================
-- Q8. Display the first available contact method.
-- Priority:
-- phone ? email ? 'No Contact'
-- =========================================================

SELECT
    first_name,
    COALESCE(phone, email, 'No Contact') AS contact
FROM employees;


-- =========================================================
-- Q9. Display salary plus bonus.
-- Treat NULL bonus as 0.
-- =========================================================

SELECT
    first_name,
    salary,
    COALESCE(bonus, 0) AS bonus,
    salary + COALESCE(bonus, 0) AS total_compensation
FROM employees;


-- =========================================================
-- Q10. Count total employees and employees
-- who have a known salary.
-- =========================================================

SELECT
    COUNT(*) AS total_employees,
    COUNT(salary) AS employees_with_salary
FROM employees;


-- =========================================================
-- Q11. Find the average salary.
-- Understand how AVG handles NULL.
-- =========================================================

SELECT
    AVG(salary) AS average_salary
FROM employees;


-- =========================================================
-- Q12. Find the average salary after treating NULL
-- salaries as 0.
-- =========================================================

SELECT
    AVG(COALESCE(salary, 0)) AS average_salary_with_zero
FROM employees;


-- =========================================================
-- Q13. Create a salary status using CASE.
--
-- NULL ? Salary Missing
-- >= 75000 ? High
-- >= 60000 ? Medium
-- Otherwise ? Low
-- =========================================================

SELECT
    first_name,
    salary,
    CASE
        WHEN salary IS NULL THEN 'Salary Missing'
        WHEN salary >= 75000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_status
FROM employees;


-- =========================================================
-- Q14. Use NULLIF() to convert a salary of 0 into NULL.
-- =========================================================

SELECT
    first_name,
    NULLIF(salary, 0) AS adjusted_salary
FROM employees;


-- =========================================================
-- Q15. Use NULLIF() to safely divide bonus by salary.
-- =========================================================

SELECT
    first_name,
    bonus,
    salary,
    bonus / NULLIF(salary, 0) AS bonus_ratio
FROM employees;


-- =========================================================
-- Q16. Display employee names.
-- If the last name is NULL, replace it with 'Unknown'.
-- =========================================================

SELECT
    CONCAT(
        first_name,
        ' ',
        COALESCE(last_name, 'Unknown')
    ) AS employee_name
FROM employees;


-- =========================================================
-- Q17. FINAL CHALLENGE
--
-- Display:
-- employee name
-- department
-- salary
-- bonus
-- total compensation
-- salary status
-- contact
--
-- Rules:
-- 1. NULL salary ? 0 for total calculation
-- 2. NULL bonus ? 0
-- 3. Salary NULL ? 'Salary Missing'
-- 4. Salary >= 75000 ? 'High'
-- 5. Salary >= 60000 ? 'Medium'
-- 6. Otherwise ? 'Low'
-- 7. Contact priority:
--    phone ? email ? 'No Contact'
-- =========================================================

SELECT
    CONCAT(first_name, ' ', last_name) AS employee_name,
    department,
    salary,
    COALESCE(bonus, 0) AS bonus,

    COALESCE(salary, 0) + COALESCE(bonus, 0)
        AS total_compensation,

    CASE
        WHEN salary IS NULL THEN 'Salary Missing'
        WHEN salary >= 75000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_status,

    COALESCE(phone, email, 'No Contact') AS contact

FROM employees;