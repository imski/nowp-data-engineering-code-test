/*
### Question 4: 
Consider the following relational database tables to store information about athletes and their birthplaces.

#### City

|city_id|city_name|city_country|city_population|city_hemisphere|
|:-----:|:-------:|:----------:|:-------------:|:-------------:|
|1      |Sao Paulo| Brazil| 12110000| S|
|2      |Toronto |Canada |2732000| N|

#### Athletes

|athlete_id|athlete_first_name|athlete_last_name|athlete_birthplace|athlete_sex|
|:--------:|:----------------:|:---------------:|:----------------:|:---------:|
|1 |Neymar |Silva| 1| M|
|2 |Natalie |Spooner |2| F|

##### Table “City” description: 
“city_id” is primary key and numeric,
“city_population” is numeric, while “city_name”, “city_country” and
“city_hemisphere” are text fields.

##### Table “Athletes” description: 
“athlete_id” is primary key and numeric,
“athlete_birthplace” is numeric, while “athletes_first_name”,
“athletes_last_name”, “athletes_sex” are text fields. The
“athlete_birthplace” is a foreign key and references the “city_id” field
of the “City” table.

#### Give SQL statements for the following:
a. Insert a new city to include, id: 3, name: Tokyo, Country: Japan, Population: 9,2 million, Hemisphere: North.
*/
-- ALL SQL statements below are for MS SQL Server.

INSERT INTO City
    ( city_id,
    city_population,
    city_name,
    city_country,
    city_hemisphere )
VALUES( 3,
        9200000,
        'Tokyo',
        'Japan',
        'N')
/*
b. Update Tokyo population to 9,73 million.
*/
UPDATE City
SET city_population=9730000
WHERE city_name='Tokyo'
/*
c. Query the city table for the cities in the northern hemispher and with population greater than 10 million.
*/
SELECT *
FROM City
WHERE city_hemisphere='N'
    AND city_population > 10000000
/*
d. Query the city table for the sum of the populations of cities in the northern hemisphere.
*/
SELECT SUM(city_population)
FROM City
WHERE city_hemisphere='N'
/*
e. Query for athletes first name, last name and birth place.
*/
SELECT athlete_first_name, athlete_last_name, athlete_birthplace
FROM Athletes
/*
f. Query for all athletes who were born in the southern hemisphere. 
*/
SELECT a.*
FROM Athletes a
INNER JOIN City c ON a.athlete_birthplace = c.city_id
WHERE c.city_hemisphere='S'
/*
g. Query for female athletes born in a city with population over 5 million.
*/
SELECT a.*
FROM Athletes a
INNER JOIN City c ON a.athlete_birthplace = c.city_id
WHERE c.city_population > 5000000
    AND a.athlete_sex = 'F'
/*
h. Query for the athlete born in a city that has the highestpopulation.
*/
DECLARE @max_pop INTEGER
SET @max_pop = ( SELECT MAX(city_population)
                FROM City )
SELECT a.*
FROM Athletes a
WHERE a.athlete_birthplace = (SELECT c.city_id
                                FROM City c 
                                WHERE c.city_population = @max_pop
                                )
