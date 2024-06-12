SELECT 
    stg_fact_sale_order_detail.sales_order_line_key
    , stg_fact_sale_order_detail.sales_order_key
    , stg_fact_sale_order_detail.product_key
    , stg_fact_sale_order_detail.unit_price
    , stg_fact_sale_order_detail.order_quantity
    , stg_fact_sale_order_detail.unit_price_discount
    , stg_fact_sale_order_header.customer_key
    , stg_fact_sale_order_header.sales_territory_key
    , stg_fact_sale_order_header.sales_person_key
    , stg_fact_sale_order_header.order_date_key
    , stg_fact_sale_order_header.status
    , stg_fact_sale_order_header.bill_to_address_key
    , stg_fact_sale_order_header.ship_to_address_key
    , stg_fact_sale_order_header.ship_method_key
    , stg_fact_sale_order_header.tax_amount
    , SUM(stg_fact_sale_order_detail.line_total) AS sub_total
    , (stg_fact_sale_order_detail.unit_price * (1 - stg_fact_sale_order_detail.unit_price_discount) * stg_fact_sale_order_detail.order_quantity) AS gross_amount
    , (SUM(stg_fact_sale_order_detail.line_total) + stg_fact_sale_order_header.tax_amount + stg_fact_sale_order_header.freight) AS total_due

FROM pj2_dbt_stg.stg_fact_sale_order_detail

LEFT JOIN pj2_dbt_stg.stg_fact_sale_order_header
ON stg_fact_sale_order_detail.sales_order_line_key = stg_fact_sale_order_header.sales_order_line_key

GROUP BY 
    stg_fact_sale_order_detail.sales_order_line_key
    , stg_fact_sale_order_detail.sales_order_key
    , stg_fact_sale_order_detail.product_key
    , stg_fact_sale_order_detail.unit_price
    , stg_fact_sale_order_detail.order_quantity
    , stg_fact_sale_order_detail.unit_price_discount
    , stg_fact_sale_order_header.customer_key
    , stg_fact_sale_order_header.sales_territory_key
    , stg_fact_sale_order_header.sales_person_key
    , stg_fact_sale_order_header.order_date_key
    , stg_fact_sale_order_header.status
    , stg_fact_sale_order_header.bill_to_address_key
    , stg_fact_sale_order_header.ship_to_address_key
    , stg_fact_sale_order_header.ship_method_key
    , stg_fact_sale_order_header.tax_amount
    , stg_fact_sale_order_header.freight