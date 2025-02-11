WITH salary_trends AS (
    SELECT
        year_salary AS year,
        industry,
        avg_salary,
        LAG(avg_salary) OVER (PARTITION BY industry ORDER BY year_salary) AS previous_salary
    FROM t_elena_kocumova_project_SQL_primary_final
    WHERE avg_salary IS NOT NULL
)
SELECT
    industry,
    year,
    avg_salary,
    previous_salary,
    CASE
        WHEN avg_salary > previous_salary THEN 'Roste'
        WHEN avg_salary < previous_salary THEN 'Klesá'
        ELSE 'Beze změny'
    END AS trend
FROM salary_trends
WHERE previous_salary IS NOT NULL
ORDER BY industry, year;

-- Odvětví bez poklesu
SELECT industry
FROM (
    SELECT 
        industry,
        avg_salary,
        LAG(avg_salary) OVER (PARTITION BY industry ORDER BY year_salary) AS previous_salary
    FROM t_elena_kocumova_project_SQL_primary_final
    WHERE avg_salary IS NOT NULL
) AS salary_data
GROUP BY industry
HAVING MIN(avg_salary - previous_salary) >= 0;

-- Odvětví s alespoň jedním poklesem
SELECT DISTINCT industry
FROM (
    SELECT 
        industry,
        avg_salary,
        LAG(avg_salary) OVER (PARTITION BY industry ORDER BY year_salary) AS previous_salary
    FROM t_elena_kocumova_project_SQL_primary_final
    WHERE avg_salary IS NOT NULL
) AS salary_data
WHERE avg_salary < previous_salary;



