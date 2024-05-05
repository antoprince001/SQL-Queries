-- Find the average total compensation based on employee titles and gender. Total compensation is calculated by adding both the salary and bonus of each employee. However, not every employee receives a bonus so disregard employees without bonuses in your calculation. Employee can receive more than one bonus.

with emp_bonus as (
select worker_ref_id, sum(bonus) as total_bonus from sf_bonus
group by worker_ref_id
)
select
    distinct
    employee_title, 
    sex,
    avg(
    case when total_bonus is null 
        then salary 
        else (salary + total_bonus) end) as avg_compensation 
    from sf_employee inner join emp_bonus 
    on sf_employee.id = emp_bonus.worker_ref_id
    group by employee_title,sex
;
