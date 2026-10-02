# Day 30 - SQL 30-Day Revision

Today is a complete revision of the SQL concepts learned so far, from basic SQL to Window Functions.

## 1. SELECT

Used to retrieve data.

```sql
SELECT name, salary
FROM employees;
```

## 2. DISTINCT

Removes duplicate values.

```sql
SELECT DISTINCT department
FROM employees;
```

## 3. WHERE

Filters rows.

```sql
SELECT *
FROM employees
WHERE salary > 60000;
```

Common operators:

`=`, `!=`, `>`, `<`, `>=`, `<=`, `AND`, `OR`, `NOT`, `IN`, `BETWEEN`, `LIKE`

## 4. ORDER BY

Sorts results.

```sql
SELECT *
FROM employees
ORDER BY salary DESC;
```

## 5. LIMIT

Limits the number of rows.

```sql
SELECT *
FROM employees
LIMIT 5;
```

## 6. Aggregate Functions

Common aggregate functions:

- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()

```sql
SELECT
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary
FROM employees;
```

## 7. GROUP BY

Groups rows for aggregate calculations.

```sql
SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;
```

## 8. HAVING

Filters grouped results.

```sql
SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;
```

## 9. SQL Execution Order

FROM
→ WHERE
→ GROUP BY
→ HAVING
→ SELECT
→ ORDER BY
→ LIMIT

## 10. Aliases

Used to give temporary names to columns or tables.

```sql
SELECT salary AS employee_salary
FROM employees;
```

## 11. NULL

NULL represents a missing or unknown value.

Use:

```sql
IS NULL
IS NOT NULL
```

Do not use:

```sql
= NULL
```

Useful functions:

`IFNULL()`, `COALESCE()`, `NULLIF()`

## 12. CASE

Used for conditional logic.

```sql
SELECT
    name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;
```

## 13. String Functions

Important functions:

`UPPER()`, `LOWER()`, `CONCAT()`, `LENGTH()`, `TRIM()`, `SUBSTRING()`

## 14. Date Functions

Important functions:

`CURDATE()`, `NOW()`, `YEAR()`, `MONTH()`, `DAY()`, `MONTHNAME()`, `DAYNAME()`, `DATE_FORMAT()`, `DATE_ADD()`, `DATE_SUB()`, `DATEDIFF()`, `TIMESTAMPDIFF()`, `LAST_DAY()`

## 15. CAST

Converts a value to another data type.

```sql
SELECT CAST(salary AS DECIMAL(10,2))
FROM employees;
```

## 16. JOINs

Used to combine data from multiple tables.

Main types:

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- CROSS JOIN

```sql
SELECT
    e.name,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;
```

## 17. Set Operators

Used to combine query results.

- UNION
- UNION ALL
- INTERSECT
- EXCEPT

UNION removes duplicates.

UNION ALL keeps duplicates.

## 18. Window Functions

Window Functions perform calculations across related rows while keeping individual rows.

Basic syntax:

```sql
FUNCTION() OVER (
    PARTITION BY column
    ORDER BY column
)
```

Important functions:

- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LAG()
- LEAD()
- SUM() OVER()
- AVG() OVER()
- COUNT() OVER()

Example:

```sql
SELECT
    name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;
```

GROUP BY reduces rows.

Window Functions keep individual rows.

## SQL Journey So Far

SELECT
→ WHERE
→ DISTINCT
→ ORDER BY
→ LIMIT
→ Aggregate Functions
→ GROUP BY
→ HAVING
→ NULL
→ CASE
→ String Functions
→ Date Functions
→ CAST
→ JOINs
→ Set Operators
→ Window Functions

Day 30 is a complete revision checkpoint for the first phase of the SQL journey.
 
