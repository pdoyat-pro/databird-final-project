SELECT store_id,
  store_name,
  phone,
  email,
  street,
  city,
  state,
  zip_code
FROM {{ source('bike_database', 'stores') }}