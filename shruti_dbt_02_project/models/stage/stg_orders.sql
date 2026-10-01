SELECT
    order_id,
    customer_id,
    order_date,
    order_status,
    shipping_city
FROM 
    {{source('bronze','orders')}}