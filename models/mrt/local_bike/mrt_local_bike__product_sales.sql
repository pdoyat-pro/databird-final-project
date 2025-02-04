WITH sales_by_product AS (

SELECT
    product_id,
    FORMAT_DATE('%Y-%m', order_date) AS order_month,  
    SUM(item_quantity) AS total_sales_volume,
    SUM(total_order_item_amount) AS total_sales_amount,
FROM {{ ref('int_local_bike__order_items') }} 
GROUP BY product_id, order_month

)

SELECT
    p.product_id,
    p.product_name,
    p.category_name,
    p.brand_name,
    s.order_month,
    s.total_sales_volume,
    s.total_sales_amount
    
FROM {{ ref('int_local_bike__products') }} AS p
LEFT JOIN sales_by_product AS s ON s.product_id = p.product_id
ORDER BY s.order_month DESC, s.total_sales_volume DESC