-- 1. Kontrola a náhled dat pro primární tabulku
-- Tabulka mezd
SELECT * 
FROM czechia_payroll;

-- Číselník odvětví
SELECT * 
FROM czechia_payroll_industry_branch;

-- Tabulka cen potravin
SELECT * 
FROM czechia_price;

-- Číselník kategorií potravin
SELECT * 
FROM czechia_price_category;

-- Zajistím, že mzdy a ceny sdílejí stejné roky.
SELECT DISTINCT payroll_year AS year 
FROM czechia_payroll 
ORDER BY year;

-- Dostupné roky v tabulce cen potravin
SELECT DISTINCT EXTRACT(YEAR FROM date_from) AS year 
FROM czechia_price ORDER BY year;

SELECT DISTINCT p.payroll_year AS common_year
FROM czechia_payroll p
JOIN czechia_price pr ON p.payroll_year = EXTRACT(YEAR FROM pr.date_from)
ORDER BY common_year;

SELECT * 
FROM czechia_payroll cpr 
WHERE cpr.value IS NULL OR industry_branch_code IS NULL;

SELECT * 
FROM czechia_price cp 
WHERE cp.value IS NULL OR category_code IS NULL;

-- 2. Vytvoření primární tabulky
-- Finální kód pro vytvoření primární tabulky
DROP TABLE IF EXISTS t_elena_kocumova_project_SQL_primary_final;

CREATE TABLE t_elena_kocumova_project_SQL_primary_final AS
WITH salary_data AS (
    SELECT 
        p.payroll_year AS year,
        i.name AS industry,
        AVG(p.value) AS avg_salary
    FROM czechia_payroll p
    LEFT JOIN czechia_payroll_industry_branch i ON p.industry_branch_code = i.code
    WHERE p.value_type_code = 5958
      AND p.value IS NOT NULL
      AND p.payroll_year BETWEEN 2006 AND 2018
    GROUP BY p.payroll_year, i.name
),
price_data AS (
    SELECT 
        EXTRACT(YEAR FROM pr.date_from) AS year,
        pc.name AS product,
        AVG(pr.value) AS avg_price
    FROM czechia_price pr
    LEFT JOIN czechia_price_category pc ON pr.category_code = pc.code
    WHERE pr.region_code IS NULL
      AND pr.value IS NOT NULL
      AND EXTRACT(YEAR FROM pr.date_from) BETWEEN 2006 AND 2018
    GROUP BY EXTRACT(YEAR FROM pr.date_from), pc.name
)
SELECT 
    s.year AS year_salary,
    s.industry,
    s.avg_salary,
    p.year AS year_price,
    p.product,
    p.avg_price
FROM salary_data s
FULL OUTER JOIN price_data p ON s.year = p.year
WHERE s.industry IS NOT NULL;

SELECT *
FROM t_elena_kocumova_project_SQL_primary_final;