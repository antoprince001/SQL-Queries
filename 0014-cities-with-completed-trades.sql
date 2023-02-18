-- You are given the tables below containing information on Robinhood trades and users. Write a query to list the top three cities that have the most completed trade orders in descending order.

WITH user_trades AS(
SELECT * from trades inner join users on trades.user_id = users.user_id
)
SELECT city, COUNT(*) as total_orders FROM user_trades WHERE status = 'Completed' GROUP BY city order by total_orders DESC LIMIT 3;
