with
    customers as (
        select * from {{ ref("raw_customers") }}
    ),
    orders as (
        select *
        from {{ ref("raw_orders") }}
        where order_status in ('completed', 'shipped')
    )

select
    c.customer_id,
    c.customer_name,
    o.order_date,
    o.order_status
from customers c
join orders o on o.customer_id = c.customer_id
