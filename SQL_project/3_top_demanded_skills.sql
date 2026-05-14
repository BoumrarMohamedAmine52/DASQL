

with detailed_job_posting as (
    select 
        skills as skill,
        count(s.skill_id) as skill_number_of_demands
    FROM 
        job_postings_fact as jpf
        INNER JOIN skills_job_dim as sj on jpf.job_id = sj.job_id
        INNER JOIN skills_dim as s on sj.skill_id = s.skill_id
    WHERE
        job_location = 'Anywhere' AND
        job_title_short = 'Data Analyst'
    group by 
        skills
)

SELECT *
FROM 
    detailed_job_posting
ORDER BY 
    skill_number_of_demands DESC
limit 5;