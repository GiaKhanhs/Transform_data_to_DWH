SELECT 
    stg_dim_sale_person.sales_person_key
    , stg_dim_person.sales_person_title
    , stg_dim_person.first_name
    , stg_dim_person.middle_name
    , stg_dim_person.last_name
    , stg_dim_human_resources.job_title
    , stg_dim_human_resources.gender
    , stg_dim_sale_person.bonus
    , stg_dim_sale_person.commission

FROM pj2_dbt_stg.stg_dim_sale_person

LEFT JOIN pj2_dbt_stg.stg_dim_person
ON stg_dim_sale_person.sales_person_key = stg_dim_person.PersonID

LEFT JOIN pj2_dbt_stg.stg_dim_human_resources
ON stg_dim_sale_person.sales_person_key = stg_dim_human_resources.sales_person_key
