-- Day 8: RIGHT JOIN Practice
-- SQL Journey

-- Creating tables
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Inserting sample data
INSERT INTO employees VALUES
(1, 'Rahul', 101),
(2, 'Priya', 102),
(3, 'Arjun', 103),
(4, 'Sneha', NULL);

INSERT INTO departments VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'Engineering'),
(104, 'Marketing');

---------------------------------------------------
-- Query 1: Basic RIGHT JOIN
-- Shows all departments, even if no employee exists
SELECT
    e.emp_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

---------------------------------------------------
-- Query 2: Departments without employees
SELECT
    d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id
WHERE e.emp_id IS NULL;

---------------------------------------------------
-- Query 3: Employee + Department details
SELECT
    e.emp_id,
    e.emp_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

---------------------------------------------------
-- Query 4: RIGHT JOIN with filtering
SELECT
    e.emp_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Marketing';

---------------------------------------------------
-- Query 5: Count employees per department
SELECT
    d.department_name,
    COUNT(e.emp_id) AS employee_count
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;