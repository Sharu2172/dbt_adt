with orders as (
    select id as order_id
    , user_id
    , order_date
    , status as order_status
    from {{ ref('raw_orders') }}
)
, payment as (
    select id as payment_id
    , orderid as order_id
    , paymentmethod
    , amount
    , status as payment_status
    , created as payment_date
    from {{ ref('raw_payment') }}
)

select o.user_id
, o.order_date
, o.order_status
, p.paymentmethod
, p.amount
, p.payment_status
, p.payment_date
from orders o
join payment p on o.order_id = p.order_id