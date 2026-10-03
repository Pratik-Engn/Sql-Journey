- DAY 31 - WINDOW FUNCTION AGGREGATES

- 1. Total salary
SELECT
    name,
    salary,
    SUM(salary) OVER () AS total_salary
FROM employees;

- 2. Average salary
SELECT
    name,
    salary,
    AVG(salary) OVER () AS average_salary
FROM employees;

- 3. Department total salary
SELECT
    name,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
    ) AS department_total
FROM employees;

- 4. Department average salary
SELECT
    name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS department_average
FROM employees;

- 5. Department employee count
SELECT
    name,
    department,
    COUNT(*) OVER (
        PARTITION BY department
    ) AS department_count
FROM employees;

- 6. Running salary total
SELECT
    name,
    salary,
    SUM(salary) OVER (
        ORDER BY salary
    ) AS running_total
FROM employees;

- 7. Salary compared with department average
SELECT
    name,
    department,
    salary,
    salary - AVG(salary) OVER (
        PARTITION BY department
    ) AS difference_from_average
FROM employees;
