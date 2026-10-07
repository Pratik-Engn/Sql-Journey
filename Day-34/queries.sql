-- ============================================
- SQL SUBQUERIES
-- ============================================


- 1. Employees earning more than the average salary

SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


- 2. Employee with the highest salary

SELECT employee_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


- 3. Employee with the lowest salary

SELECT employee_name, salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);


- 4. Employees earning less than the average salary

SELECT employee_name, salary
FROM employees
WHERE salary < (
    SELECT AVG(salary)
    FROM employees
);


- 5. Employees in departments located in New York

SELECT employee_name, department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'New York'
);


- 6. Employees not in departments located in New York

SELECT employee_name, department_id
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE location = 'New York'
);


- 7. Employees who have placed at least one order

SELECT employee_name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.employee_id = e.employee_id
);


-- 8. Employees who have not placed any order

SELECT employee_name
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.employee_id = e.employee_id
);


-- 9. Show every employee with the overall average salary

SELECT
    employee_name,
    salary,
    (SELECT AVG(salary) FROM employees) AS average_salary
FROM employees;


-- 10. Employees earning more than the overall average

SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


-- 11. Subquery inside FROM

SELECT *
FROM (
    SELECT employee_name, salary
    FROM employees
    WHERE salary > 50000
) AS high_salary_employees;


-- 12. Second highest salary

SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);


-- 13. Employees earning the second highest salary

SELECT employee_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);


-- 14. Employees earning more than their department average

SELECT employee_name, department_id, salary
FROM employees e
WHERE salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


-- 15. Departments whose average salary is greater than 60000

SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 60000;


-- 16. Department with the highest average salary

SELECT department_id
FROM employees
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1;


-- 17. Employees in the department with the highest average salary

SELECT employee_name, department_id, salary
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1
);


-- 18. Employees who have another employee with the same salary

SELECT employee_name, salary
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employees e2
    WHERE e2.salary = e.salary
      AND e2.employee_id <> e.employee_id
);


-- 19. Salary greater than every salary in department 10

SELECT employee_name, salary
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE department_id = 10
);


-- 20. Salary greater than at least one salary in department 10

SELECT employee_name, salary
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE department_id = 10
);


-- 21. Customers who have placed orders

SELECT customer_id, first_name, last_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);


-- 22. Customers who have not placed orders

SELECT customer_id, first_name, last_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);


-- 23. Orders greater than the average order amount

SELECT order_id, customer_id, amount
FROM orders
WHERE amount > (
    SELECT AVG(amount)
    FROM orders
);


-- 24. Highest order amount

SELECT *
FROM orders
WHERE amount = (
    SELECT MAX(amount)
    FROM orders
);


-- 25. Count employees earning above average

SELECT COUNT(*) AS employees_above_average
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


-- 26. Highest salary in each department

SELECT employee_name, department_id, salary
FROM employees e
WHERE salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


-- 27. Correlated subquery:
-- Employees earning above their department average

SELECT employee_name, department_id, salary
FROM employees e
WHERE salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


-- 28. Total salary and average salary

SELECT
    SUM(salary) AS total_salary,
    (SELECT AVG(salary) FROM employees) AS average_salary
FROM employees;


-- 29. Customers whose total spending is greater
-- than the average order amount

SELECT customer_id, first_name, last_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING SUM(amount) > (
        SELECT AVG(amount)
        FROM orders
    )
);


-- 30. Customers with at least one order

SELECT customer_id, first_name, last_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
