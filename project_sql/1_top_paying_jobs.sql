/* 
question -Which company offers the highest-paying remote Data Analyst job?
-Do all top-paying roles have the same job title, or do they vary within Data Analyst positions?
-What is the salary range among the top 10 highest-paying remote Data Analyst roles?
-Which companies appear more than once in the top 10 list for remote Data Analyst jobs?
*/

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
LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;


/* Breakdown
-Mantys offers the highest-paying remote Data Analyst role, with an annual salary of $650,000 — significantly above the rest of the listings.
-The job titles vary slightly even within the Data Analyst category, including roles like:
"Senior Data Analyst", "Lead Data Analyst", and "Data Analyst II".
-This shows that more specialized or senior-level analyst titles tend to earn higher salaries.
-The salary range for the top 10 remote Data Analyst jobs is between $184,000 and $650,000 per year. Most fall within the $180K–$250K range, indicating high compensation for experienced or niche analyst roles.
-SmartAsset appears twice in the top 10 list, indicating consistent demand and competitive pay for senior analyst roles at the company.
*/
