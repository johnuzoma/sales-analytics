select
    date
from {{ source('sales', 'raw_sales') }}
where date > current_date