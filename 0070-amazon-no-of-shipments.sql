-- Write a query that will calculate the number of shipments per month. The unique key for one shipment is a combination of shipment_id and sub_id. Output the year_month in format YYYY-MM and the number of shipments in that month.
with year_month_shipment as (
select concat(shipment_id,'-',sub_id),SUBSTRING(CAST(shipment_date as varchar) FROM 1 for 7) as year_month from amazon_shipment
)
select year_month, count(*) from year_month_shipment
group by year_month


SELECT to_char(shipment_date, 'YYYY-MM') AS year_month,
       count(distinct (shipment_id, sub_id))
FROM amazon_shipment
GROUP BY 1
