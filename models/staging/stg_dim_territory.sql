WITH stg_territory__source AS (
    SELECT 
        sale.TerritoryID 
        , sale.Name 
        , sale.CountryRegionCode 
        , sale.Group
    FROM `adventureworks2019.Sales.SalesTerritory` sale
)

    , stg_territory__redefined AS (
    SELECT
        cast(sale.TerritoryID  AS integer) AS territory_key
        , cast(sale.Name  AS string) AS territory_name
        , cast(sale.CountryRegionCode  AS string) AS country_region_key
        , cast(sale.Group AS string) AS group_name
    FROM stg_territory__source sale
)

SELECT *
FROM stg_territory__redefined