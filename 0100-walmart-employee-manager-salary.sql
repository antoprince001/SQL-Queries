-- Find employees who are earning more than their managers. Output the employee's first name along with the corresponding salary.

select e.first_name, e.salary from employee e
inner join employee me
on e.manager_id = me.id
where e.salary > me.salary
