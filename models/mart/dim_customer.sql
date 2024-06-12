SELECT 
    stg_dim_customer.customer_key
    , CASE
        WHEN style = 0
            THEN CONCAT(stg_dim_person.first_name, " ", stg_dim_person.last_name)
        ELSE CONCAT(stg_dim_person.last_name, " ", stg_dim_person.first_name)
    END AS customer_name
    , stg_dim_customer.is_reseller
    , stg_dim_customer.reseller_store_key
    , stg_dim_store.reseller_store_name
    , stg_dim_territory.territory_key AS customer_territory_key
    , stg_dim_territory.territory_name AS customer_territory_name
    , stg_dim_territory.country_region_key AS customer_country_region_key
    , stg_dim_territory.group_name AS customer_country_region_name
    , stg_dim_person.customer_person_title
    , stg_dim_person.first_name
    , stg_dim_person.middle_name
    , stg_dim_person.last_name
FROM pj2_dbt_stg.stg_dim_customer

LEFT JOIN pj2_dbt_stg.stg_dim_store
ON stg_dim_customer.reseller_store_key = stg_dim_customer.reseller_store_key

LEFT JOIN pj2_dbt_stg.stg_dim_territory
ON stg_dim_customer.customer_territory_key = stg_dim_territory.territory_key

INNER JOIN pj2_dbt_stg.stg_dim_person
ON stg_dim_customer.PersonID = stg_dim_person.PersonID