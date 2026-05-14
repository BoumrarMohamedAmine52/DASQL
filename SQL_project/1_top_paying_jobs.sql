--- top highest paid Data analyst jobs that are available remotly 

SELECT
    job_id,
    job_title,
    name as comapy_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
    LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE
    salary_year_avg is not NULL AND
    job_title_short = 'Data Analyst' AND
    job_work_from_home = true
ORDER BY
    salary_year_avg DESC
LIMIT 10;