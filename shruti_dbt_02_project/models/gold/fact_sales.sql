SELECT
    soi.order_item_id,
    soi.order_id,
    soi.order_date,
    soi.customer_id,
    soi.product_id,
    so.order_status,
    so.shipping_city,
    soi.quantity,
    soi.unit_price,
    soi.discount,
    soi.gross_amount,
    soi.discount_amount,
    CAST(sp.cost AS DECIMAL(10,2)) AS unit_cost,
    soi.quantity * CAST(sp.cost AS DECIMAL(10,2)) AS total_cost,
    soi.gross_amount - soi.discount_amount AS net_sales,
    (soi.gross_amount - soi.discount_amount
        - (soi.quantity * CAST(sp.cost AS DECIMAL(10,2)))
    )AS gross_profit
FROM 
    {{ ref('silver_order_items') }} AS soi
JOIN 
    {{ ref('silver_orders') }} AS so
ON 
    soi.order_id = so.order_id
JOIN 
    {{ ref('silver_products') }} AS sp
ON 
    soi.product_id = sp.product_id
