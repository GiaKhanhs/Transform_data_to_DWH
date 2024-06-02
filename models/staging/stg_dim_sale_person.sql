WITH stg_sale_person__source AS (
    SELECT *
    FROM `adventureworks2019.Sales.SalesPerson`
)

    , stg_sale_person__redefined AS (
        SELECT 
            cast(BusinessEntityID AS integer) AS sales_person_key
            , cast(Bonus AS float64) AS bonus
            , cast(CommissionPct AS float64) AS commission 
        FROM stg_sale_person__source
)

SELECT *
FROM stg_sale_person__redefined