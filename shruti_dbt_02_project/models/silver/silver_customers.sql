SELECT
    customer_id,
    customer_name,
    email,
    city,
    state,
    signup_date,
    customer_status
FROM
(
SELECT
    customer_id,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY signup_date DESC) rn,
    TRIM(customer_name) AS customer_name,
    LOWER(email) AS email,
    city,
    state,
    signup_date,
    customer_status
FROM
    {{ ref("stg_customers") }}
)t
WHERE rn = 1