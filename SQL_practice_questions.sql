-- List all customers who have placed more than 2 orders.
SELECT customer_id, COUNT(*) as order_count
FROM my_data
GROUP BY customer_id
HAVING COUNT(*) > 2;

select * from my_data

-- Retrieve the names of customers along with the total amount they have spent on orders.

SELECT c.name, SUM(o.amount) as total_spent
FROM my_data1 c
JOIN my_data o ON c.id = o.customer_id
GROUP BY c.name;

-- Find the customer with the highest total spending.

SELECT c.name, SUM(o.amount) as total_spent
FROM my_data1 c
JOIN my_data o ON c.id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 1;

-- Retrieve the names of customers who have not placed any orders.
SELECT c.name
FROM my_data1 c
LEFT JOIN my_data o ON c.id = o.customer_id
WHERE o.customer_id IS NULL;

-- List the top 5 most ordered products.

SELECT product_id, COUNT(*) as total_orders
FROM my_data
GROUP BY product_id
ORDER BY total_orders DESC
LIMIT 5;

-- Retrieve the names of customers along with the date of their first order.

SELECT c.name, MIN(o.order_date) as first_order_date
FROM my_data1 c
JOIN my_data o ON c.id = o.customer_id
GROUP BY c.name;



