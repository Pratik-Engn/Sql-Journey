

```sql
-- =========================================================
- DAY 26 — SQL QUICK ACTIVITY
-- =========================================================
- Dataset: employees
- MySQL syntax
- Try each question before checking the answer.
- =========================================================
-All the data sets used are from random AI sites for the activity

- =========================================================
- DATASET
- =========================================================

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    status VARCHAR(20)
);

INSERT INTO employees
(employee_id, first_name, last_name, department, city, salary, hire_date, status)
VALUES
(101, 'Aarav', 'Sharma', 'Data', 'Kolkata', 65000, '2022-01-15', 'Active'),
(102, 'Priya', 'Das', 'Finance', 'Mumbai', 72000, '2021-06-20', 'Active'),
(103, 'Rohan', 'Singh', 'Data', 'Delhi', 58000, '2023-03-10', 'Active'),
(104, 'Ananya', 'Roy', 'HR', 'Kolkata', 54000, '2020-11-05', 'Active'),
(105, 'Vikram', 'Mehta', 'IT', 'Pune', 80000, '2019-08-12', 'Active'),
(106, 'Neha', 'Kapoor', 'Finance', 'Delhi', 68000, '2022-09-25', 'On Leave'),
(107, 'Arjun', 'Sen', 'Data', 'Mumbai', 62000, '2024-01-18', 'Active'),
(108, 'Sneha', 'Bose', 'IT', 'Kolkata', 75000, '2021-12-01', 'Active'),
(109, 'Karan', 'Gupta', 'HR', 'Delhi', NULL, '2023-07-14', 'Active'),
(110, 'Meera', 'Nair', 'Finance', 'Pune', 70000, '2020-04-22', 'Active'),
(111, 'Rahul', 'Jain', 'IT', 'Mumbai', 85000, '2018-02-19', 'On Leave'),
(112, 'Ishita', 'Roy', 'Data', 'Kolkata', 60000, '2024-06-03', 'Active');


-- =========================================================
-- SECTION 1 — SELECT & DISTINCT
-- =========================================================

-- Q1. Display all employees.

SELECT *
FROM employees;


-- Q2. Display only employee name, department, and salary.

SELECT
    first_name,
    last_name,
    department,
    salary
FROM employees;


-- Q3. Display all unique departments.

SELECT DISTINCT department
FROM employees;


-- Q4. Display all unique cities.

SELECT DISTINCT city
FROM employees;


-- Q5. Display employee names with an alias employee_name.

SELECT
    CONCAT(first_name, ' ', last_name) AS employee_name
FROM employees;


-- =========================================================
-- SECTION 2 — WHERE & BASIC FILTERING
-- =========================================================

-- Q6. Find employees from the Data department.

SELECT *
FROM employees
WHERE department = 'Data';


-- Q7. Find employees with salary greater than 70000.

SELECT *
FROM employees
WHERE salary > 70000;


-- Q8. Find employees with salary less than or equal to 60000.

SELECT *
FROM employees
WHERE salary <= 60000;


-- Q9. Find employees from Kolkata.

SELECT *
FROM employees
WHERE city = 'Kolkata';


-- Q10. Find employees whose status is Active.

SELECT *
FROM employees
WHERE status = 'Active';


-- Q11. Find employees who are not in the IT department.

SELECT *
FROM employees
WHERE department <> 'IT';


-- Q12. Find employees from Data or Finance.

SELECT *
FROM employees
WHERE department = 'Data'
   OR department = 'Finance';


-- Q13. Find employees from Kolkata and in the Data department.

SELECT *
FROM employees
WHERE city = 'Kolkata'
  AND department = 'Data';


-- Q14. Find employees whose salary is between 60000 and 75000.

SELECT *
FROM employees
WHERE salary BETWEEN 60000 AND 75000;


-- Q15. Find employees whose city is Mumbai or Delhi.

SELECT *
FROM employees
WHERE city IN ('Mumbai', 'Delhi');


-- =========================================================
-- SECTION 3 — IN, BETWEEN & LIKE
-- =========================================================

-- Q16. Find employees in Kolkata, Mumbai, or Delhi.

SELECT *
FROM employees
WHERE city IN ('Kolkata', 'Mumbai', 'Delhi');


-- Q17. Find employees whose salary is between 65000 and 80000.

SELECT *
FROM employees
WHERE salary BETWEEN 65000 AND 80000;


-- Q18. Find employees whose first name starts with A.

SELECT *
FROM employees
WHERE first_name LIKE 'A%';


-- Q19. Find employees whose last name ends with y.

SELECT *
FROM employees
WHERE last_name LIKE '%y';


-- Q20. Find employees whose first name contains a.

SELECT *
FROM employees
WHERE first_name LIKE '%a%';


-- Q21. Find employees whose department is either Data or IT using IN.

SELECT *
FROM employees
WHERE department IN ('Data', 'IT');


-- =========================================================
-- SECTION 4 — NULL HANDLING
-- =========================================================

-- Q22. Find employees whose salary is NULL.

SELECT *
FROM employees
WHERE salary IS NULL;


-- Q23. Find employees whose salary is NOT NULL.

SELECT *
FROM employees
WHERE salary IS NOT NULL;


-- Q24. Display salary as 0 when salary is NULL.

SELECT
    employee_id,
    first_name,
    COALESCE(salary, 0) AS salary
FROM employees;


-- Q25. Create a salary category using CASE.

SELECT
    first_name,
    salary,
    CASE
        WHEN salary IS NULL THEN 'Not Available'
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;


-- =========================================================
-- SECTION 5 — ORDER BY & LIMIT
-- =========================================================

-- Q26. Sort employees by salary from highest to lowest.

SELECT *
FROM employees
ORDER BY salary DESC;


-- Q27. Sort employees by salary from lowest to highest.

SELECT *
FROM employees
ORDER BY salary ASC;


-- Q28. Sort employees alphabetically by last name.

SELECT *
FROM employees
ORDER BY last_name ASC;


-- Q29. Find the top 3 highest-paid employees.

SELECT *
FROM employees
WHERE salary IS NOT NULL
ORDER BY salary DESC
LIMIT 3;


-- Q30. Find the 3 lowest-paid employees with a known salary.

SELECT *
FROM employees
WHERE salary IS NOT NULL
ORDER BY salary ASC
LIMIT 3;


-- =========================================================
-- SECTION 6 — STRING OPERATIONS
-- =========================================================

-- Q31. Display first and last name together as full_name.

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;


-- Q32. Display first names in uppercase.

SELECT
    first_name,
    UPPER(first_name) AS uppercase_name
FROM employees;


-- Q33. Display last names in lowercase.

SELECT
    last_name,
    LOWER(last_name) AS lowercase_name
FROM employees;


-- Q34. Display the length of each employee's first name.

SELECT
    first_name,
    LENGTH(first_name) AS name_length
FROM employees;


-- Q35. Remove leading/trailing spaces from a name using TRIM.

SELECT
    first_name,
    TRIM(first_name) AS trimmed_name
FROM employees;


-- =========================================================
-- SECTION 7 — DATE OPERATIONS
-- =========================================================

-- Q36. Display employee names and their hire year.

SELECT
    CONCAT(first_name, ' ', last_name) AS employee_name,
    YEAR(hire_date) AS hire_year
FROM employees;


-- Q37. Display employee names and their hire month.

SELECT
    CONCAT(first_name, ' ', last_name) AS employee_name,
    MONTH(hire_date) AS hire_month
FROM employees;


-- Q38. Find employees hired after January 1, 2022.

SELECT *
FROM employees
WHERE hire_date > '2022-01-01';


-- Q39. Find employees hired between 2020-01-01 and 2022-12-31.

SELECT *
FROM employees
WHERE hire_date BETWEEN '2020-01-01' AND '2022-12-31';


-- Q40. Display the hire date in DD-MM-YYYY format.

SELECT
    first_name,
    DATE_FORMAT(hire_date, '%d-%m-%Y') AS formatted_hire_date
FROM employees;


-- =========================================================
-- SECTION 8 — AGGREGATION & GROUP BY
-- =========================================================

-- Q41. Count all employees.

SELECT
    COUNT(*) AS total_employees
FROM employees;


-- Q42. Find the average salary.

SELECT
    AVG(salary) AS average_salary
FROM employees;


-- Q43. Find the highest salary.

SELECT
    MAX(salary) AS highest_salary
FROM employees;


-- Q44. Find the lowest salary.

SELECT
    MIN(salary) AS lowest_salary
FROM employees;


-- Q45. Find the total salary.

SELECT
    SUM(salary) AS total_salary
FROM employees;


-- Q46. Count employees in each department.

SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department;


-- Q47. Find the average salary by department.

SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;


-- Q48. Find departments with an average salary greater than 65000.

SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 65000;


-- =========================================================
-- SECTION 9 — COMBINED REVISION
-- =========================================================

-- Q49. Find active Data employees earning more than 60000,
-- ordered by salary descending.

SELECT *
FROM employees
WHERE status = 'Active'
  AND department = 'Data'
  AND salary > 60000
ORDER BY salary DESC;


-- Q50. Find the top 2 highest-paid active employees.

SELECT *
FROM employees
WHERE status = 'Active'
  AND salary IS NOT NULL
ORDER BY salary DESC
LIMIT 2;


-- Q51. Find employees hired in or after 2022,
-- ordered by hire date.

SELECT *
FROM employees
WHERE hire_date >= '2022-01-01'
ORDER BY hire_date ASC;


-- Q52. Find the number of active employees in each city.

SELECT
    city,
    COUNT(*) AS active_employee_count
FROM employees
WHERE status = 'Active'
GROUP BY city;


-- Q53. Find cities having at least 2 active employees.

SELECT
    city,
    COUNT(*) AS active_employee_count
FROM employees
WHERE status = 'Active'
GROUP BY city
HAVING COUNT(*) >= 2;


-- Q54. Display each employee's name, department, salary,
-- and salary category.

SELECT
    CONCAT(first_name, ' ', last_name) AS employee_name,
    department,
    salary,
    CASE
        WHEN salary IS NULL THEN 'Not Available'
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;


-- Q55. Find active employees whose first name contains 'a'
-- and salary is greater than 60000.

SELECT *
FROM employees
WHERE status = 'Active'
  AND first_name LIKE '%a%'
  AND salary > 60000;


-- Q56. Find the average salary of active employees by department,
-- keeping only departments with average salary above 60000.

SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
WHERE status = 'Active'
GROUP BY department
HAVING AVG(salary) > 60000
ORDER BY average_salary DESC;


-- =========================================================
-- FINAL MINI CHALLENGE
-- =========================================================

-- Without looking at the answer first:
--
-- Find the top 3 active employees from Data, Finance, or IT,
-- with a known salary, earning at least 60000,
-- ordered by salary descending.

SELECT
    employee_id,
    CONCAT(first_name, ' ', last_name) AS employee_name,
    department,
    salary
FROM employees
WHERE status = 'Active'
  AND department IN ('Data', 'Finance', 'IT')
  AND salary IS NOT NULL
  AND salary >= 60000
ORDER BY salary DESC
LIMIT 3;
