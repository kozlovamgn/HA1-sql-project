-- Zjištění dostupných dat
SELECT DISTINCT country 
FROM t_elena_kocumova_project_sql_secondary_final;

SELECT DISTINCT year 
FROM t_elena_kocumova_project_sql_secondary_final 
WHERE country = 'Czech Republic';

SELECT DISTINCT year_price 
FROM t_elena_kocumova_project_sql_primary_final;

-- Finalní dotaz
WITH GDPData AS (
    SELECT 
        year, 
        AVG(gdp) AS avg_gdp,
        LAG(AVG(gdp)) OVER (ORDER BY year) AS previous_year_gdp
    FROM 
        t_elena_kocumova_project_sql_secondary_final
    WHERE 
        country = 'Czech Republic'
    GROUP BY 
        year
),
SalaryAndFoodData AS (
    SELECT 
        year_price AS year, 
        AVG(avg_price) AS avg_food_price, 
        AVG(avg_salary) AS avg_salary, 
        LAG(AVG(avg_price)) OVER (ORDER BY year_price) AS previous_year_food_price, 
        LAG(AVG(avg_salary)) OVER (ORDER BY year_price) AS previous_year_salary 
    FROM 
        t_elena_kocumova_project_sql_primary_final
    GROUP BY 
        year_price
)
SELECT 
    g.year AS "Rok",
    ROUND(CAST(((g.avg_gdp - g.previous_year_gdp) / g.previous_year_gdp) * 100 AS NUMERIC), 2) AS "Růst HDP (%)", 
    ROUND(CAST(((s.avg_food_price - s.previous_year_food_price) / s.previous_year_food_price) * 100 AS NUMERIC), 2) AS "Růst cen potravin (%)", 
    ROUND(CAST(((s.avg_salary - s.previous_year_salary) / s.previous_year_salary) * 100 AS NUMERIC), 2) AS "Růst mezd (%)" 
FROM 
    GDPData g
JOIN 
    SalaryAndFoodData s
ON 
    g.year = s.year
WHERE 
    g.previous_year_gdp IS NOT NULL
    AND s.previous_year_food_price IS NOT NULL
    AND s.previous_year_salary IS NOT NULL
ORDER BY 
    g.year;