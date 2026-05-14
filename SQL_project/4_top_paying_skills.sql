

with detailed_job_posting as (
    select 
        skills as skill,
        avg(salary_year_avg) as skill_avg_salary
    FROM 
        job_postings_fact as jpf
        INNER JOIN skills_job_dim as sj on jpf.job_id = sj.job_id
        INNER JOIN skills_dim as s on sj.skill_id = s.skill_id
    WHERE
        job_location = 'Anywhere' AND
        job_title_short = 'Data Analyst' AND
        salary_year_avg is not NULL
    group by 
        skills
)

SELECT *
FROM 
    detailed_job_posting
ORDER BY 
    skill_avg_salary DESC
limit 10;