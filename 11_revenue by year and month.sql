-- 11) revenue by year and month

SELECT  Year(orders.order_date) AS Year_report, MONTH(orders.order_date) AS Month_report, sum(orders.total_amount) AS Revenue
FROM orders
WHERE orders.total_amount > 0
GROUP BY MONTH(orders.order_date), Year(orders.order_date)
ORDER BY Year(orders.order_date) ASC, Month_report ASC
;