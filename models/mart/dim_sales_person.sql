SELECT 
    sales_person_key
    , sales_person_title
    , first_name
    , middle_name
    , last_name
    , job_title
    , gender
    , bonus
    , commission

FROM pj2_dbt_stg.stg_dim_sale_person a

LEFT JOIN pj2_dbt_stg.stg_dim_person b
ON a.sales_person_key = b.PersonID

LEFT JOIN pj2_dbt_stg.stg_dim_human_resources
USING (sales_person_key)
