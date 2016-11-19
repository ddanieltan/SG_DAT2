/*Find the total number of births in each calendar year*/
SELECT year, COUNT(*) as births FROM [bigquery-public-data:samples.natality] GROUP BY year ORDER BY year LIMIT 100

/*
Multiple birth over time
1) Is there an increasing trend of multiple births? A friend of mine just gave birth to triples
recently and mentioned that its more common nowadays due to fertility drugs, really?
2) Going further: group it by singleton, twins, triplets, quints by share.*/
SELECT year, ROUND(avg(plurality),2) AS AVG_BIRTHS FROM [bigquery-public-data:samples.natality] GROUP BY year ORDER BY year LIMIT 1000

/*
Mating Season
Which are the months most popular for giving birth. I am interested to see if there is a mating
season for Americans.
*/
select year,
sum(CASE WHEN month = 1 THEN 1 ELSE 0 END) AS Jan,
sum(CASE WHEN month = 2 THEN 1 ELSE 0 END) AS Feb,
sum(CASE WHEN month = 3 THEN 1 ELSE 0 END) AS Mar,
sum(CASE WHEN month = 4 THEN 1 ELSE 0 END) AS Apr,
sum(CASE WHEN month = 5 THEN 1 ELSE 0 END) AS May,
sum(CASE WHEN month = 6 THEN 1 ELSE 0 END) AS Jun,
sum(CASE WHEN month = 7 THEN 1 ELSE 0 END) AS Jul,
sum(CASE WHEN month = 8 THEN 1 ELSE 0 END) AS Aug,
sum(CASE WHEN month = 9 THEN 1 ELSE 0 END) AS Sep,
sum(CASE WHEN month = 10 THEN 1 ELSE 0 END) AS Oct,
sum(CASE WHEN month = 11 THEN 1 ELSE 0 END) AS Nov,
sum(CASE WHEN month = 12 THEN 1 ELSE 0 END) AS Dec
FROM [bigquery-public-data:samples.natality]
GROUP BY year ORDER BY year LIMIT 1000

/*
Gestation Period by State
Do gestation periods vary by state (​ year > 1990 and year < 2005) ​ ?
Hint: ​ IS_EXPLICITLY_DEFINED to remove null
*/
select mother_birth_state, year, AVG(gestation_weeks) AS Avg_Gestation
FROM [bigquery-public-data:samples.natality]
WHERE year > 1990 AND year < 2005
GROUP BY mother_birth_state, year LIMIT 1000
