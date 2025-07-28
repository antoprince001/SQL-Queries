-- Google's marketing team is making a Superbowl commercial and needs a simple statistic to put on their TV ad: the median number of searches a person made last year.

-- However, at Google scale, querying the 2 trillion searches is too costly. Luckily, you have access to the summary table which tells you the number of searches made last year and how many Google users fall into that bucket.

-- Write a query to report the median of searches made by a user. Round the median to one decimal point.



-- WITH searches_expanded AS (
--   SELECT searches
--   FROM search_frequency
--   GROUP BY 
--     searches, 
--     GENERATE_SERIES(1, num_users))

-- SELECT 
--   ROUND(PERCENTILE_CONT(0.50) WITHIN GROUP (
--     ORDER BY searches)::DECIMAL, 1) AS  median
-- FROM searches_expanded;

WITH cte as(
  SELECT
    *,
    SUM(num_users) OVER(ORDER BY searches) as cumsum_users,
    SUM(num_users) OVER() as tot_users
  FROM search_frequency
)

SELECT
  ROUND(AVG(searches), 1) as median
FROM cte
WHERE tot_users <= cumsum_users * 2 AND
  tot_users >= (cumsum_users - num_users) * 2
