-- 19) Find the top 10 customers by total spending, but also show their country.

SELECT
    customers.name AS customer,
    customers.country AS country,
    SUM(orders.total_amount) AS total_revenue
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
WHERE orders.total_amount > 0
GROUP BY customers.customer_id, customers.name, customers.country
ORDER BY total_revenue DESC
LIMIT 10;