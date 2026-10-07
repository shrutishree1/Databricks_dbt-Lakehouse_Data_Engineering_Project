SELECT
    o.customer_id,
    p.payment_id,
    p.order_id,
    o.order_date,
    o.order_status,
    p.payment_date,
    p.payment_method,
    p.payment_amount,
    CASE WHEN p.payment_status = 'paid' THEN 'Paid'
         WHEN p.payment_status = 'failed' THEN 'Failed'
         WHEN p.payment_status = 'refunded' THEN 'Refunded'
         WHEN p.payment_status = 'pending' THEN 'Pending'
         ELSE 'Unknown'
    END AS payment_status
FROM
    {{ ref("stg_payments") }} as p
JOIN
    {{ ref("stg_orders") }} as o
ON
    p.order_id = o.order_id