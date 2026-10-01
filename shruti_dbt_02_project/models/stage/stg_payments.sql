SELECT
    payment_id,
    order_id,
    payment_method,
    payment_amount,
    payment_status,
    payment_date
FROM
    {{source('bronze', 'payments')}}