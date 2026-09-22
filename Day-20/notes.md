# SQL Journey - Day 20
## SQL Fundamentals Revision

**Date:** 22-09-2026

After taking a break from SQL for around two and a half months, I am restarting my SQL journey with a revision of the core SQL fundamentals.

The objective of today's session is to refresh the basic query structure and the most commonly used SQL clauses before continuing with advanced topics.

---

## 1. SELECT and FROM

`SELECT` is used to specify the columns we want to retrieve.

`FROM` specifies the table from which the data is retrieved.

### Basic Syntax

SELECT column1, column2
FROM table_name;

### Selecting all columns

SELECT *
FROM table_name;

---

## 2. DISTINCT

`DISTINCT` is used to return only unique values and remove duplicate rows from the result.

### Syntax

SELECT DISTINCT column_name
FROM table_name;

---

## 3. WHERE

`WHERE` is used to filter rows based on a condition.

### Common operators

- `=` Equal to
- `<>` / `!=` Not equal to
- `>` Greater than
- `<` Less than
- `>=` Greater than or equal to
- `<=` Less than or equal to

### Logical operators

- `AND`
- `OR`
- `NOT`

---

## 4. ORDER BY and LIMIT

### ORDER BY

`ORDER BY` is used to sort the result.

- `ASC` → Ascending order
- `DESC` → Descending order

### Syntax

SELECT *
FROM table_name
ORDER BY column_name DESC;

### LIMIT

`LIMIT` restricts the number of rows returned.

Example:

SELECT *
FROM employees
LIMIT 10;

---

## 5. Aggregate Functions and GROUP BY

Aggregate functions perform calculations on multiple rows.

Common aggregate functions:

- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`

`GROUP BY` groups rows having the same value so that aggregate functions can be applied to each group.

### Example

SELECT department, COUNT(*)
FROM employees
GROUP BY department;

---

## 6. HAVING

`HAVING` is used to filter groups after `GROUP BY`.

The major difference between `WHERE` and `HAVING` is:

- `WHERE` filters individual rows before grouping.
- `HAVING` filters groups after grouping.

### Example

SELECT department, COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;

---

## Important SQL Query Order

Although SQL is written in this order:

SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT

The conceptual execution order is approximately:

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
7. LIMIT

This is important to understand because it explains why `WHERE` and `HAVING` are used differently.

---

## Today's Goal

The purpose of this revision is not to learn new SQL concepts.

The goal is to regain fluency with the basic SQL query structure.

After completing this revision, I will continue the SQL journey from the next topic rather than restarting the entire course.