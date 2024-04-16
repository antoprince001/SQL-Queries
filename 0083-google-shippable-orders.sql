-- Find the percentage of shipable orders.
-- Consider an order is shipable if the customer's address is known.

select sum(case when c.address is not null THEN 1 else 0 end)*100/count(*) as percent_shippable
from orders o left join customers c
on o.cust_id = c.id;
