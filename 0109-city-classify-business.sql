-- Classify each business as either a restaurant, cafe, school, or other.

-- Output the business name and their classification.

select 
distinct business_name,
case 
when business_name ilike '%restaurant%' then 'restaurant' 
when business_name ilike '%cafe%' or business_name ilike '%café%'  or business_name ilike '%coffee%' then 'cafe' 
when business_name ilike '%school%' then 'school' 
else 'other' end as classification

from sf_restaurant_health_violations;
