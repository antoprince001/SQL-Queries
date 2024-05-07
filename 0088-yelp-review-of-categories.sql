-- Find the top business categories based on the total number of reviews. 
-- Output the category along with the total number of reviews. Order by total reviews in descending order.

-- unnest() function is used to expand an array into a set of rows. 
-- string_to_array() function to split a string into an array based on a delimiter.

with category_names as (
select yelp_business.*,
unnest(string_to_array(categories, ';')) as category
from yelp_business
)

select category, sum(review_count) as count from category_names 
group by category
order by count desc

