/* Task D.1*/
SELECT location,
       date,
       people_vaccinated,
       people_fully_vaccinated,
       people_vaccinated + people_fully_vaccinated
  FROM vacc_by_all_countries
 WHERE location = 'Afghanistan' AND DATE(substr(date, 7, 4) || '-' || substr(date, 4, 2) || '-' || substr(date, 1, 2)) <= '2021-06-30'; 

/* Task D.2*/
SELECT location, MAX(people_vaccinated + people_fully_vaccinated)
    FROM vacc_by_all_countries
GROUP BY location;

/* Task D.3*/
SELECT location, vaccine FROM countries_vacc_info;
  
/* Task D.4*/
SELECT source_name,
       source_website,
       MAX(people_vaccinated + people_fully_vaccinated) 
  FROM vacc_by_all_countries
       LEFT OUTER JOIN
       countries_vacc_info ON vacc_by_all_countries.location = countries_vacc_info.location
 GROUP BY source_name,
          source_website;
          
/* Task D.5*/ 
SELECT date,
       (CASE WHEN "location" == 'Australia' THEN people_vaccinated + people_fully_vaccinated END) as AU,
       (CASE WHEN "location" == 'Israel' THEN people_vaccinated + people_fully_vaccinated END) as ISR,
       (CASE WHEN "location" == 'France' THEN people_vaccinated + people_fully_vaccinated END) as FR,
       (CASE WHEN "location" == 'United States' THEN people_vaccinated + people_fully_vaccinated END) as US
FROM vacc_by_key_countries
ORDER BY date





   


  
