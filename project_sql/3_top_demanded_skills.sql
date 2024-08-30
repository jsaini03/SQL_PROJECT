/*
Question: What are the most in-demand skills for data analyst jobs?
- Join job postings to inner join table similar to query2
- Identify the top 5 in-demand skills for Data Analyst.
- Focus on all job postings.
- Why? Retrieves top 5 skills with highest demand in the job market,
    providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills,
    count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim on skills_dim.skill_id= skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location = 'Austin, TX'
GROUP BY 
    skills
ORDER BY
    demand_count DESC
Limit 5