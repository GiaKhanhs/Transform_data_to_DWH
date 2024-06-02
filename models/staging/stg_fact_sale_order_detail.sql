WITH stg_fact_order_detail__source AS ( 
  SELECT
      *
  FROM `adventureworks2019.Sales.SalesOrderDetail`
)

  , stg_fact_order_detail__redefined AS (
    SELECT 
        safe_cast(SalesOrderID AS integer) AS sales_order_line_key
        , safe_cast(SalesOrderDetailID AS integer) AS sales_order_key
        , safe_cast(ProductID AS integer) AS product_key
        , safe_cast(UnitPrice AS float64) AS unit_price
        , safe_cast(OrderQty AS integer) AS order_quantity
        , safe_cast(UnitPriceDiscount AS float64) AS unit_price_discount
        , safe_cast(LineTotal AS float64) AS line_total
    FROM stg_fact_order_detail__source
)
SELECT
    *
FROM stg_fact_order_detail__redefined