with renamed as(
    select id as cust_id
    , first_name as cust_first_name
    , last_name as cust_last_name
    from {{ source('raw_jaffle_shop', 'customers') }}
)

select *
from renamed