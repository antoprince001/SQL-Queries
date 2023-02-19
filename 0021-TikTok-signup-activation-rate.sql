-- New TikTok users sign up with their emails. They confirmed their signup by replying to the text confirmation to activate their accounts. Users may receive multiple text messages for account confirmation until they have confirmed their new account.

-- Write a query to find the activation rate of the users. Round the percentage to 2 decimal places.

SELECT 
ROUND(1.0*
SUM(
  CASE WHEN signup_action = 'Confirmed' THEN 1 ELSE 0 END
)/
(SELECT count(email_id) FROM emails)
,2)
FROM texts;
