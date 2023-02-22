-- New TikTok users sign up with their emails and each user receives a text confirmation to activate their account. Assume you are given the below tables about emails and texts.

-- Write a query to display the ids of the users who did not confirm on the first day of sign-up, but confirmed on the second day.

SELECT DISTINCT user_id FROM emails
INNER JOIN texts
USING(email_id)
WHERE texts.action_date::DATE - emails.signup_date::DATE  = 1 AND
signup_action = 'Confirmed';

SELECT DISTINCT user_id
FROM emails 
INNER JOIN texts
  ON emails.email_id = texts.email_id
WHERE texts.action_date = emails.signup_date + INTERVAL '1 day'
  AND texts.signup_action = 'Confirmed';
