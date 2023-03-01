-- Assume you are given the table below on Uber transactions made by users. Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.

WITH ranked_transactions AS(
SELECT 
 user_id, spend, transaction_date,
ROW_NUMBER() 
OVER(
PARTITION BY user_id
ORDER BY user_id, transaction_date
) as row_no
FROM transactions)

SELECT user_id, spend, transaction_date
FROM ranked_transactions
WHERE row_no = 3
;
