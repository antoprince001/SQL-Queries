# Companies often perform salary analyses to ensure fair compensation practices. One useful analysis is to check if there are any employees earning more than their direct managers.

SELECT e.employee_id, e.name as employee_name FROM employee e
inner join employee et 
ON e.manager_id = et.employee_id
WHERE e.salary > et.salary
