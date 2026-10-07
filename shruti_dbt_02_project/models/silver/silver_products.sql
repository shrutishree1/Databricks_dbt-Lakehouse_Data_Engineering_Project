SELECT
    product_id,
    product_name,
    category,
    price,
    cost,
    stock_quantity,
    product_status,
    profit_per_unit,
    profit_margin,
    cast((price-cost)*100/price as decimal(10,2)) as profit_margin_percent
FROM
    {{ ref("stg_products") }}