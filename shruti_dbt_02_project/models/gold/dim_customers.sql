WITH customer_orders AS
(
SELECT
     customer_id,
     MIN(order_date) as first_order_date,
     MAX(order_date) as last_order_date,
     COUNT(DISTINCT order_id) as total_orders,
     SUM(CASE WHEN order_status = 'delivered' THEN 1 ELSE 0 END) AS total_completed_orders,
     SUM(CASE WHEN order_status = 'returned' THEN 1 ELSE 0 END) AS total_returned_orders,
     SUM(CASE WHEN order_status = 'cancelled' THEN 1 ELSE 0 END) AS total_cancelled_orders,
     SUM(CASE WHEN order_status = 'pending' THEN 1 ELSE 0 END) AS total_pending_orders
FROM
     {{ ref("silver_orders") }}
GROUP BY customer_id
),
customer_items AS
(
SELECT
     so.customer_id,
     SUM(soi.quantity) AS total_items_purchased,
     CAST(SUM(soi.gross_amount) AS decimal(10,2)) AS total_sales,
     CAST(SUM(soi.discount_amount) AS decimal(10,2)) AS total_discount_given
FROM
     {{ ref("silver_orders") }} AS so 
JOIN 
     {{ ref("silver_order_items")}} AS soi
ON 
     so.order_id = soi.order_id 
GROUP BY
     so.customer_id
),
customer_payments AS
(
SELECT
     soo.customer_id,
     CAST(SUM(CASE WHEN spp.payment_status = 'Paid' THEN spp.payment_amount ELSE 0 END) AS decimal(10,2)) AS total_paid_amount,
     CAST(SUM(CASE WHEN spp.payment_status = 'Refunded' THEN spp.payment_amount ELSE 0 END) AS decimal(10,2)) AS total_refunded_amount,
     CAST(SUM(CASE WHEN spp.payment_status = 'Failed' THEN spp.payment_amount ELSE 0 END) AS decimal(10,2)) AS total_failed_amount
FROM
     {{ ref("silver_orders") }} AS soo
JOIN
     {{ ref("silver_payments") }} AS spp
ON
     soo.order_id = spp.order_id
GROUP BY
     soo.customer_id
)
SELECT 
     sc.customer_id,
     sc.customer_name,
     COALESCE(sc.email,"NA") AS email,
     sc.city,
     sc.state,
     sc.signup_date,
     sc.customer_status,
     co.first_order_date AS first_order,
     co.last_order_date AS last_order,
     COALESCE(co.total_orders,0) AS total_orders,
     COALESCE(co.total_completed_orders,0) AS completed_orders,
     COALESCE(co.total_returned_orders,0) AS returned_orders,
     COALESCE(co.total_cancelled_orders,0) AS cancelled_orders,
     COALESCE(co.total_pending_orders,0) AS pending_orders,
     COALESCE(ci.total_items_purchased,0) AS total_items_purchased,
     COALESCE(ci.total_sales,0) AS total_sales,
     COALESCE(ci.total_discount_given,0) AS total_discount_given,
     COALESCE(cp.total_paid_amount,0) AS total_paid_amount,
     COALESCE(cp.total_refunded_amount,0) AS total_refunded_amount,
     COALESCE(cp.total_failed_amount,0) AS total_failed_amount
FROM
     {{ ref("silver_customers") }} AS sc
LEFT JOIN
     customer_orders AS co
ON
     sc.customer_id = co.customer_id 
LEFT JOIN
     customer_items AS ci 
ON
     sc.customer_id = ci.customer_id 
LEFT JOIN
     customer_payments AS cp 
ON
     sc.customer_id = cp.customer_id