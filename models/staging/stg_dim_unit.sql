WITH stg_unit__source AS (
    SELECT 
        * 
    FROM `adventureworks2019.Production.UnitMeasure`
)

    , stg_unit__redefined AS (
    SELECT 
        cast(UnitMeasureCode AS string) AS unit_measure_key
        , cast(Name AS string) AS unit_measure_name
    FROM stg_unit__source
)

SELECT 
    *
FROM stg_unit__redefined
