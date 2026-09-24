-- 4)Highest Revenue by Payment Method

SELECT payment_method,SUM(total_amount) AS total_revenue
FROM orders
WHERE total_amount > 0
GROUP BY payment_method
ORDER BY total_revenue DESC
;