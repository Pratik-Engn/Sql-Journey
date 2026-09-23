# SQL Journey - Day 21
## SQL Fundamentals Revision - Part 2

**Date:** 23-09-2026

Today is the second revision day after returning to SQL following a break.

Day 20 covered the basic SQL query structure:

SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT

Day 21 focuses on other important SQL fundamentals that are frequently used when working with real-world datasets.

The objective is to refresh these concepts before continuing with the SQL journey.

--

# 1. Column Aliases

Aliases are temporary names given to columns or tables to make query results easier to understand.

## Syntax

SELECT column_name AS new_name
FROM table_name;

The `AS` keyword is commonly used for aliases.

Example:

SELECT first_name AS employee_name
FROM employees;

Aliases are particularly useful when working with calculated columns.

Example:

SELECT salary * 12 AS annual_salary
FROM employees;

--

# 2. IN

`IN` is used when we want to check whether a value belongs to a list of values.

Instead of writing:

WHERE department = 'Sales'
   OR department = 'Marketing'
   OR department = 'HR'

We can write:

WHERE department IN ('Sales', 'Marketing', 'HR');

---

# 3. BETWEEN

`BETWEEN` is used to filter values within a range.

Example:

SELECT *
FROM employees
WHERE salary BETWEEN 40000 AND 70000;

`BETWEEN` generally includes both boundary values.

---

# 4. LIKE

`LIKE` is used for pattern matching.

Common wildcards:

`%` → represents zero or more characters

`_` → represents exactly one character

Examples:

Names starting with A:

WHERE first_name LIKE 'A%';

Names ending with n:

WHERE first_name LIKE '%n';

Names containing "an":

WHERE first_name LIKE '%an%';

---

# 5. NULL

`NULL` represents a missing or unknown value.

NULL is not the same as:

- 0
- an empty string
- FALSE

We should not use:

WHERE column_name = NULL;

Instead, use:

WHERE column_name IS NULL;

To find values that are not NULL:

WHERE column_name IS NOT NULL;

---

# 6. COALESCE

`COALESCE()` returns the first non-NULL value from the supplied arguments.

Example:

SELECT
    first_name,
    COALESCE(phone_number, 'Not Available') AS phone
FROM employees;

This is useful when we want to replace missing values with a meaningful default.

---

# 7. CASE WHEN

`CASE` is used to apply conditional logic inside SQL queries.

Basic syntax:

CASE
    WHEN condition THEN result
    WHEN condition THEN result
    ELSE result
END

Example:

SELECT
    employee_name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;

CASE can be used inside SELECT statements and can also be used with aggregation and ordering.

---

# 8. String Functions

String functions are used to manipulate text values.

Common functions include:

- UPPER()
- LOWER()
- LENGTH()
- TRIM()
- CONCAT()
- SUBSTRING()

Examples:

UPPER(first_name)

LOWER(first_name)

TRIM(first_name)

LENGTH(first_name)

CONCAT(first_name, ' ', last_name)

---

# 9. Date Functions

Date functions are used to work with dates and timestamps.

Common operations include:

- Extracting year
- Extracting month
- Extracting day
- Adding or subtracting dates
- Calculating differences between dates

Examples may vary depending on the SQL database being used.

Example:

SELECT EXTRACT(YEAR FROM order_date)
FROM orders;

---

# 10. CAST

`CAST()` is used to convert a value from one data type to another.

Syntax:

CAST(expression AS data_type)

Example:

SELECT CAST(price AS INTEGER)
FROM products;

Another example:

SELECT CAST(order_date AS DATE)
FROM orders;

CAST is useful when the stored data type is not suitable for the operation we want to perform.

---

# 11. JOIN Fundamentals

A JOIN is used to combine information from multiple tables using a related column.

Example tables:

employees
departments

If both tables contain department_id, they can be connected using that column.

Example:

SELECT
    e.employee_name,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;

Common JOIN types:

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN

### INNER JOIN

Returns rows that have matching values in both tables.

### LEFT JOIN

Returns all rows from the left table and matching rows from the right table.

JOINs are extremely important for data analysis because real-world databases usually contain information across multiple related tables.

---

# 12. Combining Concepts

SQL becomes powerful when multiple clauses and functions are combined.

Example:

SELECT
    department,
    COUNT(*) AS employee_count,
    AVG(salary) AS average_salary
FROM employees
WHERE salary BETWEEN 40000 AND 100000
GROUP BY department
HAVING COUNT(*) > 2
ORDER BY average_salary DESC;

This combines:

- SELECT
- Aggregate functions
- FROM
- WHERE
- BETWEEN
- GROUP BY
- HAVING
- ORDER BY
- Aliases

---

# Important Revision Points

## WHERE vs HAVING

WHERE:
Filters individual rows before grouping.

HAVING:
Filters groups after GROUP BY.

---

## NULL vs 0

NULL means the value is missing or unknown.

0 is an actual numeric value.

They should not be treated as the same thing.

---

## IN vs OR

These are often equivalent:

WHERE department = 'Sales'
OR department = 'HR';

and:

WHERE department IN ('Sales', 'HR');

---

## WHERE with NULL

Incorrect:

WHERE phone_number = NULL;

Correct:

WHERE phone_number IS NULL;

---

## LIKE

`%` = zero or more characters

`_` = one character

---

## CAST

CAST changes the data type of an expression.

Example:

CAST(value AS INTEGER)

---

# SQL Query Structure Revision

A common query structure is:

SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT

Conceptual execution order:

FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
LIMIT

---

# Goal for Day 21

Today's objective is revision rather than learning new advanced concepts.

I want to be comfortable with:

- Filtering data
- Handling NULL values
- Pattern matching
- Conditional logic
- String manipulation
- Date manipulation
- Data type conversion
- Aliases
- Basic JOINs
- Combining multiple SQL clauses

After completing Day 21, the SQL journey will continue with new concepts from Day 22 onward.
