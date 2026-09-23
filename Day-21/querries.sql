-- ============================================================
-- SQL JOURNEY - DAY 21
-- SQL FUNDAMENTALS REVISION - PART 2
-- Date: 23-09-2026
-- ============================================================


-- ============================================================
-- 1. ALIASES
-- ============================================================

-- Rename a column
SELECT
    first_name AS employee_name
FROM employees;


-- Calculate annual salary
SELECT
    first_name,
    salary,
    salary * 12 AS annual_salary
FROM employees;


-- Multiple aliases
SELECT
    first_name AS employee_name,
    department AS department_name,
    salary AS monthly_salary
FROM employees;


-- ============================================================
-- 2. IN
-- ============================================================

-- Employees from Sales, Marketing or HR
SELECT *
FROM employees
WHERE department IN ('Sales', 'Marketing', 'HR');


-- Employees from specific job roles
SELECT *
FROM employees
WHERE job_title IN ('Data Analyst', 'Data Scientist', 'Engineer');


-- ============================================================
-- 3. BETWEEN
-- ============================================================

-- Employees earning between 40000 and 70000
SELECT *
FROM employees
WHERE salary BETWEEN 40000 AND 70000;


-- Employees with salaries outside the range
SELECT *
FROM employees
WHERE salary NOT BETWEEN 40000 AND 70000;


-- ============================================================
-- 4. LIKE
-- ============================================================

-- Names starting with A
SELECT *
FROM employees
WHERE first_name LIKE 'A%';


-- Names ending with n
SELECT *
FROM employees
WHERE first_name LIKE '%n';


-- Names containing "an"
SELECT *
FROM employees
WHERE first_name LIKE '%an%';


-- Names with exactly 5 characters
SELECT *
FROM employees
WHERE first_name LIKE '_____';


-- ============================================================
-- 5. NULL
-- ============================================================

-- Employees with missing phone numbers
SELECT *
FROM employees
WHERE phone_number IS NULL;


-- Employees with available phone numbers
SELECT *
FROM employees
WHERE phone_number IS NOT NULL;


-- ============================================================
-- 6. COALESCE
-- ============================================================

-- Replace missing phone numbers
SELECT
    first_name,
    COALESCE(phone_number, 'Not Available') AS phone_number
FROM employees;


-- Replace missing department values
SELECT
    first_name,
    COALESCE(department, 'Unknown') AS department
FROM employees;


-- ============================================================
-- 7. CASE WHEN
-- ============================================================

-- Categorize employees based on salary
SELECT
    first_name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;


-- Categorize employees based on experience
SELECT
    first_name,
    years_of_experience,
    CASE
        WHEN years_of_experience >= 10 THEN 'Senior'
        WHEN years_of_experience >= 5 THEN 'Mid-Level'
        ELSE 'Junior'
    END AS experience_level
FROM employees;


-- ============================================================
-- 8. STRING FUNCTIONS
-- ============================================================

-- Convert names to uppercase
SELECT
    UPPER(first_name) AS uppercase_name
FROM employees;


-- Convert names to lowercase
SELECT
    LOWER(first_name) AS lowercase_name
FROM employees;


-- Find length of employee names
SELECT
    first_name,
    LENGTH(first_name) AS name_length
FROM employees;


-- Remove leading/trailing spaces
SELECT
    TRIM(first_name) AS cleaned_name
FROM employees;


-- Combine first and last name
SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;


-- ============================================================
-- 9. DATE FUNCTIONS
-- ============================================================

-- Extract year from joining date
SELECT
    employee_id,
    joining_date,
    EXTRACT(YEAR FROM joining_date) AS joining_year
FROM employees;


-- Extract month
SELECT
    employee_id,
    joining_date,
    EXTRACT(MONTH FROM joining_date) AS joining_month
FROM employees;


-- Extract day
SELECT
    employee_id,
    joining_date,
    EXTRACT(DAY FROM joining_date) AS joining_day
FROM employees;


-- ============================================================
-- 10. CAST
-- ============================================================

-- Convert salary to integer
SELECT
    CAST(salary AS INTEGER) AS salary_integer
FROM employees;


-- Convert a value to a date
SELECT
    CAST(joining_date AS DATE) AS joining_date
FROM employees;


-- ============================================================
-- 11. BASIC JOIN REVISION
-- ============================================================

-- INNER JOIN
SELECT
    e.employee_name,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;


-- LEFT JOIN
SELECT
    e.employee_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id;


-- ============================================================
-- 12. COMBINING FILTERING + CASE
-- ============================================================

SELECT
    first_name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees
WHERE salary IS NOT NULL
  AND salary BETWEEN 30000 AND 100000
ORDER BY salary DESC;


-- ============================================================
-- 13. COMBINING GROUP BY + CASE
-- ============================================================

SELECT
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category,
    COUNT(*) AS employee_count
FROM employees
GROUP BY
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END
ORDER BY employee_count DESC;


-- ============================================================
-- 14. COMBINING MULTIPLE CONCEPTS
-- ============================================================

SELECT
    department,
    COUNT(*) AS employee_count,
    AVG(salary) AS average_salary,
    MAX(salary) AS maximum_salary
FROM employees
WHERE salary IS NOT NULL
  AND department IS NOT NULL
GROUP BY department
HAVING COUNT(*) > 2
ORDER BY average_salary DESC;


-- ============================================================
-- 15. FINAL REVISION QUERY
-- ============================================================

SELECT
    d.department_name AS department,

    COUNT(e.employee_id) AS employee_count,

    AVG(e.salary) AS average_salary,

    CASE
        WHEN AVG(e.salary) >= 80000 THEN 'High'
        WHEN AVG(e.salary) >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category

FROM employees e

LEFT JOIN departments d
    ON e.department_id = d.department_id

WHERE e.salary IS NOT NULL

GROUP BY d.department_name

HAVING COUNT(e.employee_id) >= 2

ORDER BY average_salary DESC;