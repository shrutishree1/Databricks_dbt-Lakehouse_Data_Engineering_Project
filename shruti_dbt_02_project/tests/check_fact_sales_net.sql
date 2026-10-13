SELECT 
    *
FROM 
    {{ ref('fact_sales') }}
WHERE 
    ABS(net_sales - (gross_amount - discount_amount)) > 0.01