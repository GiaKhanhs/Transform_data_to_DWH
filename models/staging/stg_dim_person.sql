WITH dim_person__source AS (
    SELECT *
    FROM `adventureworks2019.Person.Person`
)

    , dim_person__redefined AS (
    SELECT 
        cast(PersonType AS string) AS customer_person_title
        , cast(FirstName AS string) AS first_name
        , cast(MiddleName AS string) AS middle_name
        , cast(LastName AS string) AS last_name
        , cast(BusinessEntityID AS integer) AS PersonID
        , cast(NameStyle AS integer) AS style
        , cast(Title AS string) sales_person_title
    FROM dim_person__source
)

SELECT *
FROM dim_person__redefined