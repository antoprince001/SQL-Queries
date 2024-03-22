-- You are given a table of product launches by company by year. Write a query to count the net difference between the number of products companies launched in 2020 with the number of products companies launched in the previous year. 
-- Output the name of the companies and a net difference of net products released for 2020 compared to the previous year.


select a.company_name, count_2020-count_2019 as net_products from (
select company_name, count(*) as count_2020 from car_launches
where year = '2020'
group by company_name) a inner join (
select company_name, count(*) as count_2019 from car_launches
where year = '2019'
group by company_name) b on a.company_name = b.company_name ;
