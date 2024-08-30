/*
Question: What are the most optimal skills to learn (high demand & high paying?
- Identify skills in high ddemand and associated with high average salaries for Data Analyst rols
- Concentrates on remote postions/ Austin, TX location with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salary),
    offering insights for career development in data analysis
*/

WITH skills_demand As (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) as demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON  job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL 
        
    GROUP BY 
        skills_dim.skill_id  
), average_salary As (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg),0) as avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON  job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL
        
    GROUP BY 
        skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE 
    demand_count > 50
ORDER BY   
    demand_count DESC,
    avg_salary DESC
LIMIT 100


-- rewriting more concisely

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) as demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) as avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id= skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id= skills_dim.skill_id
WHERE
    job_title_short ='Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY   
    skills_dim.skill_id
HAVING
    COUNT (skills_job_dim.job_id)> 450
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT 50