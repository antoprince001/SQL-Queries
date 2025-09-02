-- Given a table containing information about bank deposits and withdrawals made using Paypal, write a query to retrieve the final account balance for each account, taking into account all the transactions recorded in the table with the assumption that there are no missing transactions.

SELECT account_id,
SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE amount*-1 END)
FROM transactions
group by account_id;
