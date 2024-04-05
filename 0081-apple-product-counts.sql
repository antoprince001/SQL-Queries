-- Find the number of Apple product users and the number of total users with a device and group the counts by language. 
-- Assume Apple products are only MacBook-Pro, iPhone 5s, and iPad-air. Output the language along with the total number of Apple users and users with any device. 
-- Order your results based on the number of total users in descending order.


select 
language,
count(distinct
case when pe.device in ('macbook pro', 'iphone 5s','ipad air') THEN pu.user_id ELSE NULL END 
) n_apple_users,
count(distinct pu.user_id ) n_total_users
from playbook_users pu inner join playbook_events pe 
on pu.user_id = pe.user_id
group by language
order by n_total_users desc;
