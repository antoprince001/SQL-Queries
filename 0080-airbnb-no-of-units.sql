-- Find the number of apartments per nationality that are owned by people under 30 years old.
-- Output the nationality along with the number of apartments.
-- Sort records by the apartments count in descending order.

select ah.nationality, count(distinct au.unit_id) as apartment_count
from airbnb_hosts ah inner join airbnb_units au
on ah.host_id = au.host_id and ah.age < 30 and au.unit_type  like '%Apartment%'
group by ah.nationality
order by apartment_count desc;
