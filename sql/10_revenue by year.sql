-- 10) revenue by year

SELECT Year(orders.order_date) AS Year_report, SUM(order_items.quantity*order_items.unit_price) AS Revenue
FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY Year(orders.order_date)
ORDER BY Year(orders.order_date) ASC
;