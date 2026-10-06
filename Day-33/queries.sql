-- DAY 33 - SQL ACTIVITY

SELECT
    e.name,
    d.department_name,
    e.salary
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_name = 'Data'
ORDER BY e.salary DESC
LIMIT 2 OFFSET 1;