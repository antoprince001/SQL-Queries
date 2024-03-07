-- Find order details made by Jill and Eva.
-- Consider the Jill and Eva as first names of customers.
-- Output the order date, details and cost along with the first name.
-- Order records based on the customer id in ascending order.

select customers.first_name , order_date,order_details, total_order_cost
from customers inner join orders on customers.id = orders.cust_id and customers.first_name in ('Jill','Eva') order by customers.id;
