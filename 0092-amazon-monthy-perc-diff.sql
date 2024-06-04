-- Given a table of purchases by date, calculate the month-over-month percentage change in revenue. The output should include the year-month date (YYYY-MM) and percentage change, rounded to the 2nd decimal point, and sorted from the beginning of the year to the end of the year.
-- The percentage change column will be populated from the 2nd month forward and can be calculated as ((this month's revenue - last month's revenue) / last month's revenue)*100.

with year_monthly as (
select *, 
TO_CHAR(created_at, 'YYYY-MM') AS year_month from sf_transactions
),

revenue as (
select year_month, sum(value) as total_revenue from year_monthly
group by year_month
order by year_month
),
complete_revenue as (
select year_month, total_revenue,
LAG (total_revenue, 1)
OVER (ORDER BY year_month) AS prev_revenue
from revenue
)

select year_month, round(((total_revenue - prev_revenue)/prev_revenue)*100,2) as revenue_diff_pct

from complete_revenue
order by year_month
  
-- new way of using Window
SELECT to_char(created_at::date, 'YYYY-MM') AS year_month,
       round(((sum(value) - lag(sum(value), 1) OVER w) / (lag(sum(value), 1) OVER w)) * 100, 2) AS revenue_diff_pct
FROM sf_transactions
GROUP BY year_month 
WINDOW w AS (
    ORDER BY to_char(created_at::date, 'YYYY-MM'))
ORDER BY year_month ASC
