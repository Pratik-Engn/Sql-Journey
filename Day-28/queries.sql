
-- =========================================================
- DAY 28 — SQL CASE STATEMENT
-- =========================================================
-- MySQL
SELECT
    name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;


SELECT
    name,
    department,
    CASE
        WHEN department = 'Data' THEN 'Technical'
        WHEN department = 'IT' THEN 'Technical'
        ELSE 'Non-Technical'
    END AS department_type
FROM employees;


SELECT
    name,
    status,
    CASE
        WHEN status = 'Active' THEN 'Working'
        WHEN status = 'On Leave' THEN 'Not Working'
        ELSE 'Unknown'
    END AS work_status
FROM employees;


SELECT
    name,
    experience_years,
    CASE
        WHEN experience_years >= 8 THEN 'Expert'
        WHEN experience_years >= 5 THEN 'Experienced'
        WHEN experience_years >= 2 THEN 'Intermediate'
        ELSE 'Beginner'
    END AS experience_category
FROM employees;


SELECT
    name,
    salary,
    CASE
        WHEN salary IS NULL THEN 'Missing'
        WHEN salary >= 70000 THEN 'High'
        ELSE 'Normal'
    END AS salary_status
FROM employees;


SELECT
    name,
    department,
    salary,
    CASE
        WHEN department IN ('Data', 'IT') AND salary >= 70000
            THEN 'High Technical'
        WHEN department IN ('Data', 'IT')
            THEN 'Technical'
        ELSE 'Non-Technical'
    END AS employee_category
FROM employees;


SELECT
    name,
    department,
    CASE department
        WHEN 'Data' THEN 'Data Team'
        WHEN 'IT' THEN 'Technology Team'
        WHEN 'Finance' THEN 'Finance Team'
        WHEN 'HR' THEN 'People Team'
        ELSE 'Other'
    END AS team
FROM employees;


SELECT
    name,
    salary,
    CASE
        WHEN salary IS NULL THEN 'Salary Missing'
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;


SELECT
    SUM(
        CASE
            WHEN salary >= 70000 THEN 1
            ELSE 0
        END
    ) AS high_salary_employees
FROM employees;


SELECT
    SUM(
        CASE
            WHEN status = 'Active' THEN 1
            ELSE 0
        END
    ) AS active_employees
FROM employees;


SELECT
    SUM(
        CASE
            WHEN department = 'Data' THEN 1
            ELSE 0
        END
    ) AS data_employees
FROM employees;


SELECT
    SUM(
        CASE
            WHEN department = 'Data'
            THEN salary
            ELSE 0
        END
    ) AS data_total_salary
FROM employees;


SELECT
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category,
    COUNT(*) AS employee_count
FROM employees
GROUP BY
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END;


SELECT
    CASE
        WHEN experience_years >= 8 THEN 'Expert'
        WHEN experience_years >= 5 THEN 'Experienced'
        WHEN experience_years >= 2 THEN 'Intermediate'
        ELSE 'Beginner'
    END AS experience_category,
    COUNT(*) AS employee_count
FROM employees
GROUP BY
    CASE
        WHEN experience_years >= 8 THEN 'Expert'
        WHEN experience_years >= 5 THEN 'Experienced'
        WHEN experience_years >= 2 THEN 'Intermediate'
        ELSE 'Beginner'
    END;


SELECT
    name,
    salary,
    CASE
        WHEN salary IS NULL THEN 'Unknown'
        WHEN salary >= 80000 THEN 'A'
        WHEN salary >= 70000 THEN 'B'
        WHEN salary >= 60000 THEN 'C'
        ELSE 'D'
    END AS salary_band
FROM employees
ORDER BY
    CASE
        WHEN salary >= 80000 THEN 1
        WHEN salary >= 70000 THEN 2
        WHEN salary >= 60000 THEN 3
        WHEN salary IS NULL THEN 5
        ELSE 4
    END;


SELECT
    name,
    department,
    salary,
    experience_years,
    CASE
        WHEN salary IS NULL THEN 'Missing'
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category,
    CASE
        WHEN experience_years >= 8 THEN 'Expert'
        WHEN experience_years >= 5 THEN 'Experienced'
        WHEN experience_years >= 2 THEN 'Intermediate'
        ELSE 'Beginner'
    END AS experience_category,
    CASE
        WHEN status = 'On Leave' THEN 'On Leave'
        WHEN status = 'Active'
             AND salary >= 70000
             AND experience_years >= 5
            THEN 'High Value Employee'
        WHEN status = 'Active'
             AND salary >= 60000
            THEN 'Standard Employee'
        ELSE 'Review'
    END AS overall_classification
FROM employees;
