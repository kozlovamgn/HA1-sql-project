WITH YearlyPriceChange AS (
    SELECT 
        product,
        year_price AS year,
        AVG(avg_price) AS avg_price,
        LAG(AVG(avg_price)) OVER (PARTITION BY product ORDER BY year_price) AS previous_year_price
    FROM 
        t_elena_kocumova_project_sql_primary_final
    GROUP BY 
        product, year_price
),
PercentageChange AS (
    SELECT 
        product,
        year,
        ROUND(((avg_price - previous_year_price) / previous_year_price)::numeric * 100, 2) AS year_difference
    FROM 
        YearlyPriceChange
    WHERE 
        previous_year_price IS NOT NULL
),
AverageGrowth AS (
    SELECT 
        product,
        ROUND(AVG(year_difference)::numeric, 2) AS average_growth 
    FROM 
        PercentageChange
    GROUP BY 
        product
)
SELECT 
    product AS "Produkt",
    average_growth AS "average_growth (%)"
FROM 
    AverageGrowth
ORDER BY 
    average_growth ASC;
