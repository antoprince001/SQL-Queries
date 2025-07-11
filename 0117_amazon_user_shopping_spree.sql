--  In an effort to identify high-value customers, Amazon asked for your help to obtain data about users who go on shopping sprees. A shopping spree occurs when a user makes purchases on 3 or more consecutive days.

-- List the user IDs who have gone on at least 1 shopping spree in ascending order.

WITH next_previous_transaction AS (
SELECT 
*,
LAG(transaction_date) OVER(PARTITION BY user_id ORDER BY transaction_date) AS previous_date,
LEAD(transaction_date) OVER(PARTITION BY user_id ORDER BY transaction_date) AS next_date
FROM transactions
)

SELECT user_id FROM (
SELECT *,
CASE WHEN next_date is not null and previous_date is not NULL 
AND (date(transaction_date) - date(previous_date) = 1) 
AND (date(next_date) - date(transaction_date) = 1) 
THEN True
 ELSE NULL END AS consecutive
FROM next_previous_transaction
) t 
WHERE consecutive is not null and consecutive is TRUE;




-- diff - previous date -  next date  (lag, lead)

-- if count = < 2
-- then True


SELECT DISTINCT T1.user_id
FROM transactions AS T1
INNER JOIN transactions AS T2
  ON DATE(T2.transaction_date) = DATE(T1.transaction_date) + 1
INNER JOIN transactions AS T3
  ON DATE(T3.transaction_date) = DATE(T1.transaction_date) + 2
ORDER BY T1.user_id;
