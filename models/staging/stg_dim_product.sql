WITH stg_product__source AS (
    SELECT 
        *
        , CASE
            WHEN MakeFlag = 0 THEN 'Product is purchased'
            ELSE 'Product is manufactured in-house'
        END AS make_flag
        , CASE
            WHEN FinishedGoodsFlag = 0 THEN 'Product is not a salable item'
            ELSE 'Product is salable'
        END AS finished_goods_flag
    FROM `adventureworks2019.Production.Product`
)

    , stg_product__redefined AS (
    SELECT
        safe_cast(ProductID AS integer) AS product_key
        , safe_cast(Name AS string) AS product_name
        , safe_cast(size AS string) AS size
        , safe_cast(color AS string) AS color
        , safe_cast(Weight AS decimal) AS weight
        , safe_cast(SafetyStockLevel AS bigint) AS safety_stock_level
        , safe_cast(StandardCost AS decimal) AS standard_code
        , safe_cast(ListPrice AS float64) AS list_price
        , safe_cast(SizeUnitMeasureCode AS string) AS size_unit_measure_key
        , safe_cast(WeightUnitMeasureCode	AS string) AS weight_unit_measure_key
        , safe_cast(StandardCost AS float64) AS standard_cost
        , safe_cast(ProductSubcategoryID AS integer) AS product_subcategory_key
        , safe_cast(ProductModelID AS integer) AS product_model_key
        , make_flag
        , finished_goods_flag
    FROM stg_product__source
)

SELECT  
    *
FROM stg_product__redefined