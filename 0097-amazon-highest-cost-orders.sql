-- Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. If customer had more than one order on a certain day, sum the order costs on daily basis. Output customer's first name, total cost of their items, and the date.

select c.first_name, sum(o.total_order_cost) as total_sum, o.order_date from customers c inner join orders o
on c.id = o.cust_id
where o.order_date > '2019-02-01' and  o.order_date < '2019-05-01'
group by c.first_name, o.order_date
order by total_sum desc
limit 1
