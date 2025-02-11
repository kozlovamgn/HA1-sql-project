-- 1. Kontrola a náhled dat pro sekundární tabulku
-- Náhled na tabulku s ekonomickými daty
SELECT * 
FROM economies;

-- Náhled na tabulku s informacemi o státech
SELECT * 
FROM countries;

-- Ověření, zda jsou státy v obou tabulkách propojeny správně
SELECT DISTINCT 
    c.country AS country_name,
    c.continent,
    c.population
FROM countries c
LEFT JOIN economies e ON c.country = e.country
WHERE e.country IS NULL;

-- Kontrola časového pokrytí dat v tabulce economies
SELECT DISTINCT year 
FROM economies 
ORDER BY year;

-- Omezení na společné roky s primární tabulkou (2006–2018)
SELECT DISTINCT year 
FROM economies 
WHERE year BETWEEN 2006 AND 2018;

-- Kontrola chybějících hodnot
SELECT * 
FROM economies 
WHERE gdp IS NULL OR population IS NULL OR gini IS NULL;

-- 2. Vytvoření sekundární tabulky
-- Finální kód pro vytvoření sekundární tabulky
DROP TABLE IF EXISTS t_elena_kocumova_project_SQL_secondary_final;

CREATE TABLE t_elena_kocumova_project_SQL_secondary_final AS
WITH filtered_economies AS (
    SELECT DISTINCT
        e.year,
        c.country,
        c.continent,
        c.government_type,
        e.gdp,
        e.gini,
        e.population,
        c.avg_height,
        c.life_expectancy,
        c.median_age_2018
    FROM economies e
    JOIN countries c ON e.country = c.country
    WHERE e.year BETWEEN 2006 AND 2018
      AND c.continent = 'Europe'
      AND e.gdp IS NOT NULL
      AND e.population IS NOT NULL
)
SELECT 
    year,
    country,
    continent,
    government_type,
    gdp,
    gini,
    population,
    avg_height,
    life_expectancy,
    median_age_2018
FROM filtered_economies
ORDER BY year, country;

SELECT * 
FROM t_elena_kocumova_project_SQL_secondary_final;