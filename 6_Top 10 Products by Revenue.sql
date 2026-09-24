-- 6) Top 10 Products by Revenue

SELECT products.product_name AS name,
       SUM(order_items.unit_price * order_items.quantity) AS revenue
FROM order_items
JOIN products --since we aready validated the data
        ON order_items.product_id = products.product_id
GROUP BY products.product_id, products.product_name
ORDER BY revenue DESC
LIMIT 10
;