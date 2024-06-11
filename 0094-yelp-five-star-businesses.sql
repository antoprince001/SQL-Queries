-- Find the top 5 states with the most 5 star businesses. Output the state name along with the number of 5-star businesses and order records by the number of 5-star businesses in descending order. 
-- In case there are ties in the number of businesses, return all the unique states. If two states have the same result, sort them in alphabetical order.

WITH state_counts AS (
    SELECT state, COUNT(*) AS five_star_business_count
    FROM yelp_business
    WHERE stars = 5
    GROUP BY state
),
ranked_states AS (
    SELECT state, five_star_business_count,
           RANK() OVER (ORDER BY five_star_business_count DESC) AS rank
    FROM state_counts
)
SELECT state, five_star_business_count
FROM ranked_states
WHERE rank <= 5;


SELECT state, total FROM (
    SELECT state, COUNT(stars) AS "total", RANK() OVER (ORDER BY COUNT(stars) DESC) AS "ranked"
    FROM yelp_business
    WHERE stars = 5
    GROUP BY state
    ORDER BY total DESC, state
) sub
WHERE sub.ranked <= 5;

