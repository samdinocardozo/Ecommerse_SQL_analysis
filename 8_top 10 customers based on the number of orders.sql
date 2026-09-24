-- 8) top 10 customers based on the number of orders

SELECT name AS Customer_Name, Count(orders.order_id) AS Total_Orders
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.total_amount > 0
GROUP BY customers.customer_id, customers.name
ORDER BY Total_Orders DESC
LIMIT 10
;