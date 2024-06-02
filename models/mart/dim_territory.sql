SELECT 
    *
FROM pj2_dbt_stg.stg_dim_territory
LEFT JOIN pj2_dbt_stg.stg_dim_subterritory
USING (country_region_key)