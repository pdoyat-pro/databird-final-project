SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    b.brand_name
FROM {{ ref('stg_local_bike__products') }} AS p
LEFT JOIN {{ ref('stg_local_bike__categories')}} AS c ON c.category_id = p.category_id
LEFT JOIN {{ ref('stg_local_bike__brands') }} AS b ON b.brand_id = p.brand_id