select 
    date, 
    year(date) as year, 
    quarter(date) as quarter, 
    month(date) as month, 
    day(date) as day 
from {{ ref("stg_sales" )}} 
group by date