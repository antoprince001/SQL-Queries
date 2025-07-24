-- Amazon aims to optimize the storage capacity of its 500,000 square feet warehouse by prioritizing the stocking of prime items and maintaining an equal distribution across all category types. After accommodating prime items, any remaining square footage will be utilized to stock non-prime items while still ensuring an equal balance among all category types.

-- In essence, the request is to prioritize filling the warehouse with prime items, ensuring an equal number of each category type, before allocating the remaining space to non-prime items, also maintaining an equal number of each category type.

WITH calc AS (
SELECT item_type, count(item_id) as c, sum(square_footage) as s FROM inventory
group by item_type
),
eligible_cal as (
SELECT item_type, floor(500000/s)::INT*c as item_count, (500000 - Floor(500000/s::INT)*s) as pending
FROM calc
WHERE item_type = 'prime_eligible'
)
SELECT cal.item_type, floor(pending::INT/cal.s::INT)*c as item_count 
from calc cal inner join eligible_cal ecal 
ON cal.item_type = 'not_prime' and ecal.item_type = 'prime_eligible'
union all
select item_type, item_count
from eligible_cal
order by item_type desc
