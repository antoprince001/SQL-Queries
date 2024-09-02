select max(salary) as salary from (
select id,
dense_rank() over (order by salary desc ) as salary_rank,
salary
from employee) wnd_sal
where wnd_sal.salary_rank = 2;
