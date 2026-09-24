-- 2) Top 10 Countries by Customer Count

SELECT country,COUNT(*) AS CUSTOMER_COUNT
FROM customers
GROUP BY country
ORDER BY CUSTOMER_COUNT DESC
limit 10
;