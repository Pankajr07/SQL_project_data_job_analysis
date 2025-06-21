/* 
Answer: what are the most optimal skills to learn ( i.e., high in demand and a high paying skill)?
- Identify skills in high demand and associlated with high average salaries for Data Analyst roles
- Concentrates on remote position with specified salaries
-Why? targets skillsthat offer job security ( high demand) and financial benefits (high salaries), offerinf strategic insights for career development in data analysts. 
*/ 


SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) as demand_count,
    ROUND(AVG(salary_year_avg), 0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
     AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True
GROUP BY
    skills_dim.skill_id
    HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC       
LIMIT 25;

/*
Answer: What are the most optimal skills to learn (high demand and high paying)?
- Python (236 jobs, $101,397 avg salary) and R (148 jobs, $100,499) show strong demand and good pay.
- Looker (49 jobs, $103,795), Snowflake (37 jobs, $112,948), Azure (34 jobs, $111,225), and AWS (32 jobs, $108,317) combine solid demand with high salaries.
- Go (27 jobs, $115,320) and Hadoop (22 jobs, $113,193) offer higher salaries but lower demand.
- Skills like Tableau and SQL Server are in demand but offer moderate salaries.
- Focusing on these skills balances job security and earning potential for remote Data Analysts.
*/