-- 21) How many customers placed more than one valid order?

SELECT
    COUNT(*) AS repeat_customers
FROM (
    SELECT customers.customer_id
    FROM customers
    JOIN orders
        ON customers.customer_id = orders.customer_id
    WHERE orders.total_amount > 0
    GROUP BY customers.customer_id
    HAVING COUNT(orders.order_id) > 1
) AS repeat_customer_list;