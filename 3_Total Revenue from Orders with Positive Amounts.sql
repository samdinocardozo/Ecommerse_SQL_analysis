-- 3) Total Revenue from Orders with Positive Amounts

SELECT SUM(total_amount) AS total_revenue
FROM orders
WHERE total_amount > 0;
;