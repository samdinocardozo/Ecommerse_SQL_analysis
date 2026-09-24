-- 12) Which Month (entire dataset) has the highest revenue?

SELECT  MONTHNAME(orders.order_date) AS Month_report, sum(orders.total_amount) AS Revenue
FROM orders
WHERE orders.total_amount > 0
GROUP BY MONTH(orders.order_date), MONTHNAME(orders.order_date) 
ORDER BY Revenue DESC
;