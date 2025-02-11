WITH AverageYearlyData AS (
    SELECT 
        year_price AS year, -- Rok
        AVG(avg_price) AS average_food_price, -- Průměrná cena potravin
        AVG(avg_salary) AS average_salary -- Průměrná mzda
    FROM 
        t_elena_kocumova_project_sql_primary_final
    GROUP BY 
        year_price
),
YearlyChanges AS (
    SELECT 
        year,
        average_food_price,
        average_salary,
        LAG(average_food_price) OVER (ORDER BY year) AS previous_food_price, -- Cena potravin z předchozího roku
        LAG(average_salary) OVER (ORDER BY year) AS previous_salary, -- Mzda z předchozího roku
        ROUND(((average_food_price - LAG(average_food_price) OVER (ORDER BY year)) / LAG(average_food_price) OVER (ORDER BY year))::numeric * 100, 2) AS food_price_growth, -- Meziroční růst cen potravin
        ROUND(((average_salary - LAG(average_salary) OVER (ORDER BY year)) / LAG(average_salary) OVER (ORDER BY year))::numeric * 100, 2) AS salary_growth -- Meziroční růst mezd
    FROM 
        AverageYearlyData
),
FilteredChanges AS (
    SELECT 
        year,
        food_price_growth,
        salary_growth,
        (food_price_growth - salary_growth) AS difference -- Rozdíl mezi růstem cen potravin a růstem mezd
    FROM 
        YearlyChanges
    WHERE 
        food_price_growth > salary_growth -- Pouze kladné rozdíly
)
SELECT 
    year AS "Rok",
    food_price_growth AS "Meziroční růst cen potravin (%)",
    salary_growth AS "Meziroční růst mezd (%)",
    difference AS "Rozdíl (%)"
FROM 
    FilteredChanges
WHERE 
    difference > 5 -- Rozdíl větší než 10 %
ORDER BY 
    difference DESC;