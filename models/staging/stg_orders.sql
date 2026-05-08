{{ config(materialized='table') }}

with source as (

    select * from `dbt-demo-494910.raw_data.orders_raw`

),

deduplicated as (

    select *,
           row_number() over (partition by order_id order by created_at) as rn
    from source

),

cleaned as (

    select
        order_id,

        lower(financial_status) as financial_status,
        upper(currency) as currency,
        upper(country_code) as country_code,

        format_timestamp('%Y-%m-%d %H:%M:%S',
            coalesce(
                safe.parse_timestamp('%Y-%m-%d %H:%M:%S', created_at),
                safe.parse_timestamp('%d-%m-%Y %H:%M', created_at),
                safe.parse_timestamp('%d/%m/%Y %H:%M', created_at)
            )
        ) as created_at,

        source_channel,
        product_title,

        cast(total_price as float64) as total_price,
        cast(total_discounts as float64) as total_discounts,
        cast(net_revenue as float64) as net_revenue,
        cast(quantity as int64) as quantity,

        case 
            when financial_status is null or source_channel is null
            then 'INCOMPLETE'
            else null
        end as data_quality_flag

    from deduplicated
    where rn = 1

)

select * from cleaned