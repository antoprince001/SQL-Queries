-- Calculate each user's average session time. A session is defined as the time difference between a page_load and page_exit. 
-- For simplicity, assume a user has only 1 session per day and if there are multiple of the same events on that day, consider only the latest page_load and earliest page_exit
--   , with an obvious restriction that load time event should happen before exit time event . Output the user_id and their average session time.

-- self join, use of case when

with all_user_sessions as (
select 
    fwl1.user_id,
    fwl2.timestamp,
    min(fwl2.timestamp::timestamp) - max(fwl1.timestamp::timestamp) 
    as session_duration 
    from facebook_web_log fwl1 inner join facebook_web_log fwl2 
    on fwl1.user_id = fwl2.user_id 
    where fwl1.action = 'page_load' and fwl2.action = 'page_exit' 
    and fwl2.timestamp > fwl1.timestamp 
    group by fwl1.user_id, fwl2.timestamp 
)

select user_id, avg(session_duration)
from all_user_sessions group by user_id;
