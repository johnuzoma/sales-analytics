select
    date,
    "Target Close" --as target_close
from {{ source('sales', 'raw_sales') }}
where "Target Close" < date