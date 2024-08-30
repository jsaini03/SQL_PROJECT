# Introduction
Getting into the data analytics job market! Concentrating on Data Analyst roles, this project analysis top-paying jobs, in-demand skills and most optimal skills for higher salary in data analytics
Check the SQL queries here: [project_sql folder](/project_sql/)
# Background
This project was created to discover top-paid and in-demand skills
Data hails from [SQL course](https://lukebarousse.com/sql)
### Throughout the course the questions I wanted to answer with SQL queries were:
1. What are top-paying jobs for my role?
2. What are the skills required for these top-paying roles?
3. What are the most in-demand skills for my role?
4. What are the top skills based on salary for my role?
5. What are the most optimal skills to learn? Optimal: High Demand and High Paying 
# Tools Used
- **SQL:** To query the database

 - **PostgreSQL:** database management system for handling data

- **Visual Studio Code:** Database management and for SQL executing queries

- **Git & GitHub:** For sharing my SQL scripts and Analysis and for project tracking
# The Analysis
Each query aimed at different aspect. Here's the breakdown:
### 1. Top Paying Data Analyst Jobs
Identified the highest-paying roles
```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id= job_postings_fact.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10
```
### 2. Top Paying Job Skills
Identified the top skills
### 3. Top In-Demand Skills
This query highlights the most in-demand skills 
### 4. Top High-Paid Skills
Skills that get higher salary
### 5. Most optimal skills
Demonstrates the most in-demand and high paying job skills


# Conclusions
This project enhanced my SQL skills and provided valuable insights into Data Analyst job market. The findings gave insights on how to prioritize skill development and job search. Aspiring data analysts can focus on high-demand and high-salary skills in competitive market. This highlights importance of learning and adaptation to emerging trends in this field.