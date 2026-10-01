SELECT
    customer_id,
    customer_name,
    email,
    city,
    state,
    signup_date,
    customer_status
FROM
    {{ source('bronze','customers') }}