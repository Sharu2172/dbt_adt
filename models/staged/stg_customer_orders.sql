with
    customers as (
        select cust_id, cust_first_name, cust_last_name from {{ ref("raw_customers") }}
    ),
    orders as (
        select id, user_id, order_date, status
        from {{ ref("raw_orders") }}
        where status in ('completed', 'shipped')
    )

select
    c.cust_first_name as first_name,
    c.cust_last_name as last_name,
    o.order_date,
    o.status
from customers c
join orders o on o.user_id = c.cust_id
