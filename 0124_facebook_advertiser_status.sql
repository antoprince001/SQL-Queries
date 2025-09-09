-- You're provided with two tables: the advertiser table contains information about advertisers and their respective payment status, and the daily_pay table contains the current payment information for advertisers, and it only includes advertisers who have made payments.

-- Write a query to update the payment status of Facebook advertisers based on the information in the daily_pay table. The output should include the user ID and their current payment status, sorted by the user id.

WITH processed_summary AS (SELECT
adv.user_id,
adv.status,
CASE WHEN dp.paid IS NULL THEN 'NOT_PAID' ELSE 'PAID' END AS pay_status
FROM advertiser adv LEFT JOIN daily_pay dp
ON adv.user_id = dp.user_id
)

SELECT 
user_id,
CASE 
WHEN status = 'NEW' AND pay_status = 'PAID' THEN 'EXISTING'
WHEN status = 'NEW' AND pay_status = 'NOT_PAID' THEN 'CHURN'
WHEN status = 'EXISTING' AND pay_status = 'PAID' THEN 'EXISTING'
WHEN status = 'EXISTING' AND pay_status = 'NOT_PAID' THEN 'CHURN'
WHEN status = 'CHURN' AND pay_status = 'PAID' THEN 'RESURRECT'
WHEN status = 'CHURN' AND pay_status = 'NOT_PAID' THEN 'CHURN'
WHEN status = 'RESURRECT' AND pay_status = 'PAID' THEN 'EXISTING'
WHEN status = 'RESURRECT' AND pay_status = 'NOT_PAID' THEN 'CHURN' 
ELSE NULL END AS new_status
FROM processed_summary
UNION 
SELECT
user_id,
'NEW' AS status
FROM daily_pay
WHERE user_id not in (SELECT distinct user_id from processed_summary)
ORDER BY user_id;


SELECT 
  COALESCE(advertiser.user_id, daily_pay.user_id) AS user_id,
  CASE 
    WHEN paid IS NULL THEN 'CHURN' 
    WHEN paid IS NOT NULL AND advertiser.status IN ('NEW','EXISTING','RESURRECT') THEN 'EXISTING'
    WHEN paid IS NOT NULL AND advertiser.status = 'CHURN' THEN 'RESURRECT'
    WHEN paid IS NOT NULL AND advertiser.status IS NULL THEN 'NEW'
  END AS new_status
FROM advertiser
FULL OUTER JOIN daily_pay
  ON advertiser.user_id = daily_pay.user_id
ORDER BY user_id;
