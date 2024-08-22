-- SAI KUMAR ENJAMURI --
 
CREATE DATABASE crimes_db;
USE crimes_db;
CREATE TABLE CRIMES
(ID integer,
STATE varchar(100),
DISTRICT varchar(100),
Year integer,
Rape integer,
Kidnapping_and_Abduction integer,
Dowry_Deaths integer,
Assault_on_women integer,
Insult_to_modesty_of_Women integer,
Cruelty_by_Inlaws integer,
Importation_of_Girls integer);

/*Count the number of states in the dataset.*/
SELECT COUNT(DISTINCT STATE) AS Number_of_States
FROM CRIMES;

/*Find the total number of rape cases in the entire dataset.*/
SELECT SUM(Rape) AS Total_Rape_Cases
FROM CRIMES;

/*Count the number of districts in the state of Uttar Pradesh.*/
SELECT COUNT(DISTINCT DISTRICT) AS Number_of_Districts
FROM CRIMES
WHERE STATE = 'Uttar Pradesh';

/*Find the total number of crimes (all types) in the year 2014.*/
SELECT 
SUM(Rape + Kidnapping_and_Abduction + Dowry_Deaths + Assault_on_women + Insult_to_modesty_of_Women + Cruelty_by_Inlaws + Importation_of_Girls) AS Total_Crimes
FROM CRIMES
WHERE Year = 2014;

/*Find the total number of crimes (all types) in the year  2010 & 2014.*/
SELECT 
Year,SUM(Rape + Kidnapping_and_Abduction + Dowry_Deaths + Assault_on_women + Insult_to_modesty_of_Women + Cruelty_by_Inlaws + Importation_of_Girls) AS Total_Crimes
FROM CRIMES
WHERE Year in (2010 ,2014)
group by year;

/*Find the total number of crimes (all types) yearwise from 2001 & 2014.*/
SELECT 
Year,SUM(Rape + Kidnapping_and_Abduction + Dowry_Deaths + Assault_on_women + Insult_to_modesty_of_Women + Cruelty_by_Inlaws + Importation_of_Girls) AS Total_Crimes
FROM CRIMES
WHERE Year between 2001 and 2014
group by year;

/*Find the total number of crimes (all types) in all year from 2001 & 2014.*/
SELECT 
SUM(Rape + Kidnapping_and_Abduction + Dowry_Deaths + Assault_on_women + Insult_to_modesty_of_Women + Cruelty_by_Inlaws + Importation_of_Girls) AS Total_Crimes
FROM CRIMES;

/*Find the state with the highest number of dowry deaths.*/
SELECT STATE, MAX(Dowry_Deaths) AS Highest_Dowry_Deaths
FROM CRIMES
GROUP BY STATE
ORDER BY Highest_Dowry_Deaths DESC
LIMIT 1;

/*Find the average number of kidnapping cases per district.*/
SELECT DISTRICT, AVG(Kidnapping_and_Abduction) AS Avg_Kidnapping_Cases
FROM CRIMES
GROUP BY DISTRICT;

/*To find out year wise total count of each type of crimes*/
SELECT year, sum(rape) as 'Total_rapes', 
sum(Kidnapping_and_Abduction) as 'Total_abductions', 
sum(Dowry_Deaths) as 'Total_dowry_Deaths', 
sum(Assault_on_women) as 'Total_assaults',
sum(Insult_to_modesty_of_Women) as 'Total_insults',
sum(Cruelty_by_Inlaws) as 'Total_domestic_violence', 
sum(Importation_of_Girls) as 'Total_importation'
from crimes
group by year;


/*Spatial Analysis: Determine crime hotspots by state or district.*/
SELECT DISTRICT, COUNT(*) AS Total_Crimes
FROM CRIMES
GROUP BY DISTRICT
ORDER BY Total_Crimes DESC;

/*Find the district with the lowest number of assault cases on women.*/
SELECT DISTRICT, MIN(Assault_on_women) AS Lowest_Assault_Cases
FROM CRIMES
GROUP BY DISTRICT
ORDER BY Lowest_Assault_Cases ASC
LIMIT 1;

/*Find the total number of cruelty by in-laws cases in the state of Maharashtra.*/
SELECT SUM(Cruelty_by_Inlaws) AS Total_Cruelty_Cases
FROM CRIMES
WHERE STATE = 'Maharashtra';

/*Find the year with the highest number of rape cases.*/
SELECT Year, MAX(Rape) AS Highest_Rape_Cases
FROM CRIMES
GROUP BY Year
ORDER BY Highest_Rape_Cases DESC
LIMIT 1;

/*Find the average number of kidnapping cases per state.*/
SELECT STATE, AVG(Kidnapping_and_Abduction) AS Avg_Kidnapping_Cases
FROM CRIMES
GROUP BY STATE
order by Avg_Kidnapping_Cases desc;

/* Find the year-wise trend of kidnapping cases in the state of Delhi.*/
SELECT Year, SUM(Kidnapping_and_Abduction) AS Total_Kidnapping_Cases
FROM CRIMES
WHERE STATE = 'Delhi'
GROUP BY Year
ORDER BY Year ASC;

/*Top 5 states with the highest rape cases during 2001-2014*/
Select state,sum(rape)as 'Total_Rapes'
from crimes
group by state
Order by sum(rape) desc 
limit 5;

/*Bottom 5 states with the lowest rape cases during 2001-2014*/
Select state,sum(rape)as 'Total_rapes'
from crimes
group by state 
Order by sum(rape) asc 
limit 5;


/*Top 3 states with the highest kidnapping & abduction cases during 2001-2014*/
Select 
state,sum(Kidnapping_and_Abduction)as 'Total_Abductions'
from crimes
group by state 
Order by sum(Kidnapping_and_Abduction) desc 
limit 3;

/*Bottom 3 states with the lowest kidnapping & abduction cases during 2001-2014*/
Select 
state,sum(Kidnapping_and_Abduction)as 'Total_Abductions'
from crimes
group by state 
Order by sum(Kidnapping_and_Abduction) 
limit 3;

/*Top 10 states with the highest dowry deaths cases during 2001-2014*/
Select 
state,sum(Dowry_Deaths)as 'Total_dowry_deaths'
from crimes
group by state 
Order by sum(Dowry_Deaths) desc 
limit 10;

/*Bottom 2 states with the lowest dowry deaths cases during 2001-2014*/
Select 
state,sum(Dowry_Deaths)as 'Total_dowry_deaths'
from crimes
group by state
Order by sum(Dowry_Deaths) 
limit 2;

/*Top 5 states with the highest number of assaults cases during 2001-2014*/
Select 
state,sum(Assault_on_women)as 'Total_assaults'
from crimes
group by state 
Order by sum(Assault_on_women) desc 
limit 5;

/*Bottom 5 states with the lowest number of assaults cases during 2001-2014*/
Select state,sum(Assault_on_women)as 'Total_assaults'
from crimes
group by state 
Order by sum(Assault_on_women) asc 
limit 5;

/*Top 5 states with the highest insult to modesty cases during 2001-2014*/
Select 
state,sum(Insult_to_modesty_of_Women)as 'Total_insults'
from crimes
group by state 
Order by sum(Insult_to_modesty_of_Women) desc 
limit 5;

/*Bottom 5 states with the lowest insult to modesty cases during 2001-2014*/
Select 
state,sum(Insult_to_modesty_of_Women)as 'Total_insults'
from crimes
group by state 
Order by sum(Insult_to_modesty_of_Women) 
limit 5;

/*Top 5 states with the highest domestic violence cases during 2001-2014*/
Select state,sum(Cruelty_by_Inlaws)as 'Total_cruelty'
from crimes
group by state 
Order by sum(Cruelty_by_Inlaws) desc 
limit 5;

/*Bottom 5 states with the lowest domestic violence cases during 2001-2014*/
Select 
state,sum(Cruelty_by_Inlaws)as 'Total_cruelty'
from crimes
group by state 
Order by sum(Cruelty_by_Inlaws) asc 
limit 5;

/*Top 5 states with the highest importations cases during 2001-2014*/
Select 
state,sum(Importation_of_Girls)as 'Total_importations'
from crimes
group by state 
Order by sum(Importation_of_Girls) desc 
limit 5;

/*Bottom 5 states with the lowest importation cases during 2001-2014*/
Select 
state,sum(Importation_of_Girls)as 'Total_importations'
from crimes
group by state 
Order by sum(Importation_of_Girls) asc 
limit 5;

/*Find the percentage contribution of each crime type to the total crimes for each state in 2014.*/
-- Method-1 --
SELECT STATE,
       (Rape / Total_Crimes) * 100 AS Rape_Percentage,
       (Kidnapping_and_Abduction / Total_Crimes) * 100 AS Kidnapping_Percentage,
       (Dowry_Deaths / Total_Crimes) * 100 AS Dowry_Deaths_Percentage,
       (Assault_on_women / Total_Crimes) * 100 AS Assault_Percentage,
       (Insult_to_modest_of_Women / Total_Crimes) * 100 AS Insult_Percentage,
       (Cruelty_by_Inlaws / Total_Crimes) * 100 AS Cruelty_Percentage,
       (Importation_of_Girls / Total_Crimes) * 100 AS Importation_Percentage,
       
FROM (
    SELECT STATE, SUM(Rape + Kidnapping_and_Abduction + Dowry_Deaths + Assault_on_women + Insult_to_modesty_of_Women + Cruelty_by_Inlaws + Importation_of_Girls) AS Total_Crimes,
           SUM(Rape) AS Rape, SUM(Kidnapping_and_Abduction) AS Kidnapping_and_Abduction,
           SUM(Dowry_Deaths) AS Dowry_Deaths, SUM(Assault_on_women ) AS Assault_on_women ,
           SUM(Insult_to_modest_of_Women) AS Insult_to_modest_of_Women, SUM(Cruelty_by_Inlaws) AS Cruelty_by_Inlaws,
           SUM(Importation_of_Girls) AS Importation_of_Girls
    FROM CRIMES
    WHERE Year = 2014
    GROUP BY STATE
) AS Subquery;

-- Method-2 --
SELECT
  t1.STATE,
  (t1.Rape / t2.Total_Crimes) * 100 AS Rape_Percentage,
  (t1.Kidnapping_and_Abduction / t2.Total_Crimes) * 100 AS Kidnapping_Percentage,
  (t1.Dowry_Deaths / t2.Total_Crimes) * 100 AS Dowry_Deaths_Percentage,
  (t1.Assault_on_women / t2.Total_Crimes) * 100 AS Assault_on_women_Percentage,
  (t1.Insult_to_modesty_of_Women / t2.Total_Crimes) * 100 AS Insult_to_modesty_of_Women_Percentage,
  (t1.Cruelty_by_Inlaws / t2.Total_Crimes) * 100 AS Cruelty_by_Inlaws_Percentage,
  (t1.Importation_of_Girls / t2.Total_Crimes) * 100 AS Importation_of_Girls_Percentage
FROM
  (SELECT STATE, SUM(Rape) AS Rape, SUM(Kidnapping_and_Abduction) AS Kidnapping_and_Abduction,
          SUM(Dowry_Deaths) AS Dowry_Deaths, SUM(Assault_on_women) AS Assault_on_women,
          SUM(Insult_to_modesty_of_Women) AS Insult_to_modesty_of_Women,
          SUM(Cruelty_by_Inlaws) AS Cruelty_by_Inlaws, SUM(Importation_of_Girls) AS Importation_of_Girls
   FROM CRIMES
   WHERE Year = 2014
   GROUP BY STATE) AS t1
JOIN
  (SELECT STATE, SUM(Rape + Kidnapping_and_Abduction + Dowry_Deaths + Assault_on_women + Insult_to_modesty_of_Women + Cruelty_by_Inlaws + Importation_of_Girls) AS Total_Crimes
   FROM CRIMES
   WHERE Year = 2014
   GROUP BY STATE) AS t2
USING (STATE);