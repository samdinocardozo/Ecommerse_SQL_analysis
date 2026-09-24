/* 23) For each product category, calculate:

Category revenue
Percentage contribution to total revenue

*/

SELECT products.category AS Product_Category,
       SUM(order_items.unit_price * order_items.quantity) AS Category_Revenue,
       (SUM(order_items.unit_price * order_items.quantity) / (SELECT SUM(order_items.unit_price * order_items.quantity) FROM order_items)) * 100 AS Percentage_Contribution
FROM products
JOIN order_items ON products.product_id = order_items.product_id
GROUP BY products.category
ORDER BY Category_Revenue DESC;