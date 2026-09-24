-- 14) What is the average value of valid orders

SELECT  AVG(orders.total_amount) AS Average_Order_Value
FROM orders
WHERE orders.total_amount > 0
;