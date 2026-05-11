-- DAY 5: HAVING + DISTINCT
---------------------------------------------------
-- DISTINCT
---------------------------------------------------

-- 1. Get unique department names
SELECT DISTINCT department
FROM employees;

-- 2. Get unique city names
SELECT DISTINCT city
FROM employees;

-- 3. Get unique combinations of city and department
SELECT DISTINCT city, department
FROM employees;

---------------------------------------------------
-- HAVING
---------------------------------------------------

-- 4. Find departments having more than 5 employees
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;

-- 5. Find cities where average salary is greater than 50000
SELECT city, AVG(salary) AS avg_salary
FROM employees
GROUP BY city
HAVING AVG(salary) > 50000;

-- 6. Find departments where total salary payout exceeds 300000
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 300000;

---------------------------------------------------
-- WHERE + HAVING Combined
---------------------------------------------------

-- 7. Employees hired after 2020, grouped by department,
-- showing only departments with more than 3 employees
SELECT department, COUNT(*) AS employee_count
FROM employees
WHERE hire_date > '2020-01-01'
GROUP BY department
HAVING COUNT(*) > 3;