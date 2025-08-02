select
    lead_id,
    date,
    target_close,
    forecasted_monthly_revenue,
    opportunity_stage,
    weighted_revenue,
    closed_opportunity,
    active_opportunity,
    latest_status_entry
from {{ ref('stg_sales') }}