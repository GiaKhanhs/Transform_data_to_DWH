WITH stg_subterritory__source AS (
    SELECT 
        CountryRegionCode 
        , Name 
    FROM `adventureworks2019.Person.CountryRegion`
)

    , stg_subterritory__redefined AS (
    SELECT 
        cast(CountryRegionCode AS string) AS country_region_key
        , cast(Name AS string) AS country_region_name
    FROM stg_subterritory__source
)

SELECT * 
FROM stg_subterritory__redefined