WITH customer_activity AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders,
        SUM(quantity) AS total_quantity_purchased,
        SUM(net_sales) AS total_net_sales,
        ROUND(
            SUM(net_sales) / NULLIF(COUNT(DISTINCT order_id), 0),
            2
        ) AS average_order_value,
        MIN(order_date) AS first_order_date,
        MAX(order_date) AS last_order_date
    FROM 
        {{ ref('fact_sales') }}
    GROUP BY 
        customer_id
),
customer_metrics AS (
    SELECT
        dc.customer_id,
        dc.customer_name,
        dc.email,
        COALESCE(ca.total_orders, 0) AS total_orders,
        COALESCE(ca.total_quantity_purchased, 0)
            AS total_quantity_purchased,
        COALESCE(ca.total_net_sales, 0) AS total_net_sales,
        COALESCE(ca.average_order_value, 0) AS average_order_value,
        ca.first_order_date,
        ca.last_order_date,
        DATEDIFF(CURRENT_DATE(), ca.last_order_date)
            AS days_since_last_order
    FROM 
        {{ ref('dim_customers') }} AS dc
    LEFT JOIN 
        customer_activity AS ca
    ON 
        dc.customer_id = ca.customer_id
)
SELECT
    customer_id,
    customer_name,
    email,
    total_orders AS orders,
    total_quantity_purchased AS items_purchased,
    total_net_sales AS total_sales,
    average_order_value AS avg_order_value,
    first_order_date,
    last_order_date,
    CASE
        WHEN total_orders = 0 THEN 'Never Purchased'
        WHEN days_since_last_order > 90 THEN 'Inactive'
        WHEN total_orders = 1 THEN 'One-Time'
        WHEN total_orders >= 5 THEN 'Frequent'
        ELSE 'Repeat'
    END AS customer_segment
FROM 
    customer_metrics