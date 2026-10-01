WITH unique_customer AS (
SELECT 
    customer_id,
    customer_name,
    email,
    city,
    state,
    signup_date,
    customer_status,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY signup_date) AS rn
FROM
    {{ source('bronze','customers') }}
)
SELECT
    customer_id,
    customer_name,
    email,
    city,
    state,
    signup_date,
    customer_status
FROM 
    unique_customer
WHERE rn = 1