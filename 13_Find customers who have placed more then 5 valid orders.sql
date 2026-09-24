-- 13) Find customers who have placed more then 5 valid orders

SELECT  customers.name AS Customer_Name, Count(orders.order_id) AS Total_Orders
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.total_amount > 0
GROUP BY customers.customer_id, customers.name
HAVING Total_Orders > 5
ORDER BY Total_Orders DESC
;