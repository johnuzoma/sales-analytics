select
    lead_id as id,
    salesperson,
    segment,
    region
from {{ ref('stg_sales') }}
group by lead_id, salesperson, segment, region