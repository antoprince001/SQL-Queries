-- Workers With The Highest Salaries

select worker_title from worker w inner join title t on w.worker_id = t.worker_ref_id 
where salary in (select max(salary)
from worker)
