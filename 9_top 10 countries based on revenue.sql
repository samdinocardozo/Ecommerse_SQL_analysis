-- 9) top 10 countries based on revenue

SELECT customers.country AS Country, SUM(order_items.quantity*order_items.unit_price) AS Revenue
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY Country
ORDER BY Revenue DESC
LIMIT 10
;