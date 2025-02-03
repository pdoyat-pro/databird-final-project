SELECT order_id,
    o.customer_id,
    c.city,
    c.state,
    order_status,
    order_date,
    store_id,
    staff_id,
    SUM(item_quantity) AS total_quantity,
    SUM(total_order_item_amount) AS total_order_amount
FROM {{ ref('int_local_bike__order_items') }} AS o
LEFT JOIN {{ ref('stg_local_bike__customers') }} AS c ON c.customer_id = o .customer_id
GROUP BY order_id,
    customer_id,
    city,
    state,
    order_status,
    order_date,
    store_id,
    staff_id