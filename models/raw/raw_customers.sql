with
    renamed as (
        select id as customer_id, concat(last_name, first_name) as customer_name
        from {{ source("raw_jaffle_shop", "customers") }}
    )

select *
from renamed
