with renamed as (
select id
, user_id
, order_date
, status
from {{ source("raw_jaffle_shop", "orders") }}
)

select *
from renamed