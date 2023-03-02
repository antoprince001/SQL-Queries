-- Assume you are given the tables below containing information on Snapchat users, their ages, and their time spent sending and opening snaps. Write a query to obtain a breakdown of the time spent sending vs. opening snaps (as a percentage of total time spent on these activities) for each age group.

-- Output the age bucket and percentage of sending and opening snaps. Round the percentage to 2 decimal places.

WITH time_by_user_id AS (SELECT 
user_id,
SUM(
CASE 
WHEN activity_type = 'open' THEN time_spent
ELSE 0
END
) as time_opening,
SUM(
CASE 
WHEN activity_type = 'send' THEN time_spent
ELSE 0
END
) as time_sending
FROM activities
GROUP BY user_id)

SELECT age_bucket,
ROUND(100.0*time_sending/(time_sending + time_opening),2) as send_perc,
ROUND(100.0*time_opening/(time_sending + time_opening),2)  as open_perc
FROM time_by_user_id INNER JOIN age_breakdown USING(user_id)
ORDER BY age_bucket;
