-- DATASETS USED:
-- employees(employee_id, first_name, department_id)
-- departments(department_id, department_name)
-- customers(customer_id, customer_name)
-- orders(order_id, customer_id)
-- products(product_id, product_name)
-- order_items(order_item_id, product_id)
-- students(student_id, student_name)
-- enrollments(enrollment_id, student_id)
-- books(book_id, book_name)
-- borrow_records(record_id, book_id)
-- teachers(teacher_id, teacher_name)
-- classes(class_id, teacher_id)
-- drivers(driver_id, driver_name)
-- rides(ride_id, driver_id)
-- movies(movie_id, movie_name)
-- rentals(rental_id, movie_id)
-- payroll(payroll_id, employee_id)
-- sellers(seller_id, seller_name)
-- sales(sale_id, seller_id)

-- 1. Employees without departments
SELECT e.employee_id, e.first_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- 2. Customers who never placed orders
SELECT c.customer_id, c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

-- 3. Products never sold
SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

-- 4. Students who never enrolled
SELECT s.student_id, s.student_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

-- 5. Books never borrowed
SELECT b.book_id, b.book_name
FROM books b
LEFT JOIN borrow_records br
ON b.book_id = br.book_id
WHERE br.book_id IS NULL;

-- 6. Teachers without classes
SELECT t.teacher_id, t.teacher_name
FROM teachers t
LEFT JOIN classes c
ON t.teacher_id = c.teacher_id
WHERE c.teacher_id IS NULL;

-- 7. Drivers without rides
SELECT d.driver_id, d.driver_name
FROM drivers d
LEFT JOIN rides r
ON d.driver_id = r.driver_id
WHERE r.driver_id IS NULL;

-- 8. Movies never rented
SELECT m.movie_id, m.movie_name
FROM movies m
LEFT JOIN rentals r
ON m.movie_id = r.movie_id
WHERE r.movie_id IS NULL;

-- 9. Customers using NOT EXISTS
SELECT c.customer_id, c.customer_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE c.customer_id = o.customer_id
);

-- 10. Employees not in payroll
SELECT e.employee_id, e.first_name
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM payroll p
    WHERE e.employee_id = p.employee_id
);

-- 11. Using NOT IN
SELECT customer_id, customer_name
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
);

-- 12. Sellers with no sales
SELECT s.seller_id, s.seller_name
FROM sellers s
LEFT JOIN sales sa
ON s.seller_id = sa.seller_id
WHERE sa.seller_id IS NULL;