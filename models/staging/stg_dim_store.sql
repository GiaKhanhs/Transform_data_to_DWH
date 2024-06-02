WITH dim_store__source AS (
    SELECT *
    FROM `adventureworks2019.Sales.Store`
)

    , dim_store__redefined AS (
    SELECT
        cast(BusinessEntityID AS integer) as reseller_store_key
        , cast(Name as string) as reseller_store_name
    FROM dim_store__source
)

SELECT *
FROM dim_store__redefined