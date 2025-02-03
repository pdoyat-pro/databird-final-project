WITH sales_by_product AS (

SELECT
    product_id,
    SUM(item_quantity) AS total_sales_volume,
    SUM(total_order_item_amount) AS total_sales_amount,
FROM {{ ref('int_local_bike__order_items') }} 
GROUP BY product_id

)

SELECT
    p.product_id,
    p.product_name,
    p.category_name,
    p.brand_name,
    s.total_sales_volume,
    s.total_sales_amount
    
FROM {{ ref('int_local_bike__products') }} as p
left join sales_by_product as s ON s.product_id = p.product_id