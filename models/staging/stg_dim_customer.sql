WITH dim_customer__source AS (
    SELECT 
    *
    , CASE
        WHEN PersonID = 'NULL'THEN '-1'
        ELSE PersonID
      END AS new_PersonID
    , CASE 
        WHEN StoreID = 'NULL' THEN '-1'
        ELSE StoreID
      END AS new_StoreID
    , CASE 
        WHEN StoreID IS NOT NULL THEN 'TRUE'
        ELSE 'FALSE'
      END AS is_reseller
    FROM `adventureworks2019.Sales.Customer`
)

    , dim_customer__redefined AS (
    SELECT 
        cast(CustomerID AS integer) AS customer_key
        , cast(new_StoreID AS integer) AS reseller_store_key
        , cast(TerritoryID AS integer) AS customer_territory_key
        , cast(new_PersonID AS integer) AS PersonID
        , is_reseller
    FROM dim_customer__source
)

SELECT 
    *
FROM dim_customer__redefined
