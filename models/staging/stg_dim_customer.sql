WITH dim_customer__source AS (
    SELECT 
    *
    , CASE 
        WHEN StoreID IS NOT NULL THEN 'TRUE'
        ELSE 'FALSE'
    END AS is_reseller
    FROM `adventureworks2019.Sales.Customer`
)

    , dim_customer__redefined AS (
    SELECT 
        safe_cast(CustomerID AS integer) AS customer_key
        , safe_cast(StoreID AS integer) AS reseller_store_key
        , safe_cast(TerritoryID AS integer) AS customer_territory_key
        , safe_cast(PersonID AS integer) AS PersonID
        , is_reseller
    FROM dim_customer__source
)

SELECT *
FROM dim_customer__redefined
