with renamed as (
select id as payment_id
, orderid as order_id
, paymentmethod
, amount
, status as payment_status
, created as payment_date
from {{ source('raw_stripe', 'payment') }}
)

select *
from renamed