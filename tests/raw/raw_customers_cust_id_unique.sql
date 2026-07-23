select customer_id
from {{ ref('raw_customers') }}
group by customer_id
having count(*) > 1