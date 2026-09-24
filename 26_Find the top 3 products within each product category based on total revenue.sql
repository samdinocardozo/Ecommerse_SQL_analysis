/* 26) Find the top 3 products within each product category based on total revenue.
*/

WITH Ranked_products AS(
SELECT products.category AS Product_Category, products.product_name AS Product_Name, SUM(order_items.unit_price * order_items.quantity) AS Total_Revenue,
       DENSE_RANK() OVER (PARTITION BY products.category ORDER BY SUM(order_items.unit_price * order_items.quantity) DESC) AS Revenue_Rank
FROM products
JOIN order_items ON products.product_id = order_items.product_id
GROUP BY products.category, products.product_id, products.product_name

)

SELECT Product_Category, Product_Name, Total_Revenue, Revenue_Rank
FROM Ranked_products
WHERE Revenue_Rank <= 3
ORDER BY Product_Category, Revenue_Rank;