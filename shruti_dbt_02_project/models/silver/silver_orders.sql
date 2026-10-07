SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_status,
    o.shipping_city,
    TRIM(c.customer_name) as customer_name,
    LOWER(c.email) as email
FROM
    {{ ref("stg_orders") }} as o
JOIN
    {{ ref("stg_customers") }} as c
ON
    o.customer_id = c.customer_id