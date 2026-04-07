CREATE TABLE jobs (
    job_id INT,
    job_title TEXT,
    industry TEXT,
    location TEXT,
    salary_usd FLOAT,
    skills_required TEXT,
    remote_option TEXT,
    company_size TEXT,
    posting_date DATE,
    month INT,
    month_name TEXT
);
SELECT * FROM jobs LIMIT 10;
 -- 1. Average Salary by Industry
SELECT industry, ROUND(AVG(salary_usd)::numeric,2) AS avg_salary
FROM jobs
GROUP BY industry
ORDER BY avg_salary DESC;

-- 2. Top Paying Job Roles
SELECT job_title, MAX(salary_usd) AS max_salary
FROM jobs
GROUP BY job_title
ORDER BY max_salary DESC;

-- 3. Remote vs Onsite Jobs
SELECT remote_option, COUNT(*) AS total_jobs
FROM jobs
GROUP BY remote_option;

-- 4. Jobs by Location
SELECT location, COUNT(*) AS total_jobs
FROM jobs
GROUP BY location
ORDER BY total_jobs DESC;

-- 5. Hiring Trend by Month
SELECT month_name, COUNT(*) AS total_jobs
FROM jobs
GROUP BY month_name, month
ORDER BY month;

 -- 6. Highest Paying Job in Each Location 
SELECT location, job_title, salary_usd
FROM jobs j1
WHERE salary_usd = (
    SELECT MAX(salary_usd)
    FROM jobs j2
    WHERE j1.location = j2.location
);

-- 7. Salary Classification (CASE WHEN)
SELECT job_title,
       salary_usd,
       CASE 
           WHEN salary_usd > 120000 THEN 'High'
           WHEN salary_usd BETWEEN 80000 AND 120000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_category
FROM jobs;

--  8. Top Paying Industry per Location
SELECT location, industry, AVG(salary_usd) AS avg_salary
FROM jobs
GROUP BY location, industry
ORDER BY location, avg_salary DESC;





