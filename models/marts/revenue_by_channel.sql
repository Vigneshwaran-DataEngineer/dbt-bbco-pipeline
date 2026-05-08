select
    source_channel,
    count(*) as total_orders,
    sum(total_price) as gross_revenue,
    sum(total_discounts) as total_discounts,
    sum(net_revenue) as net_revenue,
    avg(net_revenue) as avg_order_value
from {{ ref('stg_orders') }}
where data_quality_flag is null
group by source_channel