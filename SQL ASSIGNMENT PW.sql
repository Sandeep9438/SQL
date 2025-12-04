--# USE world database -------------
use world;
select * from city;
select * from country;
select * from countrylanguage;


# Question 1 : Count how many cities are there in each country?
SELECT 
    country.Name as CountryName,
    COUNT(city.ID) as CityCount
FROM country
LEFT JOIN city 
    ON country.Code = city.CountryCode
GROUP BY country.Code, country.Name;


# Question 2 : Display all continents having more than 30 countries ?
select Continent, Count(Name) as no_of_countries
from Country
group by Continent
having Count(Name) > 30;


# Question 3 : List regions whose total population exceeds 200 million ?
Select Region, sum(population) as total_population from country
group by Region
having sum(population) > 200000000;


# Question 4 : Find the top 5 continents by average GNP per country ?
select Continent, avg(GNP) as avg_gnp
from country
group by continent
order by avg_gnp desc
limit 5;


# Question 5 : Find the total number of official languages spoken in each continent ?
select country.Continent, count(countrylanguage.Language) No_of_languages
from country left join countrylanguage
on country.Code = Countrylanguage.CountryCode
group by Continent;


# Question 6 : Find the maximum and minimum GNP for each continent ?
select Continent, Max(Gnp) max_gnp, min(GNP) min_gnp
from country
group by Continent;

# Question 7 : Find the country with the highest average city population ?
SELECT country.Name country_name,
    avg(city.Population) as avg_city_pop
from city
join country on city.CountryCode = country.Code
GROUP BY country.Code, country.Name
ORDER BY avg_city_pop DESC
LIMIT 1;

# Question 8 : List continents where the average city population is greater than 200,000 ?
select Country.continent,
		avg(city.population) as avg_city_pop
from country 
join city
ON 
	country.code = City.Countrycode
Group by Continent
HAVING avg(city.population) > 200000;


# Question 9 : Find the total population and average life expectancy for each continent, ordered by average life expectancy descending ?
select Continent,
		sum(population) as total_pop,
        avg(LifeExpectancy) as avg_life_exp
From country
GROUP BY Continent
order by avg(lifeExpectancy) desc;


# Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where
#               total population is over 200 million ?

SELECT Continent,
		AVG(LifeExpectancy) as avg_life_exp,
        sum(Population) as total_pop
FROM Country
GROUP BY Continent
Having sum(population) > 200000000
ORDER BY AVG(LifeExpectancy) desc
LIMIT 3;
