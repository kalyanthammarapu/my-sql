-- 1. Customers from USA
SELECT * FROM customers WHERE country = 'USA';

-- 2. Total revenue per customer
SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id;

-- 3. Average order value
SELECT AVG(amount) AS average_order FROM orders;

-- 4. Join customer and orders
SELECT c.name, o.amount, o.order_date
FROM customers c
JOIN orders o ON c.id = o.customer_id;

-- 5. Subquery: Customers with total spend > 200
SELECT * FROM customers
WHERE id IN (
  SELECT customer_id FROM orders GROUP BY customer_id HAVING SUM(amount) > 200
);

-- 6. Create a view
CREATE VIEW usa_customers AS
SELECT * FROM customers WHERE country = 'USA';

-- 7. Create an index
CREATE INDEX idx_order_customer ON orders(customer_id);
