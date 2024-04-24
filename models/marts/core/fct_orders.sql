with payments as (
    select * from {{ ref('stg_payments') }}
     WHERE status ='success'
),

orders as (
     select * from {{ ref ('stg_orders') }}
    
    
),

final as (
    select 
    o.customer_id,
    o.order_id,
    p.amount

    FROM payments as p
    JOIN orders as o ON p.orderid = o.order_id
    ORDER BY customer_id

)

select * from final 
