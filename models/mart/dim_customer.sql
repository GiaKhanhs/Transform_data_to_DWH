SELECT 
    customer_key
    , CASE
        WHEN style = 0
            THEN CONCAT(first_name, " ", last_name)
        ELSE CONCAT(last_name, " ", first_name)
    END AS customer_name
    , is_reseller
    , reseller_store_key
    , reseller_store_name
    , territory_key AS customer_territory_key
    , territory_name AS customer_territory_name
    , country_region_key AS customer_country_region_key
    , group_name AS customer_country_region_name
    , customer_person_title
    , first_name
    , middle_name
    , last_name
FROM pj2_dbt_stg.stg_dim_customer a

INNER JOIN pj2_dbt_stg.stg_dim_store
USING (reseller_store_key)

LEFT JOIN pj2_dbt_stg.stg_dim_territory b
ON a.customer_territory_key = b.territory_key

INNER JOIN pj2_dbt_stg.stg_dim_person
USING (PersonID)