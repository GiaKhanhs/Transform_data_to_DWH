WITH stg_fact_sale_order_header__source AS (
  SELECT 
      * 
  FROM `adventureworks2019.Sales.SalesOrderHeader`
)

  , stg_fact_sale_order_header__redefined AS (
    SELECT
        safe_cast(SalesOrderID AS integer) AS sales_order_line_key
        , safe_cast(CustomerID AS integer) AS customer_key
        , safe_cast(TerritoryID AS integer) AS sales_territory_key
        , safe_cast(SalesPersonID AS integer) AS sales_person_key
        , safe_cast(OrderDate AS datetime) AS order_date_key
        , CASE
            WHEN Status = 1 THEN 'In progress'
            WHEN Status = 2 THEN 'Approved'
            WHEN Status = 3 THEN 'Backordered'
            WHEN Status = 4 THEN 'Rejected'
            WHEN Status = 5 THEN 'Shipped'
            WHEN Status = 6 THEN 'Cancelled'
          END AS status
        , safe_cast(BillToAddressID AS integer) AS bill_to_address_key
        , safe_cast(ShipToAddressID AS integer) AS ship_to_address_key
        , safe_cast(ShipMethodID AS integer) AS ship_method_key
        , safe_cast(TaxAmt AS float64) AS tax_amount
        , safe_cast(Freight AS float64) AS freight
    FROM stg_fact_sale_order_header__source
)

SELECT 
    *
FROM stg_fact_sale_order_header__redefined