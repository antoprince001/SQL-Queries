-- Find the number of workers by department who joined in or after April.

-- Output the department name along with the corresponding number of workers.

-- Sort records based on the number of workers in descending order.

select department, count(worker_id) as num_workers  from worker
WHERE extract(month from joining_date) >= 4 
group by department;
