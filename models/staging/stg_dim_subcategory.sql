WITH stg_subcategory__source AS (
    SELECT 
        * 
    FROM `adventureworks2019.Production.ProductSubcategory`
)

    , stg_subcategory__redefined AS (
    SELECT 
        safe_cast(ProductSubcategoryID AS integer) AS product_subcategory_key
        , safe_cast(Name AS string) AS product_subcategory_name
        , safe_cast(ProductCategoryID AS integer) AS product_category_key
    FROM stg_subcategory__source
)

SELECT
    *
FROM stg_subcategory__redefined