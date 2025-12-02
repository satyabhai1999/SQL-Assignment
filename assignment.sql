# ASSIGNMENT QUESTIONS 
# QUESTION 1.count, How many cities are there in each country?
#solution 1. 

use world;
show tables;
SELECT
    country.Name AS Country,
    COUNT(city.ID) AS Total_Cities
FROM country
JOIN city
    ON country.Code = city.CountryCode
GROUP BY country.Code, country.Name
ORDER BY Total_Cities DESC; 



# QUESTION 2.  Display all continents having more than 30 countries
# solution 2. 


SELECT continent, COUNT(*) AS country_count
FROM country
GROUP BY continent
HAVING COUNT(*) > 30; 

# Question 3 : List regions whose total population exceeds 200 million
# solution 3. 

SELECT region, SUM(population) AS total_population
FROM country
GROUP BY region
HAVING SUM(population) > 200000000; 

#  Question 4 : Find the top 5 continents by average GNP per country.
# solution 4. 

SELECT continent,
       AVG(gnp) AS avg_gnp
FROM country
GROUP BY continent
ORDER BY avg_gnp DESC
LIMIT 5;

#  Question 5 : Find the total number of official languages spoken in each continent.
# solution 

SELECT c.continent,
       COUNT(DISTINCT cl.language) AS total_official_languages
FROM country c
JOIN countrylanguage cl
      ON c.code = cl.countrycode
WHERE cl.isofficial = 'T'
GROUP BY c.continent;



# Question 6 : Find the maximum and minimum GNP for each continent.
# solution 

SELECT continent,
       MAX(gnp) AS max_gnp,
       MIN(gnp) AS min_gnp
FROM country
GROUP BY continent;


#  Question 7 : Find the country with the highest average city population.
# solution 

SELECT c.Name AS country_name,
       AVG(ci.Population) AS avg_city_population
FROM country c
JOIN city ci
      ON c.Code = ci.CountryCode
GROUP BY c.Code, c.Name
ORDER BY avg_city_population DESC
LIMIT 1;



#  Question 8 : List continents where the average city population is greater than 200,000.
# solution 8 

SELECT c.Continent,
       AVG(ci.Population) AS avg_city_population
FROM country c
JOIN city ci
      ON c.Code = ci.CountryCode
GROUP BY c.Continent
HAVING AVG(ci.Population) > 200000;



#  Question 9 : Find the total population and average life expectancy for each continent, ordered by average life 
# expectancy descending
# ssolution 9. 

SELECT c.Continent,
       SUM(c.Population) AS total_population,
       AVG(c.LifeExpectancy) AS avg_life_expectancy
FROM country c
GROUP BY c.Continent
ORDER BY avg_life_expectancy DESC;



#  Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where 
# total population is over 200 million.
# solution 

SELECT Continent,
       AVG(LifeExpectancy) AS avg_life_expectancy,
       SUM(Population) AS total_population
FROM country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY avg_life_expectancy DESC
LIMIT 3;


#...................................end................................................