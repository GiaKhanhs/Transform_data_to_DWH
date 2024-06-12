WITH stg_category__source AS (
    SELECT 
        * 
    FROM `adventureworks2019.Production.ProductCategory`
)

    , stg_category__redefined AS (
    SELECT 
        cast(ProductCategoryID AS integer) AS product_category_key
        , cast(Name AS string) AS product_category_name
    FROM stg_category__source
)

SELECT
    *
FROM stg_category__redefined