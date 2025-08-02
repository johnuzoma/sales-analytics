with cte as (
    select 
        "Lead Name", 
        count(distinct salesperson) as count_of_salesperson
    from {{ source('sales', 'raw_sales') }}
    group by 1
)

select * from cte where count_of_salesperson > 1