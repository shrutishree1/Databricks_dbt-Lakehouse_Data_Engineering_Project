SELECT
    order_id,
    customer_id,
    order_date,
    CASE WHEN order_status IN (
        "delivered",
        "shipped",
        "cancelled",
        "confirmed",
        "returned",
        "pending"    ) 
    THEN order_status
    ELSE 'Unknown'
    END AS order_status,
    shipping_city
FROM 
    {{source('bronze','orders')}}