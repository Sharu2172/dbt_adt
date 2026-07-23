with orders as (
    select *
    from {{ ref('raw_orders') }}
)
, payment as (
    select *
    from {{ ref('raw_payment') }}
)

select o.customer_id
, o.order_date
, o.order_status
, p.paymentmethod
, p.amount
, p.payment_status
, p.payment_date
from orders o
join payment p on o.order_id = p.order_id