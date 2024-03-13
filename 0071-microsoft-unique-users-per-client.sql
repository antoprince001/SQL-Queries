
-- Write a query that returns the number of unique users per client per month


with client_user_month as (
select client_id, 
extract(month from time_id) as month, 
user_id

from fact_events)

select client_id, month, count(distinct user_id) from client_user_month
group by client_id,month;


SELECT client_id,
       EXTRACT(month from time_id) as month,
       count(DISTINCT user_id) as users_num
FROM fact_events
GROUP BY client_id,
          EXTRACT(month from time_id)

