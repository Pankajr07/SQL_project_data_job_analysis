/* 
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regarless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
help identify the most financially rewarding skills to acquire or improve
*/

select 
    skills,
    ROUND(AVG(salary_year_avg), 0) as avg_salary
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where 
    job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
AND job_work_from_home = True
    Group by 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25;


/*
PySpark tops the list with the highest average salary of $208,172.
- Other high-paying skills include Bitbucket ($189,155), Couchbase ($160,515), and Watson ($160,515).
- Skills related to cloud, big data, and programming (e.g., Kubernetes, GCP, Pandas, Numpy) generally offer above-average salaries.
- Mastering these top skills can increase earning potential for remote Data Analyst roles.
*/