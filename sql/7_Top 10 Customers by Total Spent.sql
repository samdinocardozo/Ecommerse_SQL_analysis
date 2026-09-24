-- 7) Top 10 Customers by Total Spent

SELECT name AS Customer_Name, SUM(orders.total_amount) AS Total_Spent
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.total_amount > 0
GROUP BY customers.customer_id, customers.name
ORDER BY Total_Spent DESC
LIMIT 10
;