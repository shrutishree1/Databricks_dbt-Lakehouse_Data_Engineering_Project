{# SELECT
    count(*)
FROM
    {{ ref("stg_orders") }} #}

SELECT
    count(*)
FROM
    {{ ref("silver_orders") }}