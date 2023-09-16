-- Find the average profit for major banks

select company, avg(sales) from forbes_global_2010_2014  where industry = 'Major Banks' group by company;
