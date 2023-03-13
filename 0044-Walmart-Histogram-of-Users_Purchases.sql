-- Assume you are given the table on Walmart user transactions. Based on a user's most recent transaction date, write a query to obtain the users and the number of products bought.

-- Output the user's most recent transaction date, user ID and the number of products sorted by the transaction date in chronological order.

WITH agg_user_transactions AS ( SELECT  
DISTINCT transaction_date,user_id, COUNT(product_id) as purchase_count,
ROW_NUMBER() OVER(
PARTITION BY user_id
ORDER BY transaction_date DESC
) as purchase_row_n
FROM user_transactions
GROUP BY user_id, transaction_date
)

SELECT transaction_date,user_id,purchase_count
FROM agg_user_transactions
WHERE purchase_row_n = 1
ORDER BY transaction_date ;
