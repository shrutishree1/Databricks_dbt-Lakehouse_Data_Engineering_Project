WITH product_sales AS (
SELECT
    product_id,
    COUNT(DISTINCT order_id) AS total_order,
    SUM(quantity) AS total_quantity_sold,
    SUM(gross_amount) AS total_sales,
    SUM(discount) AS total_discount_given
FROM
    {{ ref("silver_order_items") }}
GROUP BY product_id
)
SELECT
    sp.product_id,
    sp.product_name,
    sp.category,
    CAST(sp.price AS decimal(10,2)) AS price,
    CAST(sp.cost AS decimal(10,2)) AS cost,
    sp.stock_quantity,
    sp.product_status,
    sp.profit_per_unit,
    sp.profit_margin,
    sp.profit_margin_percent,
    COALESCE(ps.total_order,0) AS total_orders,
    COALESCE(ps.total_quantity_sold,0) AS total_quantity_sold,
    COALESCE(ps.total_sales,0) AS total_sales,
    COALESCE(ps.total_discount_given,0) AS total_discount_given,
    ( COALESCE(ps.total_sales, 0)
        - COALESCE(ps.total_discount_given, 0)
        - (COALESCE(ps.total_quantity_sold, 0)
        * CAST(sp.cost AS DECIMAL(10,2))
        )
     ) AS gross_profit 
    
FROM
    {{ ref("silver_products") }} AS sp
LEFT JOIN
    product_sales AS ps
ON
    sp.product_id = ps.product_id