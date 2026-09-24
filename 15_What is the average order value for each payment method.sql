-- 15) What is the average order value for each payment method?

SELECT  orders.payment_method, AVG(orders.total_amount) AS Average_Order_Value
FROM orders
WHERE orders.total_amount > 0
GROUP BY orders.payment_method
;