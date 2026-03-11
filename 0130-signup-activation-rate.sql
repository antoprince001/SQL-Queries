-- New TikTok users sign up with their emails. They confirmed their signup by replying to the text confirmation to activate their accounts. Users may receive multiple text messages for account confirmation until they have confirmed their new account.


SELECT 
    ROUND (
    SUM(CASE WHEN STATUS >= 1 THEN 1 ELSE 0 END)::NUMERIC/
    COUNT(DISTINCT user_id)
    ,2)
FROM (
SELECT e.user_id,
SUM(CASE WHEN t.signup_action = 'Confirmed'THEN 1 ELSE 0 END) AS status
FROM emails e
LEFT JOIN texts t
ON e.email_id = t.email_id
GROUP BY e.user_id
) cte

SELECT texts.email_id, emails.email_id
FROM emails
LEFT JOIN texts
  ON emails.email_id = texts.email_id
  AND texts.signup_action = 'Confirmed';
