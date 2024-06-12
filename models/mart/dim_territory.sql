SELECT 
    *
FROM {{ ref('stg_dim_territory') }}
LEFT JOIN {{ ref('stg_dim_subterritory') }}
USING (country_region_key)