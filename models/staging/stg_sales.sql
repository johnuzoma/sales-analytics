select 
    date,
    salesperson,
    "Lead Name" as lead_id,
    segment,
    region,
    "Target Close" as target_close,
    "Forecasted Monthly Revenue" as forecasted_monthly_revenue,
    "Opportunity Stage" as opportunity_stage,
    "Weighted Revenue" as weighted_revenue,
    "Closed Opportunity" as closed_opportunity,
    "Active Opportunity" as active_opportunity,
    "Latest Status Entry" as latest_status_entry,
    cast(left(loaded_at, 19) as timestamp) as loaded_at
from {{ source("sales", "raw_sales") }}