-- You're given a dataset of health inspections. Count the number of violation in an inspection in 'Roxanne Cafe' for each year. 
-- If an inspection resulted in a violation, there will be a value in the 'violation_id' column. Output the number of violations by year in ascending order.



select date_part('year', inspection_date) as year,  count(distinct violation_id) as n_inspections from sf_restaurant_health_violations
where business_name = 'Roxanne Cafe' and violation_id IS NOT NULL
group by year;
