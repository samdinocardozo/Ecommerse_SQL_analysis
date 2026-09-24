/* 27) Monthly revenue + Month-over-Month (MoM) growth

You'll calculate:

Month
Total revenue
Previous month's revenue
Growth percentage
*/

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