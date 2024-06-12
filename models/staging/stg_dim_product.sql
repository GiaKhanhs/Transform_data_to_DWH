WITH stg_product__source AS (
    SELECT 
        *
        , CASE
            WHEN size = 'NULL' THEN 'UNDEFINED'
            ELSE size
          END AS new_size 
        , CASE
            WHEN color = 'NULL' THEN 'UNDEFINED'
            ELSE color
          END AS new_color
        , CASE
            WHEN SizeUnitMeasureCode = 'NULL' THEN 'UNDEFINED'
            ELSE SizeUnitMeasureCode
          END AS new_SizeUnitMeasureCode
        , CASE
            WHEN WeightUnitMeasureCode = 'NULL' THEN 'UNDEFINED'
            ELSE WeightUnitMeasureCode
          END AS new_WeightUnitMeasureCode
        , CASE 
            WHEN Weight = 'NULL' THEN '-1'
            ELSE Weight
          END AS new_Weight
        , CASE 
            WHEN ProductSubcategoryID = 'NULL' THEN '-1'
            ELSE ProductSubcategoryID
          END AS new_ProductSubcategoryID
        , CASE 
            WHEN ProductModelID = 'NULL' THEN '-1'
            ELSE ProductModelID
          END AS new_ProductModelID
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
        cast(ProductID AS integer) AS product_key
        , cast(Name AS string) AS product_name
        , cast(new_size AS string) AS size
        , cast(new_color AS string) AS color
        , cast(new_Weight AS decimal) AS weight
        , cast(SafetyStockLevel AS bigint) AS safety_stock_level
        , cast(StandardCost AS decimal) AS standard_code
        , cast(ListPrice AS float64) AS list_price
        , cast(new_SizeUnitMeasureCode AS string) AS size_unit_measure_key
        , cast(new_WeightUnitMeasureCode	AS string) AS weight_unit_measure_key
        , cast(StandardCost AS float64) AS standard_cost
        , cast(new_ProductSubcategoryID AS integer) AS product_subcategory_key
        , cast(new_ProductModelID AS integer) AS product_model_key
        , make_flag
        , finished_goods_flag
    FROM stg_product__source
)

SELECT  
    *
FROM stg_product__redefined