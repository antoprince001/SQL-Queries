-- Calls to the Advocate4Me call centre are categorised, but sometimes they can't fit neatly into a category. These uncategorised calls are labelled “n/a”, or are just empty (when a support agent enters nothing into the category field).

-- Write a query to find the percentage of calls that cannot be categorised. Round your answer to 1 decimal place.

SELECT 
ROUND( 
100.0*
SUM(
CASE 
WHEN call_category = 'n/a' OR call_category IS NULL THEN 1
ELSE 0
END
)/COUNT(case_id),1)
FROM callers;
