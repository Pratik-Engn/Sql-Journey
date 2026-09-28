# Day 26 — SQL Quick Activity: Filtering & Basic Data Operations

##  Objective

Today is a short, practical SQL activity using one small virtual dataset.

The goal is to apply the SQL concepts revised so far without introducing a major new topic.

You will practice:

- `SELECT`
- `DISTINCT`
- `WHERE`
- Comparison operators
- Logical operators: `AND`, `OR`, `NOT`
- `IN`
- `BETWEEN`
- `LIKE`
- `IS NULL`
- `IS NOT NULL`
- `COALESCE`
- `ORDER BY`
- `LIMIT`
- Column aliases using `AS`
- Aggregate functions
- `GROUP BY`
- `HAVING`
- `CASE`
- Basic string functions
- Basic date functions
- `CAST`
- Combining filtering and sorting

---

# 🗃️ Dataset

We will use a small fictional `employees` table.

## Table: `employees`

| employee_id | first_name | last_name | department | city | salary | hire_date | status |
|---:|---|---|---|---|---:|---|---|
| 101 | Aarav | Sharma | Data | Kolkata | 65000 | 2022-01-15 | Active |
| 102 | Priya | Das | Finance | Mumbai | 72000 | 2021-06-20 | Active |
| 103 | Rohan | Singh | Data | Delhi | 58000 | 2023-03-10 | Active |
| 104 | Ananya | Roy | HR | Kolkata | 54000 | 2020-11-05 | Active |
| 105 | Vikram | Mehta | IT | Pune | 80000 | 2019-08-12 | Active |
| 106 | Neha | Kapoor | Finance | Delhi | 68000 | 2022-09-25 | On Leave |
| 107 | Arjun | Sen | Data | Mumbai | 62000 | 2024-01-18 | Active |
| 108 | Sneha | Bose | IT | Kolkata | 75000 | 2021-12-01 | Active |
| 109 | Karan | Gupta | HR | Delhi | NULL | 2023-07-14 | Active |
| 110 | Meera | Nair | Finance | Pune | 70000 | 2020-04-22 | Active |
| 111 | Rahul | Jain | IT | Mumbai | 85000 | 2018-02-19 | On Leave |
| 112 | Ishita | Roy | Data | Kolkata | 60000 | 2024-06-03 | Active |

---

# 🧱 Create the Dataset

Run this first in MySQL:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    status VARCHAR(20)
);

INSERT INTO employees
(employee_id, first_name, last_name, department, city, salary, hire_date, status)
VALUES
(101, 'Aarav', 'Sharma', 'Data', 'Kolkata', 65000, '2022-01-15', 'Active'),
(102, 'Priya', 'Das', 'Finance', 'Mumbai', 72000, '2021-06-20', 'Active'),
(103, 'Rohan', 'Singh', 'Data', 'Delhi', 58000, '2023-03-10', 'Active'),
(104, 'Ananya', 'Roy', 'HR', 'Kolkata', 54000, '2020-11-05', 'Active'),
(105, 'Vikram', 'Mehta', 'IT', 'Pune', 80000, '2019-08-12', 'Active'),
(106, 'Neha', 'Kapoor', 'Finance', 'Delhi', 68000, '2022-09-25', 'On Leave'),
(107, 'Arjun', 'Sen', 'Data', 'Mumbai', 62000, '2024-01-18', 'Active'),
(108, 'Sneha', 'Bose', 'IT', 'Kolkata', 75000, '2021-12-01', 'Active'),
(109, 'Karan', 'Gupta', 'HR', 'Delhi', NULL, '2023-07-14', 'Active'),
(110, 'Meera', 'Nair', 'Finance', 'Pune', 70000, '2020-04-22', 'Active'),
(111, 'Rahul', 'Jain', 'IT', 'Mumbai', 85000, '2018-02-19', 'On Leave'),
(112, 'Ishita', 'Roy', 'Data', 'Kolkata', 60000, '2024-06-03', 'Active');
