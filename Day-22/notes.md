# SQL Journey - Day 22
## Set Operators and JOINs Revision

**Date:** 24-09-2026

Today's revision focuses on two important SQL concepts:

1. Set Operators
2. JOINs

These concepts are important when working with multiple datasets and multiple tables.

---

# Part 1 - SET OPERATORS

Set operators combine the results of two or more SELECT queries.

The main set operators are:

- UNION
- UNION ALL
- INTERSECT
- EXCEPT

---

## 1. UNION

`UNION` combines the results of two SELECT queries and removes duplicate rows.

### Syntax

SELECT column1, column2
FROM table1

UNION

SELECT column1, column2
FROM table2;

### Important

Both queries must return:

- The same number of columns
- Compatible data types
- Columns in the corresponding positions

---

## 2. UNION ALL

`UNION ALL` combines the results of two SELECT queries but keeps duplicate rows.

### Syntax

SELECT column1
FROM table1

UNION ALL

SELECT column1
FROM table2;

### UNION vs UNION ALL

UNION:
- Removes duplicates
- May require additional processing

UNION ALL:
- Keeps duplicates
- Generally requires less processing

Use `UNION ALL` when duplicate rows are meaningful or when duplicate removal is not required.

---

## 3. INTERSECT

`INTERSECT` returns rows that exist in both query results.

Example:

SELECT customer_id
FROM online_customers

INTERSECT

SELECT customer_id
FROM store_customers;

This returns customers who exist in both datasets.

---

## 4. EXCEPT

`EXCEPT` returns rows from the first query that do not exist in the second query.

Example:

SELECT customer_id
FROM customers

EXCEPT

SELECT customer_id
FROM orders;

This can be used to find customers who have never placed an order.

### Important

The order of the queries matters.

A EXCEPT B is not necessarily the same as B EXCEPT A.

---

## 5. Set Operator Rules

For set operators:

- The number of columns must match.
- Corresponding columns should have compatible data types.
- The order of columns matters.
- Column names in the final result generally come from the first SELECT statement.

Example:

SELECT employee_id, employee_name
FROM employees

UNION

SELECT customer_id, customer_name
FROM customers;

The first column of both queries represents an ID and the second represents a name.

---

# Part 2 - JOINS

JOINs are used to combine rows from multiple tables using a related column or condition.

Example:

Employees:

employee_id
employee_name
department_id

Departments:

department_id
department_name

The common column is:

department_id

---

# 6. INNER JOIN

`INNER JOIN` returns only rows where a matching record exists in both tables.

### Syntax

SELECT columns
FROM table1
INNER JOIN table2
    ON table1.key = table2.key;

Example:

SELECT
    e.employee_name,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;

Only employees with a matching department are returned.

---

# 7. LEFT JOIN

`LEFT JOIN` returns:

- All rows from the left table
- Matching rows from the right table

If there is no match, columns from the right table contain NULL.

### Syntax

SELECT columns
FROM table1
LEFT JOIN table2
    ON table1.key = table2.key;

Example:

SELECT
    e.employee_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id;

This is useful when we want to keep every employee, even if their department does not have a matching record.

---

# 8. RIGHT JOIN

`RIGHT JOIN` returns:

- All rows from the right table
- Matching rows from the left table

If there is no match, columns from the left table contain NULL.

Example:

SELECT
    e.employee_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id;

RIGHT JOIN can often be rewritten as a LEFT JOIN by changing the table order.

---

# 9. FULL OUTER JOIN

`FULL OUTER JOIN` returns:

- Matching rows
- Unmatched rows from the left table
- Unmatched rows from the right table

Unmatched columns are represented by NULL.

Example:

SELECT
    e.employee_name,
    d.department_name
FROM employees e
FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;

This provides the complete picture from both tables.

Note:
Not every SQL database supports FULL OUTER JOIN directly.

---

# 10. CROSS JOIN

`CROSS JOIN` produces a Cartesian product.

Every row from the first table is combined with every row from the second table.

If:

Table A has 5 rows

Table B has 4 rows

The result contains:

5 × 4 = 20 rows

Example:

SELECT
    e.employee_name,
    d.department_name
FROM employees e
CROSS JOIN departments d;

CROSS JOIN should be used carefully because the result can become very large.

---

# 11. SELF JOIN

A SELF JOIN is when a table is joined with itself.

It is useful when records within the same table have relationships with each other.

Example:

An employees table may contain:

employee_id
employee_name
manager_id

The manager is also an employee.

Example:

SELECT
    e.employee_name AS employee,
    m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id;

Here:

`e` represents the employee.

`m` represents the manager.

Both aliases refer to the same table.

---

# 12. Multiple JOINs

A query can join more than two tables.

Example:

SELECT
    e.employee_name,
    d.department_name,
    l.location_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id;

The result combines information from three tables.

---

# 13. JOIN Using Multiple Conditions

Sometimes a single column is not enough to uniquely identify a relationship.

Multiple conditions can be used.

Example:

SELECT *
FROM table_a a
JOIN table_b b
    ON a.customer_id = b.customer_id
   AND a.order_date = b.order_date;

Both conditions must be satisfied.

---

# 14. ON vs WHERE

`ON` defines how tables are related during a JOIN.

Example:

SELECT *
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;

`WHERE` filters the resulting rows.

Example:

SELECT *
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary > 50000;

---

# 15. Important LEFT JOIN Concept

Consider:

SELECT *
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_name = 'Sales';

The WHERE condition removes rows where the department is NULL.

Therefore, this can effectively change the result from preserving unmatched employees to returning only employees with a matching Sales department.

This is an important concept when working with LEFT JOIN.

---

# 16. Finding Unmatched Records

LEFT JOIN can be used to find records that do not have a match.

Example:

SELECT
    e.employee_id,
    e.employee_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

This returns employees who do not have a matching department.

---

# 17. JOIN Duplicates

JOINs can produce duplicate-looking rows when one record matches multiple records in the other table.

Example:

One customer can have many orders.

Joining customers with orders may therefore return the same customer multiple times.

This is not necessarily an error.

It depends on the relationship between the tables.

Before joining tables, understand whether the relationship is:

- One-to-one
- One-to-many
- Many-to-many

---

# 18. SET OPERATORS vs JOINs

SET OPERATORS combine results vertically.

Example:

Table A results
+
Table B results

JOINs combine columns horizontally based on a relationship.

Example:

Table A columns
+
Table B columns

### Set Operators

UNION
UNION ALL
INTERSECT
EXCEPT

### JOINs

INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN
CROSS JOIN
SELF JOIN

---

# SQL JOIN Mental Model

INNER JOIN:
Only matching records.

LEFT JOIN:
Everything from left + matches from right.

RIGHT JOIN:
Everything from right + matches from left.

FULL OUTER JOIN:
Everything from both sides.

CROSS JOIN:
Every possible combination.

SELF JOIN:
A table joined with itself.

---

# Day 22 Goal

By the end of this revision, I should be able to:

- Combine query results using SET operators.
- Understand UNION vs UNION ALL.
- Find common records using INTERSECT.
- Find missing records using EXCEPT.
- Understand INNER JOIN.
- Understand LEFT JOIN.
- Understand RIGHT JOIN.
- Understand FULL OUTER JOIN.
- Understand CROSS JOIN.
- Use SELF JOIN.
- Join multiple tables.
- Use multiple JOIN conditions.
- Understand ON vs WHERE.
- Find unmatched records.
- Identify duplicate rows caused by relationships.

Day 23 will continue with new SQL concepts.