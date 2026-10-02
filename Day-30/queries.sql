- DAY 30 - SQL 30-DAY REVISION
-In this revison all the topic that we have used in last 30 days
-- 1. SELECT
SELECT name, department, salary
FROM employees;

-- 2. DISTINCT
SELECT DISTINCT department
FROM employees;

-- 3. WHERE
SELECT *
FROM employees
WHERE salary > 60000;

-- 4. AND / OR / NOT
SELECT *
FROM employees
WHERE salary > 60000
  AND department = 'Data';

SELECT *
FROM employees
WHERE department = 'Data'
   OR department = 'IT';

SELECT *
FROM employees
WHERE NOT department = 'HR';

-- 5. IN
SELECT *
FROM employees
WHERE department IN ('Data', 'IT');

-- 6. BETWEEN
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 80000;

-- 7. LIKE
SELECT *
FROM employees
WHERE name LIKE 'A%';

-- 8. ORDER BY
SELECT *
FROM employees
ORDER BY salary DESC;

-- 9. LIMIT
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- 10. Aggregate Functions
SELECT
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM employees;

-- 11. GROUP BY
SELECT
    department,
    COUNT(*) AS employee_count,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- 12. HAVING
SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- 13. NULL
SELECT *
FROM employees
WHERE salary IS NULL;

-- 14. IS NOT NULL
SELECT *
FROM employees
WHERE salary IS NOT NULL;

-- 15. IFNULL
SELECT
    name,
    IFNULL(salary, 0) AS salary
FROM employees;

-- 16. COALESCE
SELECT
    name,
    COALESCE(phone, email, 'No Contact') AS contact
FROM employees;

-- 17. NULLIF
SELECT
    name,
    NULLIF(salary, 0) AS salary
FROM employees;

-- 18. COUNT(*) vs COUNT(column)
SELECT
    COUNT(*) AS total_rows,
    COUNT(salary) AS employees_with_salary
FROM employees;

-- 19. CASE
SELECT
    name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;

-- 20. CASE with NULL
SELECT
    name,
    salary,
    CASE
        WHEN salary IS NULL THEN 'Missing'
        WHEN salary >= 70000 THEN 'High'
        ELSE 'Normal'
    END AS salary_status
FROM employees;

-- 21. String Functions
SELECT
    name,
    UPPER(name) AS upper_name,
    LOWER(name) AS lower_name,
    LENGTH(name) AS name_length
FROM employees;

-- 22. CONCAT
SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

-- 23. Date Functions
SELECT
    name,
    hire_date,
    YEAR(hire_date) AS hire_year,
    MONTH(hire_date) AS hire_month,
    MONTHNAME(hire_date) AS hire_month_name
FROM employees;

-- 24. DATEDIFF
SELECT
    name,
    hire_date,
    DATEDIFF(CURDATE(), hire_date) AS days_worked
FROM employees;

-- 25. TIMESTAMPDIFF
SELECT
    name,
    hire_date,
    TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_worked
FROM employees;

-- 26. DATE_ADD
SELECT
    name,
    hire_date,
    DATE_ADD(hire_date, INTERVAL 1 YEAR) AS next_anniversary
FROM employees;

-- 27. CAST
SELECT
    name,
    CAST(salary AS DECIMAL(10,2)) AS converted_salary
FROM employees;

-- 28. INNER JOIN
SELECT
    e.name,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;

-- 29. LEFT JOIN
SELECT
    e.name,
    d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id;

-- 30. UNION
SELECT name
FROM employees
WHERE department = 'Data'
UNION
SELECT name
FROM employees
WHERE department = 'IT';

-- 31. UNION ALL
SELECT name
FROM employees
WHERE department = 'Data'
UNION ALL
SELECT name
FROM employees
WHERE department = 'IT';

-- 32. ROW_NUMBER()
SELECT
    name,
    salary,
    ROW_NUMBER() OVER (
        ORDER BY salary DESC
    ) AS row_number
FROM employees;

-- 33. RANK()
SELECT
    name,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;

-- 34. DENSE_RANK()
SELECT
    name,
    salary,
    DENSE_RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;

-- 35. PARTITION BY
SELECT
    name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS department_average
FROM employees;

-- 36. LAG()
SELECT
    name,
    salary,
    LAG(salary) OVER (
        ORDER BY salary
    ) AS previous_salary
FROM employees;

-- 37. LEAD()
SELECT
    name,
    salary,
    LEAD(salary) OVER (
        ORDER BY salary
    ) AS next_salary
FROM employees;

-- 38. Running Total
SELECT
    name,
    salary,
    SUM(salary) OVER (
        ORDER BY salary
    ) AS running_total
FROM employees;

-- 39. Department Running Total
SELECT
    name,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
        ORDER BY salary
    ) AS department_running_total
FROM employees;

-- 40. Window Function + CASE
SELECT
    name,
    department,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_rank
FROM employees;

-- 41. Salary vs Department Average
SELECT
    name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS department_average,
    salary - AVG(salary) OVER (
        PARTITION BY department
    ) AS difference_from_average
FROM employees;
