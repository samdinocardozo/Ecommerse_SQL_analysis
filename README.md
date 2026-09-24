# E-Commerce Sales Analytics — SQL

## 📌 Project Overview

This project analyzes an e-commerce sales database using SQL to answer practical business questions related to **customers, orders, revenue, products, categories, brands, countries, and sales trends**.

The project contains **27 SQL analysis questions**, ranging from basic aggregation and joins to advanced SQL concepts such as **CTEs, subqueries, `LAG()`, and `DENSE_RANK()`**.

---

## 🗂️ Database Structure

The analysis uses four main tables:

* `customers` — customer information
* `orders` — order and transaction information
* `order_items` — individual products within orders
* `products` — product, category, and brand information

---

# 📊 SQL Analysis & Business Questions

## 1. Customer Count by Gender

```sql
SELECT COUNT(*) AS CUSTOMER_COUNT, gender
FROM customers
GROUP BY gender
ORDER BY CUSTOMER_COUNT DESC;
```

---

## 2. Top 10 Countries by Customer Count

```sql
SELECT country,COUNT(*) AS CUSTOMER_COUNT
FROM customers
GROUP BY country
ORDER BY CUSTOMER_COUNT DESC
LIMIT 10;
```

---

## 3. Total Revenue from Orders with Positive Amounts

```sql
SELECT SUM(total_amount) AS total_revenue
FROM orders
WHERE total_amount > 0;
```

---

## 4. Highest Revenue by Payment Method

```sql
SELECT payment_method,SUM(total_amount) AS total_revenue
FROM orders
WHERE total_amount > 0
GROUP BY payment_method
ORDER BY total_revenue DESC;
```

---

## 5. Highest Revenue by Product Category

```sql
SELECT products.category AS category,
       SUM(order_items.unit_price * order_items.quantity) AS revenue
FROM order_items
LEFT JOIN products
        ON order_items.product_id = products.product_id
GROUP BY category
ORDER BY revenue DESC;
```

---

## 6. Top 10 Products by Revenue

```sql
SELECT products.product_name AS name,
       SUM(order_items.unit_price * order_items.quantity) AS revenue
FROM order_items
JOIN products
        ON order_items.product_id = products.product_id
GROUP BY products.product_id, products.product_name
ORDER BY revenue DESC
LIMIT 10;
```

---

## 7. Top 10 Customers by Total Spent

```sql
SELECT name AS Customer_Name, 
       SUM(orders.total_amount) AS Total_Spent
FROM customers
JOIN orders 
    ON customers.customer_id = orders.customer_id
WHERE orders.total_amount > 0
GROUP BY customers.customer_id, customers.name
ORDER BY Total_Spent DESC
LIMIT 10;
```

---

## 8. Top 10 Customers by Number of Orders

```sql
SELECT name AS Customer_Name, 
       COUNT(orders.order_id) AS Total_Orders
FROM customers
JOIN orders 
    ON customers.customer_id = orders.customer_id
WHERE orders.total_amount > 0
GROUP BY customers.customer_id, customers.name
ORDER BY Total_Orders DESC
LIMIT 10;
```

---

## 9. Top 10 Countries by Revenue

```sql
SELECT customers.country AS Country, 
       SUM(order_items.quantity * order_items.unit_price) AS Revenue
FROM customers
JOIN orders 
    ON customers.customer_id = orders.customer_id
JOIN order_items 
    ON orders.order_id = order_items.order_id
GROUP BY Country
ORDER BY Revenue DESC
LIMIT 10;
```

---

## 10. Revenue by Year

```sql
SELECT YEAR(orders.order_date) AS Year_report, 
       SUM(order_items.quantity * order_items.unit_price) AS Revenue
FROM orders
JOIN order_items 
    ON orders.order_id = order_items.order_id
GROUP BY YEAR(orders.order_date)
ORDER BY YEAR(orders.order_date) ASC;
```

---

## 11. Revenue by Year and Month

```sql
SELECT YEAR(orders.order_date) AS Year_report,
       MONTH(orders.order_date) AS Month_report,
       SUM(orders.total_amount) AS Revenue
FROM orders
WHERE orders.total_amount > 0
GROUP BY MONTH(orders.order_date), YEAR(orders.order_date)
ORDER BY YEAR(orders.order_date) ASC, Month_report ASC;
```

---

## 12. Which Month Had the Highest Revenue?

```sql
SELECT MONTHNAME(orders.order_date) AS Month_report,
       SUM(orders.total_amount) AS Revenue
FROM orders
WHERE orders.total_amount > 0
GROUP BY MONTH(orders.order_date), MONTHNAME(orders.order_date)
ORDER BY Revenue DESC;
```

---

## 13. Customers Who Placed More Than 5 Valid Orders

```sql
SELECT customers.name AS Customer_Name, 
       COUNT(orders.order_id) AS Total_Orders
FROM customers
JOIN orders 
    ON customers.customer_id = orders.customer_id
WHERE orders.total_amount > 0
GROUP BY customers.customer_id, customers.name
HAVING Total_Orders > 5
ORDER BY Total_Orders DESC;
```

---

## 14. What Is the Average Value of Valid Orders?

```sql
SELECT AVG(orders.total_amount) AS Average_Order_Value
FROM orders
WHERE orders.total_amount > 0;
```

---

## 15. Average Order Value by Payment Method

```sql
SELECT orders.payment_method,
       AVG(orders.total_amount) AS Average_Order_Value
FROM orders
WHERE orders.total_amount > 0
GROUP BY orders.payment_method;
```

---

## 16. Product Categories Generating More Than a Specified Revenue

Example threshold: **50,000,000**

```sql
SELECT products.category AS Product_Category,
       SUM(order_items.unit_price * order_items.quantity) AS Revenue
FROM products
JOIN order_items 
    ON products.product_id = order_items.product_id
GROUP BY products.category
HAVING SUM(order_items.unit_price * order_items.quantity) > 50000000
ORDER BY SUM(order_items.unit_price * order_items.quantity) DESC;
```

---

## 17. Top 3 Brands by Total Revenue and Quantity Sold

```sql
SELECT products.brand AS Product_Brand,
       SUM(order_items.unit_price * order_items.quantity) AS Total_Revenue,
       SUM(order_items.quantity) AS Total_Quantity
FROM products
JOIN order_items 
    ON products.product_id = order_items.product_id
GROUP BY products.brand
ORDER BY Total_Revenue DESC, Total_Quantity DESC
LIMIT 3;
```

---

## 18. Top 10 Customers by Spending with Their Order Count

```sql
SELECT
    customers.name AS customer,
    SUM(orders.total_amount) AS total_revenue,
    COUNT(orders.order_id) AS total_orders
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
WHERE orders.total_amount > 0
GROUP BY customers.customer_id, customers.name
ORDER BY total_revenue DESC
LIMIT 10;
```

---

## 19. Top 10 Customers by Spending with Their Country

```sql
SELECT
    customers.name AS customer,
    customers.country AS country,
    SUM(orders.total_amount) AS total_revenue
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
WHERE orders.total_amount > 0
GROUP BY customers.customer_id, customers.name, customers.country
ORDER BY total_revenue DESC
LIMIT 10;
```

---

## 20. Top 10 Customer Countries by Revenue, Orders, and Average Order Value

```sql
SELECT
    customers.country AS country,
    SUM(orders.total_amount) AS total_revenue,
    COUNT(orders.order_id) AS total_valid_orders,
    AVG(orders.total_amount) AS average_order_value
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
WHERE orders.total_amount > 0
GROUP BY customers.country
ORDER BY total_revenue DESC,
         total_valid_orders DESC,
         average_order_value DESC
LIMIT 10;
```

---

## 21. How Many Customers Placed More Than One Valid Order?

```sql
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
```

---

## 22. Customers Whose Total Spending Is Greater Than Average Customer Spending

```sql
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
```

---

## 23. Category Revenue and Percentage Contribution to Total Revenue

```sql
SELECT products.category AS Product_Category,
       SUM(order_items.unit_price * order_items.quantity) AS Category_Revenue,
       (
           SUM(order_items.unit_price * order_items.quantity)
           /
           (
               SELECT SUM(order_items.unit_price * order_items.quantity)
               FROM order_items
           )
       ) * 100 AS Percentage_Contribution
FROM products
JOIN order_items
    ON products.product_id = order_items.product_id
GROUP BY products.category
ORDER BY Category_Revenue DESC;
```

---

## 24. Yearly Revenue, Previous Year's Revenue, and YoY Growth

```sql
WITH yearly_revenue AS (
    SELECT
        YEAR(order_date) AS order_year,
        SUM(total_amount) AS total_revenue
    FROM orders
    WHERE total_amount > 0
    GROUP BY YEAR(order_date)
),

revenue_with_previous AS (
    SELECT
        order_year,
        total_revenue,
        LAG(total_revenue) OVER (
            ORDER BY order_year
        ) AS previous_year_revenue
    FROM yearly_revenue
)

SELECT
    order_year,
    total_revenue,
    previous_year_revenue,
    ROUND(
        (
            (total_revenue - previous_year_revenue)
            / previous_year_revenue
        ) * 100,
        2
    ) AS year_over_year_growth_percentage
FROM revenue_with_previous
ORDER BY order_year;
```

---

## 25. Rank Product Categories by Total Revenue

```sql
SELECT products.category AS Product_Category,
       SUM(order_items.unit_price * order_items.quantity) AS Total_Revenue,
       DENSE_RANK() OVER (
           ORDER BY SUM(order_items.unit_price * order_items.quantity) DESC
       ) AS Revenue_Rank
FROM products
JOIN order_items
    ON products.product_id = order_items.product_id
GROUP BY products.category
ORDER BY Total_Revenue DESC;
```

---

## 26. Top 3 Products Within Each Category by Revenue

```sql
WITH Ranked_products AS (
    SELECT
        products.category AS Product_Category,
        products.product_name AS Product_Name,
        SUM(order_items.unit_price * order_items.quantity) AS Total_Revenue,
        DENSE_RANK() OVER (
            PARTITION BY products.category
            ORDER BY SUM(order_items.unit_price * order_items.quantity) DESC
        ) AS Revenue_Rank
    FROM products
    JOIN order_items
        ON products.product_id = order_items.product_id
    GROUP BY products.category,
             products.product_id,
             products.product_name
)

SELECT
    Product_Category,
    Product_Name,
    Total_Revenue,
    Revenue_Rank
FROM Ranked_products
WHERE Revenue_Rank <= 3
ORDER BY Product_Category, Revenue_Rank;
```

---

## 27. Monthly Revenue and Month-over-Month Growth

```sql
WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS monthly_year,
        SUM(total_amount) AS total_monthly_revenue
    FROM orders
    WHERE total_amount > 0
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
),

previous_monthly_revenue AS (
    SELECT
        monthly_year,
        total_monthly_revenue,
        LAG(total_monthly_revenue) OVER (
            ORDER BY monthly_year
        ) AS previous_monthly_revenue
    FROM monthly_revenue
)

SELECT
    monthly_year,
    total_monthly_revenue,
    previous_monthly_revenue,
    ROUND(
        (
            (total_monthly_revenue - previous_monthly_revenue)
            / previous_monthly_revenue
        ) * 100,
        2
    ) AS month_over_month_growth_percentage
FROM previous_monthly_revenue
ORDER BY monthly_year ASC;
```

---

# 🧠 SQL Concepts Practiced

Through these 27 questions, the project demonstrates practical use of:

* `SELECT`
* `WHERE`
* `GROUP BY`
* `ORDER BY`
* `HAVING`
* `LIMIT`
* `SUM()`
* `COUNT()`
* `AVG()`
* `INNER JOIN`
* `LEFT JOIN`
* Subqueries
* Common Table Expressions (CTEs)
* Window functions
* `LAG()`
* `DENSE_RANK()`
* `PARTITION BY`
* `YEAR()`
* `MONTH()`
* `MONTHNAME()`
* `DATE_FORMAT()`
* Percentage calculations
* Year-over-Year (YoY) growth
* Month-over-Month (MoM) growth

---

# 📁 Project Files

```text
SQL_Summary_ecommerce.txt
README.md
```

The `SQL_Summary_ecommerce.txt` file contains the complete SQL analysis used in this project.

---

# 📌 Conclusion

This project demonstrates how SQL can be used for **business-focused e-commerce analysis**, starting from basic customer and revenue analysis and progressing to more advanced analytical techniques.

The queries cover:

* Customer behavior
* Revenue performance
* Product and category performance
* Brand performance
* Geographic analysis
* Customer retention/repeat purchases
* Monthly and yearly trends
* YoY and MoM growth
* Revenue ranking
* Top products within categories

The project also provided practical experience with **joins, aggregations, subqueries, CTEs, and window functions**, which are important SQL skills for data and business analyst roles.
