-- ========================================
-- DAY 6: SQL INNER JOIN PRACTICE QUERIES
-- ========================================


-- Query 1: Basic INNER JOIN
-- Show customer names with their order IDs

SELECT c.name, o.order_id
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;



-- Query 2: INNER JOIN with WHERE
-- Show customers whose order amount is greater than 600

SELECT c.name, o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.amount > 600;



-- Query 3: INNER JOIN with ORDER BY
-- Show customers ordered by highest purchase amount

SELECT c.name, o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY o.amount DESC;



-- Query 4: INNER JOIN with GROUP BY
-- Show total spending per customer

SELECT c.name, SUM(o.amount) AS total_spent
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name;



-- Query 5: INNER JOIN with HAVING
-- Show customers who spent more than 1000

SELECT c.name, SUM(o.amount) AS total_spent
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name
HAVING SUM(o.amount) > 1000;