# Day 32 - SQL Constraints

Today we studied SQL Constraints and how they control the data that can be stored in a table.

Constraints are rules applied to columns to maintain data accuracy and integrity.

## Main Constraints

### 1. NOT NULL

Prevents a column from storing NULL values.

```sql
name VARCHAR(50) NOT NULL
```

### 2. PRIMARY KEY

Uniquely identifies every row.

A Primary Key:
- Must be unique
- Cannot contain NULL
- A table can have only one Primary Key
- Can contain one or multiple columns

```sql
employee_id INT PRIMARY KEY
```

### 3. FOREIGN KEY

Creates a relationship between two tables.

It references a Primary Key or a suitable unique key in another table.

```sql
department_id INT,
FOREIGN KEY (department_id)
REFERENCES departments(department_id)
```

### 4. UNIQUE

Prevents duplicate values.

```sql
email VARCHAR(100) UNIQUE
```

Unlike a Primary Key, a table can have multiple UNIQUE constraints.

### 5. DEFAULT

Provides a value automatically when no value is supplied.

```sql
status VARCHAR(20) DEFAULT 'Active'
```

### 6. CHECK

Ensures that a condition is satisfied.

```sql
salary DECIMAL(10,2) CHECK (salary >= 0)
```

## Example Table

```sql
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL UNIQUE
);
```

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) CHECK (salary >= 0),
    status VARCHAR(20) DEFAULT 'Active',
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);
```

## Constraint Summary

```text
NOT NULL  → prevents NULL
PRIMARY KEY → uniquely identifies a row
FOREIGN KEY → creates relationship between tables
UNIQUE → prevents duplicate values
DEFAULT → provides a default value
CHECK → validates a condition
```

## Important Difference

```text
PRIMARY KEY
→ Unique + NOT NULL
→ One primary key per table

UNIQUE
→ Prevents duplicate values
→ Multiple UNIQUE constraints are allowed

FOREIGN KEY
→ Maintains relationship between tables
→ Values normally reference a key in another table
```

## Constraint Naming

Constraints can be given names:

```sql
CONSTRAINT pk_employee
PRIMARY KEY (employee_id)
```

Naming constraints makes them easier to identify and manage later.

## Composite Primary Key

A Primary Key can contain multiple columns.

```sql
PRIMARY KEY (student_id, course_id)
```

This is useful when the combination of two columns must be unique.

## Goal of Constraints

Constraints help maintain:

- Data integrity
- Accuracy
- Consistency
- Valid relationships
- Prevention of invalid data