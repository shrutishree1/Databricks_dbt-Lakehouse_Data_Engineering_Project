SELECT
    order_item_id,
    order_id,
    product_id,
    quantity,
    cast(unit_price as decimal(10,2)) as unit_price,
    cast(discount as decimal(10,2)) as discount,
    
    cast(
    cast(unit_price as decimal(10,2)) * cast(quantity as int) 
    as decimal(10,2)) as gross_amount,
    
    cast(
    cast(unit_price as decimal(10,2)) * cast(quantity as int) -
    cast(discount as decimal(10,2)) as decimal(10,2)
    ) as net_amount

FROM
    {{ source('bronze','order_items') }}