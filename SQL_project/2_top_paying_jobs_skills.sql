
with top_paying_jobs as (
    SELECT
        job_id,
        job_title,
        name as company_name,
        salary_year_avg
    FROM
        job_postings_fact
        LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
    WHERE
        salary_year_avg is not NULL AND
        job_title_short = 'Data Analyst' AND
        job_work_from_home = true
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

select
    tpj.*,
    s.skills
FROM
    skills_job_dim as sj
    inner JOIN top_paying_jobs as tpj
    ON sj.job_id = tpj.job_id
    INNER JOIN skills_dim as s
    on sj.skill_id = s.skill_id
ORDER BY
    tpj.salary_year_avg;

