PROJEKT : PROJEKT Z SQL

ÚVOD DO PROJEKTU 


  PRIMÁRNÍ TABULKA

Pro vytvoření tabulky t_elena_kocumova_project_SQL_primary_final jsem spojila informace o mzdách a cenách potravin v České republice. Data byla získána z následujících tabulek:
•	czechia_payroll: obsahuje údaje o mzdách podle odvětví a roku.
•	czechia_payroll_industry_branch: číselník pro názvy průmyslových odvětví.
•	czechia_price: údaje o cenách potravin podle kategorií a roku.
•	czechia_price_category: číselník pro názvy kategorií potravin.
 
  SEKUNDÁRNÍ TABULKA

Pro vytvoření tabulky t_elena_kocumova_project_SQL_secondary_final jsem spojila údaje o ekonomických ukazatelích evropských států. Informace pocházejí z následujících tabulek:
•	economies: obsahuje údaje o HDP, GINI koeficientu, populaci a dalších ekonomických ukazatelích států podle roku.
•	countries: obsahuje informace o státech, včetně názvů, kontinentů a doplňujících údajů, jako je typ vlády, průměrná výška nebo očekávaná délka života.

  VÝZKUMNÉ OTÁZKY

1. ROSTOU V PRŮBĚHU LET MZDY VE VŠECH ODVĚTVÍCH, NEBO V NĚKTERÝCH KLESAJÍ?
Ve čtyřech odvětvích:
•	ostatní činnosti,
•	doprava a skladování,
•	zdravotní a sociální péče,
•	zpracovatelský průmysl
nedošlo během celého sledovaného období k žádnému poklesu mezd. U ostatních odvětví se občasné poklesy vyskytly, ale celkový trend mezd zůstal rostoucí.

2. KOLIK JE MOŽNÉ SI KOUPIT LITRŮ MLÉKA A KILOGRAMŮ CHLEBA ZA PRVNÍ A POSLEDNÍ SROVNATELNÉ OBDOBÍ V DOSTUPNÝCH DATECH CEN A MEZD?
Data ukazují, že většina odvětví zaznamenala nárůst kupní síly mezi lety 2006 a 2018, což odráží pozitivní ekonomický trend. Nicméně „Administrativní a podpůrné činnosti“ a „Ubytování, stravování a pohostinství“ zůstávají odvětvími s nejnižší dostupností základních potravin, což naznačuje nerovnoměrný růst mezd mezi sektory.

3.	KTERÁ KATEGORIE POTRAVIN ZDRAŽUJE NEJPOMALEJI (JE U NÍ NEJNIŽŠÍ PERCENTUÁLNÍ MEZIROČNÍ NÁRŮST)?
•	Cukr krystalový vykazuje nejnižší průměrný meziroční růst (-1,92 %), což znamená, že dlouhodobě zlevňuje. 
•	Další produkty, jako rajská jablka červená kulatá (-0,74 %) a banány žluté (0,81 %), vykazují velmi pomalý růst cen nebo zlevňování, ale v menší míře.
•	Naopak nejrychleji zdražují produkty jako papriky (7,29 %) a máslo (6,67 %), které vykazují výrazné tempo růstu cen. Tyto rozdíly naznačují, že ceny některých potravinových kategorií se vyvíjejí mnohem rychleji než ostatní, což může být ovlivněno poptávkou, výrobními náklady nebo sezónními faktory.
Výsledky ukazují, že zatímco některé potraviny dlouhodobě zlevňují, jiné vykazují prudký růst cen. 
 
4.	EXISTUJE ROK, VE KTERÉM BYL MEZIROČNÍ NÁRŮST CEN POTRAVIN VÝRAZNĚ VYŠŠÍ NEŽ RŮST MEZD (VĚTŠÍ NEŽ 10 %)?
Žádný rok nesplňuje podmínku růstu cen potravin výrazně vyššího než růst mezd o více než 10 %. Největší rozdíl byl zaznamenán v roce 2013, kdy ceny potravin vzrostly o 5,1 %, zatímco mzdy poklesly o -1,56 %, což vedlo k rozdílu 6,66 %. 
 
5.	MÁ VÝŠKA HDP VLIV NA ZMĚNY VE MZDÁCH A CENÁCH POTRAVIN? NEBOLI, POKUD HDP VZROSTE VÝRAZNĚJI V JEDNOM ROCE, PROJEVÍ SE TO NA CENÁCH POTRAVIN ČI MZDÁCH VE STEJNÉM NEBO NÁSLEDUJÍCÍM ROCE VÝRAZNĚJŠÍM RŮSTEM?
Výsledky analýzy ukazují, že výška HDP má vliv na mzdy a ceny potravin, ale tento vztah není vždy přímý. V některých letech, jako v roce 2007 a 2017, byl růst HDP spojen s růstem mezd i cen potravin, zatímco v roce 2015 růst HDP nevedl k růstu cen potravin kvůli nízkému růstu mezd. 
