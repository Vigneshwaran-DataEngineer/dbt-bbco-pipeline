select
    product_title,
    sum(quantity) as total_units_sold,
    sum(total_price) as total_revenue,
    avg(total_price) as avg_price
from {{ ref('stg_orders') }}
group by product_title
order by total_revenue desc