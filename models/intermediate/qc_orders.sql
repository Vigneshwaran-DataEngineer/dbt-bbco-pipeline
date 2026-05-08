select
    order_id,
    "Revenue mismatch" as reason,
    net_revenue as actual,
    (total_price - total_discounts) as expected
from {{ ref('stg_orders') }}
where abs(net_revenue - (total_price - total_discounts)) > 0.01

union all

select
    order_id,
    "Invalid total_price",
    total_price,
    null
from {{ ref('stg_orders') }}
where total_price <= 0

union all

select
    order_id,
    "Invalid quantity",
    quantity,
    null
from {{ ref('stg_orders') }}
where quantity <= 0