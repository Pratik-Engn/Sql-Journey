-- Database: MySQL
-- Day: 04
-- Topic: Aggregations & GROUP BY

-- Total number of employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- Total salary paid
SELECT SUM(salary) AS total_salary
FROM employees;

-- Average salary
SELECT AVG(salary) AS avg_salary
FROM employees;

-- Count employees per department
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- Average salary per department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- Total salary per department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- Combine WHERE + GROUP BY
SELECT department, COUNT(*) AS total_employees
FROM employees
WHERE salary > 40000
GROUP BY department;

-- ORDER BY with GROUP BY
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;