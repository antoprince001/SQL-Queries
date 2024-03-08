-- Find the number of employees working in the Admin department that joined in April or later.

select count(*) as n_admins
from worker
where department = 'Admin'  and extract(month from joining_date) >= 4;
