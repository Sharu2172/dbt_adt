select cust_id
from {{ ref('raw_customers') }}
group by cust_id
having count(*) > 1