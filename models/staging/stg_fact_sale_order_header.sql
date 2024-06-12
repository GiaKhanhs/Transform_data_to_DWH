WITH stg_fact_sale_order_header__source AS (
  SELECT 
      *
      , CASE 
          WHEN SalesPersonID = 'NULL' THEN '-1'
          ELSE SalesPersonID
        END AS new_SalesPersonID
  FROM `adventureworks2019.Sales.SalesOrderHeader`
)

  , stg_fact_sale_order_header__redefined AS (
    SELECT
        cast(SalesOrderID AS integer) AS sales_order_line_key
        , cast(CustomerID AS integer) AS customer_key
        , cast(TerritoryID AS integer) AS sales_territory_key
        , cast(new_SalesPersonID AS integer) AS sales_person_key
        , cast(OrderDate AS datetime) AS order_date_key
        , CASE
            WHEN Status = 1 THEN 'In progress'
            WHEN Status = 2 THEN 'Approved'
            WHEN Status = 3 THEN 'Backordered'
            WHEN Status = 4 THEN 'Rejected'
            WHEN Status = 5 THEN 'Shipped'
            WHEN Status = 6 THEN 'Cancelled'
          END AS status
        , cast(BillToAddressID AS integer) AS bill_to_address_key
        , cast(ShipToAddressID AS integer) AS ship_to_address_key
        , cast(ShipMethodID AS integer) AS ship_method_key
        , cast(TaxAmt AS float64) AS tax_amount
        , cast(Freight AS float64) AS freight
    FROM stg_fact_sale_order_header__source
)

SELECT 
    *
FROM stg_fact_sale_order_header__redefined