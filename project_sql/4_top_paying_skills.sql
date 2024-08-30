/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most rewarding skills to acquire to improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim on skills_dim.skill_id= skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
    AND job_location = 'Austin, TX'
GROUP BY 
    skills
ORDER BY
   avg_salary DESC
Limit 20

/*

Here are top 25 high paying skills for data analysts

[
  {
    "skills": "matlab",
    "avg_salary": "375000"
  },
  {
    "skills": "airflow",
    "avg_salary": "262500"
  },
  {
    "skills": "spark",
    "avg_salary": "222208"
  },
  {
    "skills": "bigquery",
    "avg_salary": "210000"
  },
  {
    "skills": "redshift",
    "avg_salary": "200000"
  },
  {
    "skills": "snowflake",
    "avg_salary": "187500"
  },
  {
    "skills": "looker",
    "avg_salary": "182200"
  },
  {
    "skills": "gcp",
    "avg_salary": "162000"
  },
  {
    "skills": "php",
    "avg_salary": "157500"
  },
  {
    "skills": "sas",
    "avg_salary": "154309"
  },
  {
    "skills": "visual basic",
    "avg_salary": "150000"
  },
  {
    "skills": "gdpr",
    "avg_salary": "150000"
  },
  {
    "skills": "sap",
    "avg_salary": "150000"
  },
  {
    "skills": "hadoop",
    "avg_salary": "137500"
  },
  {
    "skills": "r",
    "avg_salary": "135499"
  },
  {
    "skills": "vba",
    "avg_salary": "133750"
  },
  {
    "skills": "databricks",
    "avg_salary": "129500"
  },
  {
    "skills": "nosql",
    "avg_salary": "125000"
  },
  {
    "skills": "aws",
    "avg_salary": "121167"
  },
  {
    "skills": "tableau",
    "avg_salary": "115324"
  }
]

*/