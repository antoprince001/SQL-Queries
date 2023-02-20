-- Assume you are given the table below that shows job postings for all companies on the LinkedIn platform. Write a query to get the number of companies that have posted duplicate job listings.

SELECT count(company_id) as co_w_duplicate_jobs
FROM (
SELECT company_id
FROM job_listings
GROUP BY company_id, title, description
HAVING count(job_id) > 1
) AS duplicate_job_listings;


SELECT COUNT(DISTINCT company_id) AS co_w_duplicate_jobs
FROM (
  SELECT 
    company_id, 
    title, 
    description, 
    COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY 
    company_id, 
    title, 
    description) AS jobs_grouped
WHERE job_count > 1;
