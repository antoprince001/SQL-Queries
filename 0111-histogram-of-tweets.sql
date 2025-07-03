# Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.
# group the users by the number of tweets they posted in 2022 and count the number of users in each group.

select tweet_bucket, count(user_id)
FROM (
SELECT user_id, count(tweet_id) as tweet_bucket
FROM tweets
where extract(YEAR from tweet_date) = 2022
group by user_id
) tw
GROUP BY tw.tweet_bucket
Order by tweet_bucket
