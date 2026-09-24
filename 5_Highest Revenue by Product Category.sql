-- 5)Highest Revenue by Product Category

SELECT products.category AS category,
       SUM(order_items.unit_price * order_items.quantity) AS revenue
FROM order_items
LEFT JOIN products
        ON order_items.product_id = products.product_id
GROUP BY category
ORDER BY revenue DESC
;