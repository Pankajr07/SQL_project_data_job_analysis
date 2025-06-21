/*
-Questions:
-What are the top skills required for remote Data Analyst jobs?
-Which skill has the highest demand among remote Data Analysts?
-How important are data visualization skills for remote roles?
-Is programming knowledge relevant for remote Data Analysts?
*/

select 
    skills,
    COUNT(skills_job_dim.job_id) as demand_count
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where 
    job_title_short = 'Data Analyst' AND
    job_work_from_home = 'True'
Group by 
    skills
ORDER BY demand_count DESC
LIMIT 5;

/* Breakdown:
-SQL, Excel, Python, Tableau, and Power BI lead in demand.
-SQL has the highest demand, indicating core importance.
-Tableau and Power BI rank in the top 5, showing strong importance.
-Python’s high demand highlights the need for programming skills.
*/