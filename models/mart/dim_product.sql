SELECT 
    stg_dim_product.product_key
  , stg_dim_product.product_name
  , stg_dim_product.make_flag
  , stg_dim_product.finished_goods_flag
  , stg_dim_product.product_subcategory_key
  , stg_dim_subcategory.product_subcategory_name
  , stg_dim_category.product_category_key
  , stg_dim_category.product_category_name
  , stg_dim_product.product_model_key
  , stg_dim_model.product_model_name
  , stg_dim_product.size_unit_measure_key
  , stg_dim_product.color
  , stg_dim_product.weight
  , stg_dim_product.size
  , stg_dim_product.safety_stock_level
  , stg_dim_product.standard_cost
  , stg_dim_product.list_price
  , stg_dim_unit.unit_measure_name AS size_unit_measure_name
  , stg_dim_unit.unit_measure_name AS weight_unit_measure_name

FROM pj2_dbt_stg.stg_dim_product 

LEFT JOIN pj2_dbt_stg.stg_dim_unit
ON stg_dim_product.size_unit_measure_key = stg_dim_unit.unit_measure_name

LEFT JOIN pj2_dbt_stg.stg_dim_unit AS weight_unit
ON stg_dim_product.weight_unit_measure_key = weight_unit.unit_measure_name

LEFT JOIN pj2_dbt_stg.stg_dim_model 
ON stg_dim_product.product_model_key = stg_dim_model.product_model_key

LEFT JOIN pj2_dbt_stg.stg_dim_subcategory
ON stg_dim_product.product_subcategory_key = stg_dim_subcategory.product_subcategory_key

LEFT JOIN pj2_dbt_stg.stg_dim_category
ON stg_dim_subcategory.product_category_key = stg_dim_category.product_category_key
