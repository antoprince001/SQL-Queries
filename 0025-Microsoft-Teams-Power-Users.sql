-- Write a query to find the top 2 power users who sent the most messages on Microsoft Teams in August 2022. Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending count of the messages.

SELECT sender_id,count(sent_date) as message_count 
FROM messages
WHERE EXTRACT(year from sent_date) = 2022
and EXTRACT(month from sent_date) = 8
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;
