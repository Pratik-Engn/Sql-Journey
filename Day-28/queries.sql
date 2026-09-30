
-- =========================================================
-- DAY 28 — SQL CASE STATEMENT
-- =========================================================
-- MySQL
-- Try each question yourself before checking the answer.
-- =========================================================


-- =========================================================
-- DATASET
-- =========================================================

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10,2),
    experience_years INT,
    status VARCHAR(20)
);

INSERT INTO employees
(employee_id, name, department, city, salary, experience_years, status)
VALUES
(101, 'Aarav', 'Data', 'Kolkata', 65000, 3, 'Active'),
(102, 'Priya', 'Finance', 'Mumbai', 72000, 5, 'Active'),
(103, 'Rohan', 'Data', 'Delhi', 58000, 2, 'Active'),
(104, 'Ananya', 'HR', 'Kolkata', 54000, 4, 'Active'),
(105, 'Vikram', 'IT', 'Pune', 80000, 7, 'Active'),
(106, 'Neha', 'Finance', 'Delhi', 68000, 4, 'On Leave'),
(107, 'Arjun', 'Data', 'Mumbai', 62000, 3, 'Active'),
(108, 'Sneha', 'IT', 'Kolkata', 75000, 6, 'Active'),
(109, 'Karan', 'HR', 'Delhi', NULL, 2, 'Active'),
(110, 'Meera', 'Finance', 'Pune', 70000, 8, 'Active'),
(111, 'Rahul', 'IT', 'Mumbai', 85000, 10, 'On Leave'),
(112, 'Ishita', 'Data', 'Kolkata', 60000, 1, 'Active');


-- =========================================================
-- SECTION 1 — BASIC CASE
-- =========================================================

-- Q1. Classify employees based on salary:
-- 80000 or above ? High
-- 60000 or above ? Medium
-- Otherwise ? Low

SELECT
    name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;


-- Q2. Classify employees as:
-- Active ? Working
-- On Leave ? Not Working

SELECT
    name,
    status,
    CASE
        WHEN status = 'Active' THEN 'Working'
        WHEN status = 'On Leave' THEN 'Not Working'
        ELSE 'Unknown'
    END AS work_status
FROM employees;


-- Q3. Handle NULL salary separately.

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


-- =========================================================
-- SECTION 2 — CASE WITH AND / OR / IN
-- =========================================================

-- Q4. Classify employees as Technical or Non-Technical.
-- Data and IT ? Technical

SELECT
    name,
    department,
    CASE
        WHEN department IN ('Data', 'IT') THEN 'Technical'
        ELSE 'Non-Technical'
    END AS department_type
FROM employees;


-- Q5. Find employees who are both:
-- Active AND earning at least 70000.
-- Display 'Eligible' otherwise 'Not Eligible'.

SELECT
    name,
    salary,
    status,
    CASE
        WHEN status = 'Active' AND salary >= 70000
            THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS eligibility
FROM employees;


-- Q6. Classify employees from Data or IT
-- who earn at least 70000 as 'High Technical'.

SELECT
    name,
    department,
    salary,
    CASE
        WHEN department IN ('Data', 'IT')
             AND salary >= 70000
            THEN 'High Technical'
        ELSE 'Other'
    END AS category
FROM employees;


-- =========================================================
-- SECTION 3 — EXPERIENCE CATEGORIES
-- =========================================================

-- Q7. Categorize employees based on experience:
-- 8+ years ? Expert
-- 5+ years ? Experienced
-- 2+ years ? Intermediate
-- Otherwise ? Beginner

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


-- Q8. Create a simple experience label:
-- 5+ years ? Senior
-- Otherwise ? Junior

SELECT
    name,
    experience_years,
    CASE
        WHEN experience_years >= 5 THEN 'Senior'
        ELSE 'Junior'
    END AS level
FROM employees;


-- =========================================================
-- SECTION 4 — SIMPLE CASE
-- =========================================================

-- Q9. Use SIMPLE CASE to classify departments.

SELECT
    name,
    department,
    CASE department
        WHEN 'Data' THEN 'Data Team'
        WHEN 'IT' THEN 'Technology Team'
        WHEN 'Finance' THEN 'Finance Team'
        WHEN 'HR' THEN 'People Team'
        ELSE 'Other Team'
    END AS team
FROM employees;


-- Q10. Use SIMPLE CASE to classify status.

SELECT
    name,
    status,
    CASE status
        WHEN 'Active' THEN 'Currently Working'
        WHEN 'On Leave' THEN 'Currently Away'
        ELSE 'Unknown'
    END AS status_description
FROM employees;


-- =========================================================
-- SECTION 5 — CASE WITH NULL
-- =========================================================

-- Q11. Display salary status:
-- NULL ? Missing
-- Otherwise ? Available

SELECT
    name,
    salary,
    CASE
        WHEN salary IS NULL THEN 'Missing'
        ELSE 'Available'
    END AS salary_status
FROM employees;


-- Q12. Replace NULL salary with 0 using CASE.

SELECT
    name,
    salary,
    CASE
        WHEN salary IS NULL THEN 0
        ELSE salary
    END AS adjusted_salary
FROM employees;


-- =========================================================
-- SECTION 6 — CASE WITH ORDER BY
-- =========================================================

-- Q13. Sort employees in this custom order:
-- Data ? IT ? Finance ? HR

SELECT
    name,
    department
FROM employees
ORDER BY
    CASE
        WHEN department = 'Data' THEN 1
        WHEN department = 'IT' THEN 2
        WHEN department = 'Finance' THEN 3
        WHEN department = 'HR' THEN 4
        ELSE 5
    END;


-- Q14. Sort employees by salary category:
-- High ? Medium ? Low ? Missing

SELECT
    name,
    salary,
    CASE
        WHEN salary IS NULL THEN 'Missing'
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees
ORDER BY
    CASE
        WHEN salary >= 80000 THEN 1
        WHEN salary >= 60000 THEN 2
        WHEN salary IS NULL THEN 4
        ELSE 3
    END;


-- =========================================================
-- SECTION 7 — CASE WITH AGGREGATION
-- =========================================================

-- Q15. Count employees earning 70000 or more.

SELECT
    SUM(
        CASE
            WHEN salary >= 70000 THEN 1
            ELSE 0
        END
    ) AS high_salary_employees
FROM employees;


-- Q16. Count active employees using CASE.

SELECT
    SUM(
        CASE
            WHEN status = 'Active' THEN 1
            ELSE 0
        END
    ) AS active_employees
FROM employees;


-- Q17. Count employees in Data department.

SELECT
    SUM(
        CASE
            WHEN department = 'Data' THEN 1
            ELSE 0
        END
    ) AS data_employees
FROM employees;


-- Q18. Calculate total salary of Data employees.

SELECT
    SUM(
        CASE
            WHEN department = 'Data'
            THEN salary
            ELSE 0
        END
    ) AS data_total_salary
FROM employees;


-- =========================================================
-- SECTION 8 — CASE WITH GROUP BY
-- =========================================================

-- Q19. Group employees into salary categories
-- and count employees in each category.

SELECT
    CASE
        WHEN salary IS NULL THEN 'Missing'
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category,
    COUNT(*) AS employee_count
FROM employees
GROUP BY
    CASE
        WHEN salary IS NULL THEN 'Missing'
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END;


-- Q20. Find the number of employees in each
-- experience category.

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


-- =========================================================
-- SECTION 9 — COMBINED CASE PROBLEMS
-- =========================================================

-- Q21. Create an employee classification:
--
-- Active + salary >= 70000 ? High Performer
-- Active + salary < 70000 ? Regular
-- On Leave ? On Leave
-- NULL salary ? Salary Unknown

SELECT
    name,
    salary,
    status,
    CASE
        WHEN salary IS NULL THEN 'Salary Unknown'
        WHEN status = 'On Leave' THEN 'On Leave'
        WHEN status = 'Active' AND salary >= 70000
            THEN 'High Performer'
        WHEN status = 'Active' AND salary < 70000
            THEN 'Regular'
        ELSE 'Other'
    END AS employee_classification
FROM employees;


-- Q22. Classify employees based on both
-- department and experience.
--
-- Data + 3 or more years ? Experienced Data
-- IT + 5 or more years ? Experienced IT
-- Otherwise ? Other

SELECT
    name,
    department,
    experience_years,
    CASE
        WHEN department = 'Data'
             AND experience_years >= 3
            THEN 'Experienced Data'
        WHEN department = 'IT'
             AND experience_years >= 5
            THEN 'Experienced IT'
        ELSE 'Other'
    END AS classification
FROM employees;


-- Q23. Calculate salary band and sort from
-- highest band to lowest band.

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


-- =========================================================
-- FINAL CHALLENGE
-- =========================================================

-- Q24. Create a complete employee analysis.
--
-- Display:
-- 1. Employee name
-- 2. Department
-- 3. Salary
-- 4. Experience
-- 5. Salary category
-- 6. Experience category
-- 7. Overall classification
--
-- Rules:
--
-- Salary:
-- NULL ? Missing
-- >= 80000 ? High
-- >= 60000 ? Medium
-- Otherwise ? Low
--
-- Experience:
-- >= 8 ? Expert
-- >= 5 ? Experienced
-- >= 2 ? Intermediate
-- Otherwise ? Beginner
--
-- Overall:
-- Active + salary >= 70000 + experience >= 5
-- ? High Value Employee
--
-- Active + salary >= 60000
-- ? Standard Employee
--
-- On Leave
-- ? On Leave
--
-- Otherwise
-- ? Review

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