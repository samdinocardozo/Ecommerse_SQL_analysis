/* 24) For each year, show:

Total revenue
Previous year's revenue
Year-over-year revenue growth percentage
*/

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