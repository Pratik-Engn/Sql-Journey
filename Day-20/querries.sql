-- ============================================================
-- SQL JOURNEY - DAY 20
-- SQL FUNDAMENTALS REVISION
-- Date: 22-09-2026
-- ============================================================


-- ============================================================
-- 1. SELECT + FROM
-- ============================================================

-- Select all columns
SELECT *
FROM employees;

-- Select specific columns
SELECT employee_id, first_name, department
FROM employees;


-- ============================================================
-- 2. DISTINCT
-- ============================================================

-- Find all unique departments
SELECT DISTINCT department
FROM employees;

-- Find all unique job titles
SELECT DISTINCT job_title
FROM employees;


-- ============================================================
-- 3. WHERE
-- ============================================================

-- Employees earning more than 50000
SELECT *
FROM employees
WHERE salary > 50000;

-- Employees from the Sales department
SELECT *
FROM employees
WHERE department = 'Sales';

-- Employees earning between 40000 and 70000
SELECT *
FROM employees
WHERE salary >= 40000
  AND salary <= 70000;

-- Employees from Sales OR Marketing
SELECT *
FROM employees
WHERE department = 'Sales'
   OR department = 'Marketing';

-- Employees who are not from HR
SELECT *
FROM employees
WHERE department <> 'HR';


-- ============================================================
-- 4. ORDER BY
-- ============================================================

-- Sort employees by salary from lowest to highest
SELECT *
FROM employees
ORDER BY salary ASC;

-- Sort employees by salary from highest to lowest
SELECT *
FROM employees
ORDER BY salary DESC;

-- Sort by department and then salary
SELECT *
FROM employees
ORDER BY department ASC, salary DESC;


-- ============================================================
-- 5. LIMIT
-- ============================================================

-- Get the first 10 employees
SELECT *
FROM employees
LIMIT 10;

-- Get the 5 highest-paid employees
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;


-- ============================================================
-- 6. AGGREGATE FUNCTIONS
-- ============================================================

-- Count total employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- Find total salary
SELECT SUM(salary) AS total_salary
FROM employees;

-- Find average salary
SELECT AVG(salary) AS average_salary
FROM employees;

-- Find minimum salary
SELECT MIN(salary) AS minimum_salary
FROM employees;

-- Find maximum salary
SELECT MAX(salary) AS maximum_salary
FROM employees;


-- ============================================================
-- 7. GROUP BY
-- ============================================================

-- Count employees in each department
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- Find average salary in each department
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- Find maximum salary in each department
SELECT department, MAX(salary) AS maximum_salary
FROM employees
GROUP BY department;


-- ============================================================
-- 8. HAVING
-- ============================================================

-- Departments having more than 5 employees
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;

-- Departments with an average salary greater than 60000
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;


-- ============================================================
-- 9. COMBINING MULTIPLE CLAUSES
-- ============================================================

-- Find departments with more than 5 employees
-- and display them by employee count
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5
ORDER BY employee_count DESC;


-- Find departments where employees earning above 50000
-- are more than 3
SELECT department, COUNT(*) AS high_salary_employees
FROM employees
WHERE salary > 50000
GROUP BY department
HAVING COUNT(*) > 3
ORDER BY high_salary_employees DESC;