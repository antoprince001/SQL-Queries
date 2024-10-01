-- Find the rate of processed tickets for each type.

select type, 
sum(case when processed = TRUE then 1.0 else 0 end)/count(processed) as processed_rate
from facebook_complaints
group by type;
