{{ config(
    materialized='ephemeral' if target.name == 'dev' else 'table'
) }}

with customer_orders as (
    select *
    from {{ ref('stg_customer_orders') }}
)
, payment_orders as (
    select *
    from {{ ref('stg_payment_orders') }}
)

select o.customer_name
, o.order_date
, o.order_status
, p.paymentmethod
, count(*) as order_count
, SUM(p.amount) as total
, MAX(p.amount) as max
, MIN(p.amount) as min
, ROUND(AVG(p.amount), 2) as avg
from customer_orders o
join payment_orders p on o.customer_id = p.customer_id
and o.order_date = p.order_date
and o.order_status = p.order_status
group by o.customer_id, o.customer_name, o.order_date, o.order_status, p.paymentmethod
