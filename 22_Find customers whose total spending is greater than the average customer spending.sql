-- 22) Find customers whose total spending is greater than the average customer spending.

SELECT
    customers.name AS customer_name,
    SUM(orders.total_amount) AS total_spending
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
WHERE orders.total_amount > 0
GROUP BY customers.customer_id, customers.name
HAVING SUM(orders.total_amount) > (
    SELECT AVG(total_spending)
    FROM (
        SELECT
            SUM(orders.total_amount) AS total_spending
        FROM customers
        JOIN orders
            ON customers.customer_id = orders.customer_id
        WHERE orders.total_amount > 0
        GROUP BY customers.customer_id
    ) AS customer_spending
);