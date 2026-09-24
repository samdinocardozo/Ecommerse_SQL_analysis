-- 1) Customer Count by Gender

SELECT COUNT(*) AS CUSTOMER_COUNT, gender
FROM customers
GROUP BY gender
ORDER BY CUSTOMER_COUNT DESC;