-- Výpočet počtu pro mléko
SELECT 
    year_salary,
    industry,
    avg_salary,
    product,
    avg_price,
    ROUND(CAST(avg_salary / avg_price AS NUMERIC), 2) AS units_purchasable
FROM 
    t_elena_kocumova_project_sql_primary_final
WHERE 
    product ILIKE '%mléko%'
    AND year_salary IN (
        SELECT MIN(year_salary) FROM t_elena_kocumova_project_sql_primary_final
        UNION
        SELECT MAX(year_salary) FROM t_elena_kocumova_project_sql_primary_final
    )
ORDER BY 
    year_salary, industry;

-- Výpočet počtu pro chléb
SELECT 
    year_salary,
    industry,
    avg_salary,
    product,
    avg_price,
    ROUND(CAST(avg_salary / avg_price AS NUMERIC), 2) AS units_purchasable
FROM 
    t_elena_kocumova_project_sql_primary_final
WHERE 
    product ILIKE '%chléb%'
    AND year_salary IN (
        SELECT MIN(year_salary) FROM t_elena_kocumova_project_sql_primary_final
        UNION
        SELECT MAX(year_salary) FROM t_elena_kocumova_project_sql_primary_final
    )
ORDER BY 
    year_salary, industry;