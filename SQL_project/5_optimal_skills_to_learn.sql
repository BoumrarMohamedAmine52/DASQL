

with count_demands as (
    select 
        s.skill_id,
        skills as skill,
        count(s.skill_id) as skill_number_of_demands
    FROM 
        job_postings_fact as jpf
        INNER JOIN skills_job_dim as sj on jpf.job_id = sj.job_id
        INNER JOIN skills_dim as s on sj.skill_id = s.skill_id
    WHERE
        job_location = 'Anywhere' AND
        job_title_short = 'Data Analyst' AND
        salary_year_avg is not NULL
    group by 
        s.skill_id
), average_salary as (
    select 
        s.skill_id,
        skills as skill,
        round(avg(salary_year_avg), 0) as skill_avg_salary
    FROM 
        job_postings_fact as jpf
        INNER JOIN skills_job_dim as sj on jpf.job_id = sj.job_id
        INNER JOIN skills_dim as s on sj.skill_id = s.skill_id
    WHERE
        job_location = 'Anywhere' AND
        job_title_short = 'Data Analyst' AND
        salary_year_avg is not NULL
    group by 
        s.skill_id
)

SELECT
    count_demands.skill_id,
    count_demands.skill,
    skill_number_of_demands,
    skill_avg_salary
FROM
    count_demands INNER JOIN average_salary
    on count_demands.skill_id = average_salary.skill_id
order BY
    skill_number_of_demands DESC,
    skill_avg_salary DESC
limit 10;
