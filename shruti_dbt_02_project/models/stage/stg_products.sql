SELECT
    product_id,
    product_name,
    category,
    cast(price as decimal(10,2)) as price,
    cast(cost as decimal(10,2)) as cost,
    stock_quantity,
    product_status,

    cast (
    cast(price as decimal(10,2)) - 
    cast(cost as decimal(10,2)) as decimal(10,2)
    )as profit_per_unit,

    cast (
    cast(price as decimal(10,2)) - 
    cast(cost as decimal(10,2)) / 
    nullif(cast(price as decimal(10,2)),0) as decimal(10,2)
    )as profit_margin
FROM
    {{ source("bronze", "products") }}