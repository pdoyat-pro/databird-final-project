SELECT stocks.stock_id,
    stocks.store_id, 
    stores.store_name,
    stocks.product_id, 
    p.product_name,
    stocks.stock_quantity
FROM {{ ref('stg_local_bike__stocks') }} AS stocks
left join {{ ref('stg_local_bike__stores') }} AS stores on stocks.store_id = stores.store_id
left join {{ ref('stg_local_bike__products') }} AS p on p.product_id = stocks.product_id