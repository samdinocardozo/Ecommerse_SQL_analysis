-- 16) Find product categories that generated more than a specified amount of revenue (e.g., 50,000,000)

SELECT  products.category AS Product_Category, SUM(order_items.unit_price * order_items.quantity) AS Revenue
FROM products
JOIN order_items ON products.product_id = order_items.product_id
GROUP BY products.category
HAVING SUM(order_items.unit_price * order_items.quantity) > 50000000
ORDER BY SUM(order_items.unit_price * order_items.quantity) DESC
;