SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(f.quantity) AS items_sold,
    SUM(f.gross_amount) AS gross_sales,
    SUM(f.discount_amount) AS total_discount,
    SUM(f.net_sales) AS total_sales,
    SUM(f.total_cost) AS total_cost,
    SUM(f.gross_profit) AS total_profit
FROM 
    {{ ref('fact_sales') }} AS f
JOIN 
    {{ ref('dim_products') }} AS p
ON 
    f.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category