select
    financial_status,
    count(*) as order_count,
    sum(total_price) as gross_revenue,
    count(*) / sum(count(*)) over() as pct_orders
from {{ ref('stg_orders') }}
group by financial_status