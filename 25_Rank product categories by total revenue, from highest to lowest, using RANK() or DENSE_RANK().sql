/* 25) Rank product categories by total revenue, from highest to lowest, using RANK() or DENSE_RANK()
*/

SELECT products.category AS Product_Category, SUM(order_items.unit_price * order_items.quantity) AS Total_Revenue,
       DENSE_RANK() OVER (ORDER BY SUM(order_items.unit_price * order_items.quantity) DESC) AS Revenue_Rank
FROM products
JOIN order_items ON products.product_id = order_items.product_id
GROUP BY products.category
ORDER BY Total_Revenue DESC;
