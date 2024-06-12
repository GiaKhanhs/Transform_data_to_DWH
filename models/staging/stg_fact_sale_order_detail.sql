WITH stg_fact_order_detail__source AS ( 
  SELECT
      *
  FROM `adventureworks2019.Sales.SalesOrderDetail`
)

  , stg_fact_order_detail__redefined AS (
    SELECT 
        cast(SalesOrderID AS integer) AS sales_order_line_key
        , cast(SalesOrderDetailID AS integer) AS sales_order_key
        , cast(ProductID AS integer) AS product_key
        , cast(UnitPrice AS float64) AS unit_price
        , cast(OrderQty AS integer) AS order_quantity
        , cast(UnitPriceDiscount AS float64) AS unit_price_discount
        , cast(LineTotal AS float64) AS line_total
    FROM stg_fact_order_detail__source
)
SELECT
    *
FROM stg_fact_order_detail__redefined