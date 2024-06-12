SELECT 
    date AS date_key
    , FORMAT_DATE('%Y-%m-%d', date) AS full_date
    , FORMAT_DATE('%A', date) AS day_of_week
    , FORMAT_DATE('%a', date) AS day_of_week_short
    , CASE 
        WHEN FORMAT_DATE('%A', date) IN ('Saturday', 'Sunday') THEN 'Weekend'
        ELSE 'Weekday'
     END AS is_weekday_or_weekend
    , FORMAT_DATE('%d', date) AS day_of_month
    , PARSE_DATE('%Y-%m', FORMAT_DATE('%Y-%m', date)) AS year_month
    , EXTRACT(MONTH FROM date) AS month
    , EXTRACT(DAYOFYEAR FROM date) AS day_of_the_year
    , FORMAT_DATE('%V', date) AS week_of_year
    , EXTRACT(QUARTER FROM date) AS quarter_number
    , EXTRACT(YEAR FROM date) AS year
    , EXTRACT(YEAR FROM date) AS year_number
FROM 
    UNNEST(GENERATE_DATE_ARRAY(DATE '2011-05-31', DATE '2014-06-30', INTERVAL 1 DAY)) AS date