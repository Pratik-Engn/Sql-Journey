-- Database: MySQL
-- Day: 03
-- Topic: LIMIT and OFFSET

-- Top 5 highest salaries
SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- Skip first 5 records, get next 5
SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5 OFFSET 5;

-- DISTINCT + LIMIT
SELECT DISTINCT department
FROM employees
LIMIT 3;

-- WHERE + ORDER BY + LIMIT
SELECT name, salary
FROM employees
WHERE salary > 40000
ORDER BY salary DESC
LIMIT 3;