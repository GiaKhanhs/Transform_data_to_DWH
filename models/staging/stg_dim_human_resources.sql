WITH stg_human_resources__source AS (
    SELECT *
    FROM `adventureworks2019.HumanResources.Employee`
)

    , stg_human_resources__redefined AS (
        SELECT
            cast(BusinessEntityID AS integer) AS sales_person_key
            , cast(JobTitle AS string) AS job_title
            , cast(Gender AS string) AS gender
        FROM stg_human_resources__source
)

SELECT *
FROM stg_human_resources__redefined