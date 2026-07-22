select id
, orderid
, paymentmethod
, status
, amount
from {{ ref("raw_payment") }}
limit 10;