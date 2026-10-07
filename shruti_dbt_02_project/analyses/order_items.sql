{# SELECT
    COUNT(*)
FROM
    {{ ref("stg_order_items") }} #}


SELECT
    COUNT(*)
FROM
    {{ ref("silver_order_items") }}