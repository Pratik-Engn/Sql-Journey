- DAY 32 - SQL CONSTRAINTS
Some fundamental constraints for advance sql filters

-- 1. NOT NULL
CREATE TABLE employees (
    employee_id INT,
    name VARCHAR(50) NOT NULL
);


-- 2. PRIMARY KEY
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50)
);


-- 3. UNIQUE
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);


-- 4. DEFAULT
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    status VARCHAR(20) DEFAULT 'Active'
);


-- 5. CHECK
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2) CHECK (salary >= 0)
);


-- 6. Create parent table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL UNIQUE
);


-- 7. Create child table with FOREIGN KEY
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


-- 8. Insert valid department
INSERT INTO departments
VALUES (1, 'Data');


-- 9. Insert valid employee
INSERT INTO employees
(employee_id, name, email, salary, department_id)
VALUES
(101, 'Rahul', 'rahul@email.com', 70000, 1);


-- 10. Composite Primary Key
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id)
);


-- 11. Named Constraints
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2),

    CONSTRAINT pk_product
        PRIMARY KEY (product_id),

    CONSTRAINT uq_product_name
        UNIQUE (product_name),

    CONSTRAINT chk_product_price
        CHECK (price >= 0)
);


-- 12. Add NOT NULL
ALTER TABLE employees
MODIFY name VARCHAR(50) NOT NULL;


-- 13. Add UNIQUE
ALTER TABLE employees
ADD CONSTRAINT uq_employee_email
UNIQUE (email);


-- 14. Add CHECK
ALTER TABLE employees
ADD CONSTRAINT chk_employee_salary
CHECK (salary >= 0);


-- 15. Add FOREIGN KEY
ALTER TABLE employees
ADD CONSTRAINT fk_employee_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);


-- 16. Add DEFAULT
ALTER TABLE employees
ALTER status SET DEFAULT 'Active';


-- 17. Drop a constraint
ALTER TABLE employees
DROP FOREIGN KEY fk_employee_department;


-- 18. Test NOT NULL
-- This should fail because name cannot be NULL.
INSERT INTO employees (employee_id, name)
VALUES (102, NULL);


-- 19. Test PRIMARY KEY
-- This should fail if employee_id 101 already exists.
INSERT INTO employees (employee_id, name)
VALUES (101, 'Amit');


-- 20. Test UNIQUE
-- This should fail if the email already exists.
INSERT INTO employees
(employee_id, name, email)
VALUES
(103, 'Priya', 'rahul@email.com');


-- 21. Test CHECK
-- This should fail because salary cannot be negative.
INSERT INTO employees
(employee_id, name, salary)
VALUES
(104, 'Neha', -5000);


-- 22. Test FOREIGN KEY
-- This should fail if department_id 999 does not exist.
INSERT INTO employees
(employee_id, name, department_id)
VALUES
(105, 'Ravi', 999);


-- 23. Test DEFAULT
INSERT INTO employees
(employee_id, name)
VALUES
(106, 'Arjun');


-- 24. View table structure
DESCRIBE employees;
