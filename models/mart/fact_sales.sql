WITH fact_sale__join AS (
    SELECT 
        *
    FROM pj2_dbt_stg.stg_fact_sale_order_detail

    LEFT JOIN pj2_dbt_stg.stg_fact_sale_order_header
    USING(sales_order_line_key)
)

    , fact_sale__calculate AS (
    SELECT
        SUM(line_total) AS sub_total
    FROM fact_sale__join
    GROUP BY sales_order_line_key
)

SELECT 
    *
    , sub_total
    , (unit_price * (1 - unit_price_discount) * order_quantity) AS gross_amount
    , (sub_total + tax_amount + freight) AS total_due
FROM fact_sale__join