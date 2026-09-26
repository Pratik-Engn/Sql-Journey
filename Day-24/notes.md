# SQL Journey - Day 24
## SQL Revision - Questions and Answers (question are from AI )

**Date:** 26-09-2026

After completing the SQL revision from Day 20 to Day 23, today's session is focused on testing my understanding through practical questions.

The purpose is to solve SQL problems without immediately looking at the answer.

---

## Topics Covered

### SQL Fundamentals
- SELECT
- FROM
- DISTINCT
- WHERE
- ORDER BY
- LIMIT
- Aggregate Functions
- GROUP BY
- HAVING
- Aliases

### Filtering
- IN
- BETWEEN
- LIKE
- AND
- OR
- NOT
- NULL
- IS NULL
- IS NOT NULL
- COALESCE

### Conditional Logic
- CASE WHEN

### String Functions
- UPPER()
- LOWER()
- LENGTH()
- TRIM()
- LTRIM()
- RTRIM()
- CONCAT()
- SUBSTRING()
- REPLACE()

### Date Functions
- CURRENT_DATE
- CURRENT_TIMESTAMP
- EXTRACT()
- CAST()
- Date filtering
- Date difference
- Date grouping

### Set Operators
- UNION
- UNION ALL
- INTERSECT
- EXCEPT

### JOINs
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- CROSS JOIN
- SELF JOIN
- Multiple JOINs
- Multiple JOIN conditions

---

# Important Concepts to Remember

## WHERE vs HAVING

WHERE filters rows before grouping.

HAVING filters groups after GROUP BY.

---

## UNION vs UNION ALL

UNION removes duplicate rows.

UNION ALL keeps duplicate rows.

---

## INNER JOIN vs LEFT JOIN

INNER JOIN returns matching records from both tables.

LEFT JOIN returns all records from the left table and matching records from the right table.

---

## NULL

NULL represents a missing or unknown value.

Correct:

IS NULL

IS NOT NULL

Incorrect:

= NULL

---

## LIKE

`%` represents zero or more characters.

`_` represents exactly one character.

---

## CASE

CASE allows conditional logic inside SQL.

Example:

CASE
    WHEN salary >= 80000 THEN 'High'
    WHEN salary >= 50000 THEN 'Medium'
    ELSE 'Low'
END

---

## SQL Query Execution Order

Conceptually:

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
7. LIMIT

---

# Today's Goal

The goal is to solve the questions first without looking at the answers.

After attempting the questions, compare the solution and understand why the query works.

The focus is understanding SQL logic rather than memorizing queries.

From the next SQL session onward, the journey will move into new topics.
