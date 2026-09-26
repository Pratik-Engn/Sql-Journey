- ============================================================
- SQL JOURNEY - DAY 24
- SQL REVISION - QUESTIONS AND ANSWERS
-- ============================================================


-- ============================================================
- BASIC SQL
-- ============================================================


- Q1. Display all employees.
-- ANSWER:

SELECT *
FROM employees;


- Q2. Display only employee name, department and salary.
-- ANSWER:

SELECT
    first_name,
    department,
    salary
FROM employees;


- Q3. Display all unique departments.
-- ANSWER:

SELECT DISTINCT department
FROM employees;


- Q4. Display employees earning more than 50000.
-- ANSWER:

SELECT *
FROM employees
WHERE salary > 50000;


- Q5. Display the 5 highest-paid employees.
-- ANSWER:

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;


- ============================================================
- AGGREGATE FUNCTIONS
- ============================================================


- Q6. Find the total number of employees.
-- ANSWER:

SELECT COUNT(*) AS total_employees
FROM employees;


-- Q7. Find the average salary.
-- ANSWER:

SELECT AVG(salary) AS average_salary
FROM employees;


-- Q8. Find the highest and lowest salary.
-- ANSWER:

SELECT
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees;


-- Q9. Find the total salary paid to all employees.
-- ANSWER:

SELECT SUM(salary) AS total_salary
FROM employees;


- ============================================================
- GROUP BY AND HAVING
- ============================================================


-- Q10. Find the number of employees in each department.
-- ANSWER:

SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department;


-- Q11. Find the average salary of each department.
-- ANSWER:

SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;


-- Q12. Find departments having more than 5 employees.
-- ANSWER:

SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;


-- Q13. Find departments whose average salary is greater than 60000.
-- ANSWER:

SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;


-- ============================================================
-- FILTERING
-- ============================================================


-- Q14. Find employees from Sales, HR or Marketing.
-- ANSWER:

SELECT *
FROM employees
WHERE department IN ('Sales', 'HR', 'Marketing');


-- Q15. Find employees earning between 40000 and 70000.
-- ANSWER:

SELECT *
FROM employees
WHERE salary BETWEEN 40000 AND 70000;


- Q16. Find employees whose names start with A.
- ANSWER:

SELECT *
FROM employees
WHERE first_name LIKE 'A%';


-- Q17. Find employees whose names end with n.
-- ANSWER:

SELECT *
FROM employees
WHERE first_name LIKE '%n';


-- Q18. Find employees whose phone number is missing.
-- ANSWER:

SELECT *
FROM employees
WHERE phone_number IS NULL;


-- Q19. Find employees whose phone number exists.
-- ANSWER:

SELECT *
FROM employees
WHERE phone_number IS NOT NULL;


-- ============================================================
-- COALESCE
-- ============================================================


-- Q20. Display "Not Available" when phone number is NULL.
-- ANSWER:

SELECT
    first_name,
    COALESCE(phone_number, 'Not Available') AS phone_number
FROM employees;


-- ============================================================
-- CASE
-- ============================================================


-- Q21. Categorize employees by salary:
-- 80000+ = High
-- 50000+ = Medium
-- Otherwise = Low
-- ANSWER:

SELECT
    first_name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;


-- ============================================================
-- ALIASES
-- ============================================================


-- Q22. Display annual salary using an alias.
-- ANSWER:

SELECT
    first_name,
    salary * 12 AS annual_salary
FROM employees;


-- ============================================================
-- STRING FUNCTIONS
-- ============================================================


-- Q23. Convert employee names to uppercase.
-- ANSWER:

SELECT
    UPPER(first_name) AS employee_name
FROM employees;


-- Q24. Convert employee names to lowercase.
-- ANSWER:

SELECT
    LOWER(first_name) AS employee_name
FROM employees;


-- Q25. Find the length of each employee's name.
-- ANSWER:

SELECT
    first_name,
    LENGTH(first_name) AS name_length
FROM employees;


-- Q26. Remove unnecessary spaces from employee names.
-- ANSWER:

SELECT
    TRIM(first_name) AS cleaned_name
FROM employees;


-- Q27. Create a full name using first and last name.
-- ANSWER:

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;


-- Q28. Extract the first three characters of each name.
-- ANSWER:

SELECT
    first_name,
    SUBSTRING(first_name, 1, 3) AS first_three_characters
FROM employees;


-- Q29. Remove hyphens from phone numbers.
-- ANSWER:

SELECT
    REPLACE(phone_number, '-', '') AS cleaned_phone
FROM employees;


-- ============================================================
-- DATE FUNCTIONS
-- ============================================================


-- Q30. Display the current date.
-- ANSWER:

SELECT CURRENT_DATE;


-- Q31. Display the current date and time.
-- ANSWER:

SELECT CURRENT_TIMESTAMP;


-- Q32. Extract the year from joining_date.
-- ANSWER:

SELECT
    joining_date,
    EXTRACT(YEAR FROM joining_date) AS joining_year
FROM employees;


-- Q33. Find employees who joined in 2026.
-- ANSWER:

SELECT *
FROM employees
WHERE EXTRACT(YEAR FROM joining_date) = 2026;


-- Q34. Count employees who joined each year.
-- ANSWER:

SELECT
    EXTRACT(YEAR FROM joining_date) AS joining_year,
    COUNT(*) AS employee_count
FROM employees
GROUP BY EXTRACT(YEAR FROM joining_date)
ORDER BY joining_year;


-- Q35. Convert a timestamp to a date.
-- ANSWER:

SELECT
    CAST(order_timestamp AS DATE) AS order_date
FROM orders;


-- ============================================================
-- SET OPERATORS
-- ============================================================


-- Q36. Combine employees and former employees
-- while removing duplicates.
-- ANSWER:

SELECT employee_name
FROM employees

UNION

SELECT employee_name
FROM former_employees;


-- Q37. Combine employees and former employees
-- while keeping duplicates.
-- ANSWER:

SELECT employee_name
FROM employees

UNION ALL

SELECT employee_name
FROM former_employees;


-- Q38. Find customers who exist in both online and store datasets.
-- ANSWER:

SELECT customer_id
FROM online_customers

INTERSECT

SELECT customer_id
FROM store_customers;


-- Q39. Find customers who have never placed an order.
-- ANSWER:

SELECT customer_id
FROM customers

EXCEPT

SELECT customer_id
FROM orders;


-- ============================================================
-- INNER JOIN
-- ============================================================


-- Q40. Display employee names with their department names.
-- ANSWER:

SELECT
    e.employee_name,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;


-- ============================================================
-- LEFT JOIN
-- ============================================================


-- Q41. Display all employees and their departments,
-- including employees without a department.
-- ANSWER:

SELECT
    e.employee_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id;


-- Q42. Find employees who do not have a matching department.
-- ANSWER:

SELECT
    e.employee_id,
    e.employee_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;


-- ============================================================
-- RIGHT JOIN
-- ============================================================


-- Q43. Display all departments and their employees,
-- including departments without employees.
-- ANSWER:

SELECT
    d.department_name,
    e.employee_name
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id;


-- ============================================================
-- FULL OUTER JOIN
-- ============================================================


-- Q44. Display all employees and all departments,
-- including unmatched records.
-- ANSWER:

SELECT
    e.employee_name,
    d.department_name
FROM employees e
FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;


-- ============================================================
-- SELF JOIN
-- ============================================================


-- Q45. Display each employee and their manager.
-- ANSWER:

SELECT
    e.employee_name AS employee,
    m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id;


-- ============================================================
-- MULTIPLE JOINS
-- ============================================================


-- Q46. Display employee, department and location.
-- ANSWER:

SELECT
    e.employee_name,
    d.department_name,
    l.location_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id;


-- ============================================================
-- COMBINED QUESTIONS
-- ============================================================


-- Q47. Find the average salary for each department,
-- only showing departments with more than 2 employees.
-- Sort by average salary.
-- ANSWER:

SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count,
    AVG(e.salary) AS average_salary
FROM departments d
JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 2
ORDER BY average_salary DESC;


-- Q48. Display cleaned employee names and joining year
-- for employees who joined in 2026.
-- ANSWER:

SELECT
    CONCAT(
        UPPER(TRIM(first_name)),
        ' ',
        UPPER(TRIM(last_name))
    ) AS employee_name,
    EXTRACT(YEAR FROM joining_date) AS joining_year
FROM employees
WHERE EXTRACT(YEAR FROM joining_date) = 2026;


-- Q49. Categorize employees by salary and show
-- the number of employees in each category.
-- ANSWER:

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


-- Q50. Final revision:
-- Display department, employee count, average salary,
-- and highest salary.
-- Include departments with zero employees.
-- Sort by average salary.
-- ANSWER:

SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count,
    AVG(e.salary) AS average_salary,
    MAX(e.salary) AS highest_salary
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY average_salary DESC;
