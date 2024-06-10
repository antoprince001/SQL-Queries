-- Find the total number of downloads for paying and non-paying users by date. Include only records where non-paying customers have more downloads than paying customers. 
--   The output should be sorted by earliest date first and contain 3 columns date, non-paying downloads, paying downloads.

with records as (select 
    date, 
    sum(case when paying_customer = 'no' then downloads else 0 end) as non_paying,
    sum(case when paying_customer = 'yes' then downloads else 0 end) as  paying
    from ms_download_facts mdf inner join ms_user_dimension mud on 
mdf.user_id = mud.user_id inner join ms_acc_dimension mac on mud.acc_id = mac.acc_id
group by date
order by date)

select * from records where non_paying > paying;
