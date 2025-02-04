SELECT customer_id,
    city,
    state,
    COUNT(order_id) as nb_orders,
    SUM(total_order_amount) as total_sales_amount,
    SUM(total_quantity) AS total_sales_volume,
    AVG(total_order_amount) as avg_shopping_basket,
    SUM(total_order_amount)/SUM(total_quantity) as avg_item_price,
FROM {{ ref('int_local_bike__orders' )}} 
GROUP BY customer_id,
    city,
    state