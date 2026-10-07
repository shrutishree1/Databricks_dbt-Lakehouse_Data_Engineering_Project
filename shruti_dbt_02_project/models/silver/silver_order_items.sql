SELECT
    oi.order_item_id,
    oi.order_id,
    o.order_date,
    oi.product_id,
    o.customer_id,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    oi.discount,
    oi.gross_amount,
    (oi.gross_amount*oi.discount)/100 as discount_amount
FROM
    {{ ref("stg_order_items") }} as oi
JOIN
    {{ ref("stg_orders") }} as o
ON  oi.order_id = o.order_id
JOIN
    {{ ref("stg_products") }} as p
ON  oi.product_id = p.product_id