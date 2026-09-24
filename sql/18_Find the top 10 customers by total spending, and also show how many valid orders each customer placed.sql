-- 18) Find the top 10 customers by total spending, and also show how many valid orders each customer placed.

SELECT
    customers.name AS customer,
    SUM(orders.total_amount) AS total_revenue,
    COUNT(orders.order_id) AS total_orders
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
WHERE orders.total_amount > 0
GROUP BY customers.customer_id, customers.name
ORDER BY total_revenue DESC
LIMIT 10;