WITH dim_join_product AS (
  SELECT 
      *
  FROM pj2_dbt_stg.stg_dim_product a

  LEFT JOIN pj2_dbt_stg.stg_dim_unit b
  ON a.size_unit_measure_key = b.unit_measure_key

  LEFT JOIN pj2_dbt_stg.stg_dim_unit c
  ON a.weight_unit_measure_key = b.unit_measure_key

  LEFT JOIN pj2_dbt_stg.stg_dim_model 
  USING(product_model_key)

  LEFT JOIN pj2_dbt_stg.stg_dim_subcategory
  USING(product_subcategory_key)

  LEFT JOIN pj2_dbt_stg.stg_dim_category
  USING(product_category_key)
)

    , dim_product_rename AS (
  SELECT
    product_key
    , product_name
    , make_flag
    , finished_goods_flag
    , product_subcategory_key
    , product_subcategory_name
    , product_category_key
    , product_category_name
    , product_model_key
    , product_model_name
    , size_unit_measure_key
    , unit_measure_name AS size_unit_measure_name
    , unit_measure_name_1 AS weight_unit_measure_name
    , weight_unit_measure_name
    , color
    , weight
    , size
    , safety_stock_level
    , standard_cost
    , list_price
  FROM dim_join_product
)

SELECT 
    *
FROM dim_product_rename

