-- 17) Find the top 3 brands by total revenue and total quantity sold

SELECT  products.brand AS Product_Brand, SUM(order_items.unit_price * order_items.quantity) AS Total_Revenue, SUM(order_items.quantity) AS Total_Quantity
FROM products
JOIN order_items ON products.product_id = order_items.product_id
GROUP BY products.brand
ORDER BY Total_Revenue DESC, Total_Quantity DESC
LIMIT 3
;