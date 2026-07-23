with renamed as (
select id
, orderid
, paymentmethod
, amount
, status
, created
from {{ source('raw_stripe', 'payment') }}
)

select *
from renamed