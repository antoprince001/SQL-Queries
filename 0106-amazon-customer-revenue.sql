-- Calculate the total revenue from each customer in March 2019. Include only customers who were active in March 2019.
-- Output the revenue along with the customer id and sort the results based on the revenue in descending order.

select cust_id, sum(total_order_cost) as total_revenue from orders
where EXTRACT(YEAR from order_date)=2019 and EXTRACT(MONTH from order_date)=3
group by cust_id
order by total_revenue desc;
