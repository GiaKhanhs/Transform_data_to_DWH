SELECT 
    stg_dim_territory.territory_key
    , stg_dim_territory.territory_name
    , stg_dim_territory.country_region_key
    , stg_dim_subterritory.country_region_name
    , stg_dim_territory.group_name

FROM pj2_dbt_stg.stg_dim_territory 

LEFT JOIN pj2_dbt_stg.stg_dim_subterritory
ON stg_dim_territory.country_region_key = stg_dim_subterritory.country_region_key