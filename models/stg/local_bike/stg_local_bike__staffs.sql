SELECT staff_id, 
  first_name,
  last_name,
  email,
  phone,
  CASE WHEN active = 1 THEN true ELSE false END AS is_active,
  store_id,
  CASE WHEN manager_id = 'NULL' THEN null ELSE manager_id END as manager_id
FROM {{ source('local_bike', 'staffs') }}