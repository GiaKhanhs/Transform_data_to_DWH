WITH stg_model__source AS (
    SELECT 
        * 
    FROM `adventureworks2019.Production.ProductModel`
)

    , stg_model__redefined AS (
    SELECT 
        cast(ProductModelID AS integer) AS product_model_key
        , cast(Name AS string) AS product_model_name
    FROM stg_model__source
)

SELECT
    *
FROM stg_model__redefined