-- Find the highest target achieved by the employee or employees who works under the manager id 13. Output the first name of the employee and target achieved. The solution should show the highest target achieved under manager_id=13 and which employee(s) achieved it.

with target_by_employee as (
select first_name, target from salesforce_employees
where manager_id = 13
)
select * from target_by_employee
where target = (select max(target) from target_by_employee)
