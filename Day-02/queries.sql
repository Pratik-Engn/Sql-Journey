-- Database: MySQL
-- Day: 02
-- Topic: WHERE and ORDER BY

-- Basic WHERE filtering
SELECT name, salary
FROM employees
WHERE salary > 50000;

-- Multiple conditions
SELECT name, department
FROM employees
WHERE department = 'Sales' AND salary > 40000;

-- ORDER BY ascending
SELECT name, salary
FROM employees
ORDER BY salary ASC;

-- ORDER BY descending
SELECT name, salary
FROM employees
ORDER BY salary DESC;

-- WHERE + ORDER BY combined
SELECT name, salary
FROM employees
WHERE salary > 40000
ORDER BY salary DESC;