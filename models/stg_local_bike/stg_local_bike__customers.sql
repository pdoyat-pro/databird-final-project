SELECT customer_id, 
  first_name,
  last_name,
  CASE WHEN phone = 'NULL' THEN null ELSE phone END AS phone,
  email, 
  street,
  city,
  state
FROM {{ source('local_bike', 'customers') }}