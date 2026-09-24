/* 20) Find the top 10 customer countries by:

Total revenue
Number of valid orders
Average order value
*/

SELECT
    customers.country AS country,
    SUM(orders.total_amount) AS total_revenue,
    Count(orders.order_id) AS total_valid_orders,
    AVG(orders.total_amount) AS average_order_value
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
WHERE orders.total_amount > 0
GROUP BY customers.country
ORDER BY total_revenue DESC, total_valid_orders DESC,
    average_order_value DESC
LIMIT 10;