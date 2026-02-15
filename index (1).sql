--create database DDL Class --Code 1.0
CREATE DATABASE united_nations;

--use database
USE united_nations;

--create a table
CREATE TABLE access_to_basic_services(
    Region VARCHAR(32),
    Sub_region VARCHAR(25),
    Country_name INTEGER NOT NULL,
    Time_period INTEGER NOT NULL,
    Pct_managed_drinking_water_services NUMERIC(5,2),
    Pct_managed_sanitation_services NUMERIC(5,2),
    Est_population_in_millions NUMERIC(11,6),
    Est_gdp_in_billions NUMERIC(8,2),
    Land_area NUMERIC(10,2),
    Pct_unemployment NUMERIC(5,2)
);

--modify country name data type
ALTER TABLE access_to_basic_services
MODIFY COLUMN Country_name VARCHAR(37);

--add new column 
ALTER TABLE access_to_basic_services
ADD COLUMN Gini_index FLOAT;

--drop column
ALTER TABLE access_to_basic_services
DROP COLUMN Gini_index

--drop table
DROP TABLE Gini_index

--drop database
DROP DATABASE united_nations



--=============================================================
--data manipulation
--create database
CREATE DATABASE united_nations;

--use database
USE united_nations;

--create table
CREATE TABLE access_to_basic_services(
    Region VARCHAR(32),
    Sub_region VARCHAR(25),
    Country_name VARCHAR(35) NOT NULL,
    Time_period INTEGER NOT NULL,
    Pct_managed_drinking_water_services NUMERIC(5,2),
    Pct_managed_sanitation_services NUMERIC(5,2),
    Est_population_in_millions NUMERIC(11,6),
    Est_gdp_in_billions NUMERIC(8,2),
    Land_area NUMERIC(10,2),
    Pct_unemployment NUMERIC(5,2)
);
--insert into table
INSERT INTO access_to_basic_services(
    Region,
    Sub_region,
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions,
    Land_area,
    Pct_unemployment
) VALUES 
    ('Central and Southern Asia', 'Central Asia', 'Kazakhstan', 2020, 95.0, 98.0, 18.755666, 271.08, 2699700.0, 4.09),
    ('Sub-Saharan Africa', 'Southern Africa', 'Namibia', 2020, 83.67, 35.0, 2.489098, 10.58, 623290.0, NULL),
    ('Sub-Saharan Africa', 'Southern Africa', 'Lesotho', 2020, 76.33, 49.67, 2.2541, 2.23, 30030.0, NULL),
    ('Sub-Saharan Africa', 'Southern Africa', 'Botswana', 2020, 89.67, 74.33, 2.546402, 14.93, 566730.0, 21.02);

--delete row in a table
DELETE FROM access_to_basic_services
WHERE Sub_region = 'Central Asia'





--=============================================================
--Truncate Data Import CSV Walkthrough
--truncate table
TRUNCATE TABLE access_to_basic_services

-- SELECT all columns in the database
SELECT
    *
FROM
    Access_to_Basic_Services;

--update data in a table
UPDATE access_to_basic_services 
SET Pct_unemployment = 4.53  
WHERE Country_name = 'China'  
AND Time_period = 2016;


--=============================================================
--Select and Select where
-- SELECT all columns in the database
-- we will use scripts to create database and table and data

SELECT
    *
FROM
    Access_to_Basic_Services;

-- SELECT all columns and LIMIT to 10 rows
SELECT
    *
FROM
    Access_to_Basic_Services
LIMIT 10;

-- SELECT distinct column
SELECT DISTINCT 
    Country_name
FROM 
    Access_to_Basic_Services;

-- Saving the query into a table 
CREATE TABLE 
    Country_list(
        Country_name VARCHAR(225)
    );
INSERT INTO Country_list(
    Country_name
)
SELECT DISTINCT 
    Country_name
FROM 
    Access_to_Basic_Services;



-- Check for country that has the lowest pct of people with access tp managed drinking water services
SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services AS pct_access_water
FROM 
    Access_to_Basic_Services
WHERE 
    Time_period = 2020;


--=============================================================

-- 4.8 Using Logical And Comparison Operations 

-- This query selects data from Access_to_Basic_Services for certain African countries
-- Specifically, it selects:
--   Country_name, Time_period, % managed drinking water services, % managed sanitation services,
--   estimated population (in millions), and estimated GDP (in billions).
--
-- The WHERE clause logic works as follows:
--   - If Country_name is 'South Africa', then Time_period must be between 2019 and 2020.
--   - For all the other listed countries (Nigeria, Ethiopia, Congo, Egypt, Tanzania, Kenya),
--     they will be included regardless of the time period, because no explicit time condition is applied to them.
--
-- Note: Because of operator precedence, the AND condition only applies to 'South Africa'.

SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions
FROM
    Access_to_Basic_Services
WHERE
    Country_name = 'Nigeria'
    OR Country_name = 'Ethiopia'
    OR Country_name = 'Congo'
    OR Country_name = 'Egypt'
    OR Country_name = 'Tanzania'
    OR Country_name = 'Kenya'
    OR Country_name = 'South Africa'
    AND Time_period BETWEEN 2019 AND 2020;

-- This query selects data from the Access_to_Basic_Services table
-- It retrieves country name, time period, percentage with managed drinking water services,
-- percentage with managed sanitation services, estimated population (in millions),
-- and estimated GDP (in billions)
--
-- The WHERE clause logic works as follows:
--   - It filters for records where Country_name is one of the following:
--     'Nigeria', 'Ethiopia', 'Congo', 'Egypt', 'Tanzania', 'Kenya', or 'South Africa'
--   - It also requires that Time_period is between 2019 and 2020 for all selected countries


SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions
FROM
    Access_to_Basic_Services
WHERE
    (
    Country_name = 'Nigeria',
    OR Country_name = 'Ethiopia',
    OR Country_name = 'Congo',
    OR Country_name = 'Egypt',
    OR Country_name = 'Tanzania',
    OR Country_name = 'Kenya',
    OR Country_name = 'South Africa'
    )
    AND Time_period BETWEEN 2019 AND 2020;

/* 
   Select countries from Access_to_Basic_Services table
   where the time period is 2020,
   the percentage of managed drinking water services is less than or equal to 50,
   and the percentage of managed sanitation services is less than or equal to 50
*/


SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions
FROM
    Access_to_Basic_Services
WHERE
    Time_period = 2020
    AND Pct_managed_sanitation_services <= 50
    AND Pct_managed_drinking_water_services <= 50;


-- 4.9 Using Logical And Comparison Operators II
-- This query selects data from the Access_to_Basic_Services table
-- It retrieves the following columns:
--   - Country_name
--   - Time_period
--   - Percentage with managed drinking water services
--   - Percentage with managed sanitation services
--   - Estimated population in millions
--   - Estimated GDP in billions
--   - Region
--
-- The WHERE clause filters for:
--   - Records where Region is 'Sub-Saharan Africa'
--   - Records where Time_period is 2020
--
-- This effectively returns data for all Sub-Saharan African countries
-- for the year 2020 only.

SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions,
    Region
FROM
    Access_to_Basic_Services
WHERE
    Region = 'Sub-Saharan Africa'
AND
    Time_period = 2020;

-- This query selects data from the Access_to_Basic_Services table
-- It retrieves the following columns:
--   - Country_name
--   - Time_period
--   - Percentage with managed drinking water services
--   - Percentage with managed sanitation services
--   - Estimated population in millions
--   - Estimated GDP in billions
--   - Region
--
-- The WHERE clause filters for:
--   - Records where the Region is 'Sub-Saharan Africa'
--   - Records where Time_period is 2020
--   - Records where Est_gdp_in_billions is NULL
--
-- This means it returns data for Sub-Saharan African countries in 2020
-- where estimated GDP data is missing (i.e., Est_gdp_in_billions has no value)

SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions,
    Region
FROM
    Access_to_Basic_Services
WHERE
    Region = 'Sub-Saharan Africa'
AND
    Time_period = 2020
AND 
	Est_gdp_in_billions IS NULL;


-- This query selects data from the Access_to_Basic_Services table
-- It retrieves the following columns:
--   - Country_name
--   - Time_period
--   - Percentage with managed drinking water services
--   - Percentage with managed sanitation services
--   - Estimated population in millions
--   - Estimated GDP in billions
--   - Region
--
-- The WHERE clause filters for:
--   - Records where Region is 'Sub-Saharan Africa'
--   - Records where Time_period is 2020
--   - Records where Est_gdp_in_billions is NOT NULL
--
-- This means it returns data for Sub-Saharan African countries in 2020
-- but only for countries that have estimated GDP data available 
-- (i.e., Est_gdp_in_billions has a value)

SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions,
    Region
FROM
    Access_to_Basic_Services
WHERE
    Region = 'Sub-Saharan Africa'
AND
    Time_period = 2020
AND 
	Est_gdp_in_billions IS NOT NULL;



-- This query selects data from the Access_to_Basic_Services table
-- It retrieves the following columns:
--   - Country_name
--   - Time_period
--   - Percentage with managed drinking water services
--   - Percentage with managed sanitation services
--   - Estimated population in millions
--   - Estimated GDP in billions
--   - Region
--
-- The WHERE clause filters for:
--   - Records where Region is 'Sub-Saharan Africa'
--   - Records where Time_period is 2020
--   - Records where Est_gdp_in_billions is NOT NULL
--   - Records where Country_name is one of the following:
--     'Nigeria', 'South Africa', 'Ethiopia', 'Kenya', or 'Ghana'
--
-- This means it returns data for 2020 only,
-- for selected major Sub-Saharan African countries that have available GDP estimates

SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions,
    Region
FROM
    Access_to_Basic_Services
WHERE
    Region = 'Sub-Saharan Africa'
AND
    Time_period = 2020
AND 
	Est_gdp_in_billions IS NOT NULL
AND
    Country_name IN ('Nigeria','South Africa','Ethiopia','Kenya','Ghana');

-- This query selects data from the Access_to_Basic_Services table
-- It retrieves the following columns:
--   - Country_name
--   - Time_period
--   - Percentage with managed drinking water services
--   - Percentage with managed sanitation services
--   - Estimated population in millions
--   - Estimated GDP in billions
--   - Region
--
-- The WHERE clause filters for:
--   - Records where Region is 'Sub-Saharan Africa'
--   - Records where Time_period is 2020
--   - Records where Est_gdp_in_billions is NOT NULL (i.e., GDP data is available)
--   - Records where Country_name is NOT in the list:
--     'Nigeria', 'South Africa', 'Ethiopia', 'Kenya', or 'Ghana'
--
-- This means it returns data for all Sub-Saharan African countries in 2020
-- that have GDP estimates available,
-- but excludes these major countries: Nigeria, South Africa, Ethiopia, Kenya, and Ghana

SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions,
    Region
FROM
    Access_to_Basic_Services
WHERE
    Region = 'Sub-Saharan Africa'
AND
    Time_period = 2020
AND
    Est_gdp_in_billions IS NOT NULL
AND
    Country_name NOT IN ('Nigeria','South Africa','Ethiopia','Kenya','Ghana');

--4.10 The LIKE Operator Wildcards
--This specify the data where 
-- Country_name is Iran OR Country_name is Korea

SELECT
     *
FROM 
    Access_to_Basic_Services
WHERE
    Country_name = "Iran"
    OR Country_name = "Korea"

-- We use wildcards to for patterns in the country_name

SELECT 
    *
FROM Access_to_Basic_Services

WHERE 
    Country_name LIKE 'Iran%'
    OR Country_name LIKE '%_Republic of Korea'

--We use the wildcards to specify the columns we want to see 


SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services
FROM Access_to_Basic_Services

WHERE 
    Country_name LIKE 'Iran%'
    OR Country_name LIKE '%_Republic of Korea'




SELECT
    Sub_region,
    Country_name,
    Land_area,
    SUM(land_area) OVER (
        PARTITION BY Sub_region
    ) AS Pct_sub_region_land_area
FROM
    united_nations.Access_to_Basic_Services
WHERE
    Time_period = 2020
    AND land_area IS NOT NULL;



SELECT
    Sub_region,
    Country_name,
    Land_area,
    ROUND(Land_area / SUM(land_area) OVER (
        PARTITION BY Sub_region
    )) AS Pct_sub_region_land_area
FROM
    united_nations.Access_to_Basic_Services
WHERE
    Time_period = 2020
    AND land_area IS NOT NULL;


SELECT
    Sub_region,
    Country_name,
    Time_period,
    Est_population_in_millions,
    ROUND(Avg(Est_population_in_millions) OVER (
        PARTITION BY Sub_region); 4 ) AS Running_avg_population
FROM
    united_nations.Access_to_Basic_Services
WHERE
    Est_population_in_millions IS NOT NULL;
SELECT
    Sub_region,
    Country_name,
    Time_period,
    Est_population_in_millions,
    ROUND(
        AVG(Est_population_in_millions) OVER (
            PARTITION BY Sub_region
            ORDER BY Time_period
        ), 4
    ) AS Running_avg_population
FROM
    united_nations.Access_to_Basic_Services
WHERE
    Est_population_in_millions IS NOT NULL;


SELECT
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    ROW_NUMBER() OVER(PARTITION BY Time_period
    ORDER BY Pct_managed_drinking_water_services ASC) AS Rank_of_water_services
FROM united_nations.Access_to_Basic_Services;


SELECT
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    LAG(Pct_managed_drinking_water_services) OVER(PARTITION BY Country_name ORDER BY Time_period ASC) AS Prev_year_pct_managed_drinking_water_services 
FROM 
    united_nations.Access_to_Basic_Services;





-- we are going to see how we can clean our data using the text function in the country name.
--We notice that there is a dirty data that actually includes the opening bracket and close bracket.



SELECT DISTINCT
    Country_name,
    Time_period,
    Est_population_in_millions
FROM united_nations.Access_to_Basic_Services;


--So let's filter out only where we have the, um, opening brackets and closing
--brackets in the country column by using the where keyword.

SELECT
    DISTINCT Country_name
FROM
    united_nations.Access_to_Basic_Services
WHERE
    Country_name LIKE '%(%)%'


--we want to count the country name. And after then we are going to get the position of the opening bracket.


SELECT 
    DISTINCT Country_name,
    LENGTH(Country_name) AS string_length,
    POSITION('(' IN Country_name) AS position_opening_bracket
FROM
    united_nations.Access_to_Basic_Services
WHERE
    Country_name LIKE '%(%)%'

--After getting the position of the opening bracket, we can use the left keyword to extract data from
--the position of the opening brackets.

SELECT 
    DISTINCT Country_name,
    LENGTH(Country_name) AS string_length,
    POSITION('(' IN Country_name) AS position_opening_bracket,
    LEFT(Country_name, POSITION('(' IN Country_name)) AS new_country_name,

FROM
    united_nations.Access_to_Basic_Services
WHERE
    Country_name LIKE '%(%)%'

--So we can actually use this position to be able to extract our data from the left, uh, and inside of our text.
--So we're going to use make use of the keyword called left.


SELECT 
    DISTINCT Country_name,
    LENGTH(Country_name) AS string_length,
    POSITION('(' IN Country_name) AS position_opening_bracket,
    LEFT(Country_name, POSITION('(' IN Country_name)-1) AS new_country_name,
    LENGTH(LEFT(Country_name, POSITION('(' IN Country_name)-1)) AS new_country_name_length,
FROM
    united_nations.Access_to_Basic_Services
WHERE
    Country_name LIKE '%(%)%'


--Now let's look for the length of the new country name that is just created, to check if there's any
--discrepancies or to check if there is any, um, error in terms of the number of lengths, because we
--should be expecting four as Aaron Instant.


SELECT 
    DISTINCT Country_name,
    LENGTH(Country_name) AS string_length,
    POSITION('(' IN Country_name) AS position_opening_bracket,
    RTRIM(LEFT(Country_name, POSITION('(' IN Country_name)-1)) AS new_country_name,
    LENGTH(RTRIM(LEFT(Country_name, POSITION('(' IN Country_name)-1))) AS new_country_name_length,
FROM
    united_nations.Access_to_Basic_Services
WHERE
    Country_name LIKE '%(%)%'


--We make this decision to form custom country IDs by combining the country name the year and the population


SELECT
    DISTINCT Country_name,
    Time_period,
    Est_population_in_millions,
    CONCAT(
    Country_name,
    Time_period,
    Est_population_in_millions
    ) As Country_id
FROM
    united_nations.Access_to_Basic_Services;


--we can notice that there is a is no value in our country ID, so if there is any null value in the
--estimated population in millions or any columns, it's actually going to return as null value in our
--country ID.


DISTINCT Country_name,
Time_period,
Est_population_in_millions,
CONCAT(
    IFNULL(Country_name,'UNKNOWN'),
    IFNULL(Time_period,'UNKNOWN'),
    IFNULL(Est_population_in_millions,'UNKNOWN')
) AS Country_id
FROM
    united_nations.Access_to_Basic_Services;


--But um, after careful consideration we come to a decision to that our custom ID should maintain a certain
--level of consistency. This contain tools, these two requirements.
--First converting all letters in each ID to uppercase. And then secondly, we're actually going to use ensuring 
--that all the IDs have the same length. So to begin addressing this issue we are going to use 
--the upper um upper functions to convert the um, the country name.

SELECT 
    DISTINCT Country_name,
    Time_period,
    Est_population_in_millions,
    CONCAT(
        SUBSTRING(UPPER(IFNULL(Country_name, 'UNKNOWN')), 1, 4),
        SUBSTRING(IFNULL(Time_period, 'UNKNOWN'), 1, 4),
        SUBSTRING(IFNULL(Est_population_in_millions, 'UNKNOWN'), -7)
    ) AS Country_id
FROM 
    united_nations.Access_to_Basic_Services;



--we're going to use the case statement to classify country
--into their regional economic communities, or we'll call it RECs in short form, which are actually
--designed to foster economic integration and cooperation between African countries.
--The African Union recognizes eight of these RECs.
--We'll focus on just the RECs, which is the Sadc, the U m A and the equals.

/* 
Regional Economic Communities (RECs)
    Arab Maghreb Union (UMA)
    Common Market for Eastern and Southern Africa (COMESA)
    Community of Sahel-Saharan States (CEN-SAD)
    East African Community (EAC)
    Economic Community of Central African States (ECCAS)
    Economic Community of West African States (ECOWAS)
    Intergovernmental Authority on Development (IGAD)
    Southern African Development Community (SADC)
*/




Task 1

USE united_nations;
SELECT *
FROM united_nations.Access_to_Basic_Services
WHERE Region like "%Africa%";


Task 2

SELECT 
    CASE
        WHEN Country_name IN ("Angola", "Botswana", "Comoros", "Democratic Republic of Congo", "Eswatini",
        "Lesotho", "Madagascar", "Malawi", "Mauritius", "Mozambique", "Namibia",
        "Seychelles", "South Africa", "United Republic Tanzania", "Zambia", "Zimbabwe")
        THEN "SADC"
        ELSE "Not Classified"
    END AS Regional_economic_community
FROM united_nations.Access_to_Basic_Services
WHERE Region like "%Africa%";

Task 3

SELECT
    CASE
        WHEN Country_name IN ('Angola', 'Botswana', 'Comoros', 'Democratic Republic of Congo', 'Eswatini',
                              'Lesotho', 'Madagascar', 'Malawi', 'Mauritius', 'Mozambique', 'Namibia',
                              'Seychelles', 'South Africa', 'United Republic Tanzania', 'Zambia', 'Zimbabwe')
        THEN 'SADC'
        ELSE 'Not Classified'
    END AS Regional_economic_community,
    Country_name,
    Pct_managed_drinking_water_services
FROM united_nations.Access_to_Basic_Services
WHERE Region LIKE '%Africa%';


Task 4

SELECT
    CASE
        WHEN Country_name IN ('Angola', 'Botswana', 'Comoros', 'Democratic Republic of Congo', 'Eswatini',
                              'Lesotho', 'Madagascar', 'Malawi', 'Mauritius', 'Mozambique', 'Namibia',
                              'Seychelles', 'South Africa', 'United Republic Tanzania', 'Zambia', 'Zimbabwe')
        THEN 'SADC'

        WHEN Country_name IN ("Algeria", "Libya", "Mauritania", "Morocco", "Tunisia")
        THEN "UMA"

        ELSE 'Not Classified'
    END AS Regional_economic_community,
    Country_name,
    Pct_managed_drinking_water_services
FROM united_nations.Access_to_Basic_Services
WHERE Region LIKE '%Africa%';



Task 5

SELECT
    CASE
        WHEN Country_name IN ('Angola', 'Botswana', 'Comoros', 'Democratic Republic of Congo', 'Eswatini',
                              'Lesotho', 'Madagascar', 'Malawi', 'Mauritius', 'Mozambique', 'Namibia',
                              'Seychelles', 'South Africa', 'United Republic Tanzania', 'Zambia', 'Zimbabwe')
        THEN 'SADC'

        WHEN Country_name IN ("Algeria", "Libya", "Mauritania", "Morocco", "Tunisia")
        THEN "UMA"

        WHEN Country_name IN ("Condo", "Burkina Faso", "Cabo Verde", "Cote d'Ivoire", "Gambia", "Ghana", "Guinea",
            "Guinea-Bissau", "Liberia", "Mali", "Niger", "Nigeria", "Senegal", "Sierra Leone", "Togo")
        THEN "ECOMAS"
        
        ELSE 'Not Classified'
    END AS Regional_economic_community,
    Country_name,
    Pct_managed_drinking_water_services
FROM united_nations.Access_to_Basic_Services
WHERE Region LIKE '%Africa%';


Task 6

--the next step and tasks we want to do here, let's suppose that we want to find where the greatest
--need for investment is located. We want to calculate the minimum the average and the maximum capacity 
--of a managed drinking water services park that is per region.


SELECT
    CASE
        WHEN Country_name IN ('Angola', 'Botswana', 'Comoros', 'Democratic Republic of Congo', 'Eswatini',
                              'Lesotho', 'Madagascar', 'Malawi', 'Mauritius', 'Mozambique', 'Namibia',
                              'Seychelles', 'South Africa', 'United Republic Tanzania', 'Zambia', 'Zimbabwe')
        THEN 'SADC'

        WHEN Country_name IN ("Algeria", "Libya", "Mauritania", "Morocco", "Tunisia")
        THEN "UMA"

        WHEN Country_name IN ("Condo", "Burkina Faso", "Cabo Verde", "Cote d'Ivoire", "Gambia", "Ghana", "Guinea",
            "Guinea-Bissau", "Liberia", "Mali", "Niger", "Nigeria", "Senegal", "Sierra Leone", "Togo")
        THEN "ECOMAS"
        
        ELSE 'Not Classified'
    END AS Regional_economic_community,
    Country_name,
    MIN(Pct_managed_drinking_water_services) AS Min_pct_managed_drinking_water_services,
    AVG(Pct_managed_drinking_water_services) AS Avg_pct_managed_drinking_water_services,
    MAX(Pct_managed_drinking_water_services) AS Max_pct_managed_drinking_water_services
FROM united_nations.Access_to_Basic_Services
WHERE Region LIKE '%Africa%'
GROUP BY
    CASE
        WHEN Country_name IN ('Angola', 'Botswana', 'Comoros', 'Democratic Republic of Congo', 'Eswatini',
                              'Lesotho', 'Madagascar', 'Malawi', 'Mauritius', 'Mozambique', 'Namibia',
                              'Seychelles', 'South Africa', 'United Republic Tanzania', 'Zambia', 'Zimbabwe')
        THEN 'SADC'

        WHEN Country_name IN ("Algeria", "Libya", "Mauritania", "Morocco", "Tunisia")
        THEN "UMA"

        WHEN Country_name IN ("Condo", "Burkina Faso", "Cabo Verde", "Cote d'Ivoire", "Gambia", "Ghana", "Guinea",
            "Guinea-Bissau", "Liberia", "Mali", "Niger", "Nigeria", "Senegal", "Sierra Leone", "Togo")
        THEN "ECOMAS"
        
        ELSE 'Not Classified'
    END;


--Suppose we want to update data in the table that is missing or change over time based on certain criterias.
--Let's see how we can actually use if and nested if statement to oppose our access to basic services.
--Table include a column named PCT unemployment, which records the percentage of unemployment in various
--countries across different years.
--However, a large amount of records in this column contain null values, so we are going to use this
--table to be able to use the replace the null value. It will have a region which is the Central and Southern Asia.
--If the PCT unemployment is null, we are going to replace it with .59.



Region	Pct_regional_unemployment
Central and Southern Asia	19.59
Eastern and South Eastern Asia	22.64
Europe and North America	24.43
Latin America and the Caribbean	24.23
North Africa and Western Asia	17.84
Oceania	4.98
Sub-Saharan Africa	33.65


SELECT 
    Region,
    Pct_unemployment,
    IF((Region = "Central and Southern Asia") AND (Pct_unemployment IS NULL), 19.59, -999) AS New_pct_unemployment
FROM united_nations.Access_to_Basic_Services;


SELECT 
    Region,
    Pct_unemployment,
    IF(
        (Region = "Central and Southern Asia") AND (Pct_unemployment IS NULL), 19.59,
        IF(
            (Region = "Eastern and South-Eastern Asia") AND (Pct_unemployment IS NULL), 22.64,
            -999
        )
    ) AS New_pct_unemployment
FROM united_nations.Access_to_Basic_Services;




SELECT 
    Region,
    Pct_unemployment,
    IF( (Region = "Central and Southern Asia") AND (Pct_unemployment IS NULL), 19.59,
        IF( (Region = "Eastern and South-Eastern Asia") AND (Pct_unemployment IS NULL), 22.64,
            IF( (Region = "Europe and Northern America") AND (Pct_unemployment IS NULL), 24.43,
                IF( (Region = "Latin America and the Caribbean") AND (Pct_unemployment IS NULL), 24.23,
                    IF( (Region = "Northern Africa and Western Asia") AND (Pct_unemployment IS NULL), 17.84,
                        IF( (Region = "Oceania") AND (Pct_unemployment IS NULL), 4.98,
                            IF( (Region = "Sub-Saharan Africa") AND (Pct_unemployment IS NULL), 33.65,
                            -999 )
                        )
                    )
                )
            )
        )
    ) AS New_pct_unemployment
FROM united_nations.Access_to_Basic_Services;


--Let's have a look at a way to determine a living, standard and economic condition of a country.

--The gross domestic product per capita is a metric that allows us to either classify a country as an

--high income or medium income, or largely the low income based on international poverty line.

--In this walkthrough, we will go over how to calculate the GDP per capita and determine which country

--we are under this economic category.




SELECT DISTINCT
    Country_name,
    Time_period,
    Est_population_in_millions,
    Est_gdp_in_billions,
    (Est_gdp_in_billions / Est_population_in_millions) * 1000 AS GDP_per_capita
FROM united_nations.Access_to_Basic_Services
WHERE Est_gdp_in_billions IS NOT NULL;


--Let's see how we can add international poverty line to our query to begin classifying.

--Each country in this query had an additional comparison on the time period where each country, um,

--GDP and population are recorded. If the time period is earlier than 2017, the poverty line will be set to $1.90.

--And if it's otherwise, you're actually going to be set to $2.50.


SELECT DISTINCT
    Country_name,
    Time_period,
    Est_population_in_millions,
    Est_gdp_in_billions,
    (Est_gdp_in_billions / Est_population_in_millions) * 1000 AS GDP_per_capita,
    IF(Time_period < 2017, 1.90, 2.50) AS Poverty_line
FROM united_nations.Access_to_Basic_Services
WHERE Est_gdp_in_billions IS NOT NULL;


--Let's do a final comparison to our calculated Licit GDP per capita to the poverty line in order to classify

--each country's income level. In order to make multiple comparison, where the country's GDP per capita might be 

--categorized as either high, medium, or low income.


SELECT
    (Est_gdp_in_billions / Est_population_in_millions) * 1000 AS GDP_per_capita,
    (Est_gdp_in_billions / Est_population_in_millions) * (1000 / 365.25) AS GDP_per_capita_per_day,
    IF(Time_period < 2017, 1.90, 2.50) AS Poverty_line,
    CASE
        WHEN ((Est_gdp_in_billions / Est_population_in_millions) * (1000 / 365.25)) < IF(Time_period < 2017, 1.90, 2.50)
        THEN 'Low'
        WHEN ((Est_gdp_in_billions / Est_population_in_millions) * (1000 / 365.25)) > IF(Time_period < 2017, 1.90, 2.50)
        THEN 'High'
        ELSE 'Medium'
    END AS Income_group
FROM united_nations.Access_to_Basic_Services
WHERE Est_gdp_in_billions IS NOT NULL;




--So for instance, we are actually interested in creating a table that contains, um, only the geographic

--location data for each country in our Access to basic services table.

CREATE TABLE united_nations.Geographic_Location (
Country_name VARCHAR(37) PRIMARY KEY,
Sub_region VARCHAR(25),
Region VARCHAR(32),
Land_area NUMERIC(10,2)
);

INSERT INTO united_nations.Geographic_Location (Country_name, Sub_region, Region, Land_area)
SELECT Country_name,
       Sub_region,
       Region,
       Land_area
FROM united_nations.Access_to_Basic_Services





INSERT INTO united_nations.Geographic_Location (Country_name, Sub_region, Region, Land_area)  
SELECT Country_name  
    ,Sub_region  
    ,Region  
    ,Land_area  

FROM united_nations.Access_to_Basic_Services  
GROUP BY Country_name  
    ,Sub_region  
    ,Region;


--we are going to look at how to create composite key and foreign key.
--We actually interested in creating a table that contains data about access to basic services for each
--country and for each year from our access to basic services,
--This actually implies that both country name and time period can actually identify each unique entry.

CREATE TABLE united_nations.Basic_Services (
    Country_name VARCHAR(37),
    Time_period INTEGER,
    Pct_managed_drinking_water_services NUMERIC(5,2),
    Pct_managed_sanitation_services NUMERIC(5,2),
    PRIMARY KEY (Country_name, Time_period),
    FOREIGN KEY (Country_name) REFERENCES Geographic_Location (Country_name)
);




INSERT INTO Basic_Services (Country_name, Time_period, Pct_managed_drinking_water_services, Pct_managed_sanitation_services)
SELECT Country_name,
       Time_period,
       Pct_managed_drinking_water_services,
       Pct_managed_sanitation_services
FROM united_nations.Access_to_Basic_Services;


--we are actually going to create a table to separate the economic indicators in the Access to basic
--since this metric is actually for country and for each year, country and time period
--will be the primary key in this table.

--And we will have a foreign key which actually, um, link to the primary key in the geographic Location

--table.

CREATE TABLE united_nations.Economic_indicators (
    Country_name VARCHAR(37),
    Time_period INTEGER,
    Est_gdp_in_billions NUMERIC(10,2),
    Est_population_in_millions NUMERIC(11,2),
    Pct_unemployment NUMERIC(5,2),
    PRIMARY KEY (Country_name, Time_period),
    FOREIGN KEY (Country_name) REFERENCES Geographic_Location(Country_name)
);




INSERT INTO Economic_Indicators (
    Country_name, 
    Time_period, 
    Est_gdp_in_billions, 
    Est_population_in_millions, 
    Pct_unemployment
)
SELECT 
    Country_name,
    Time_period,
    Est_gdp_in_billions,
    Est_population_in_millions,
    Pct_unemployment
FROM 
    united_nations.Access_to_Basic_Services;


--we are going to be looking at how to create entity diagram relationship.

--We've actually separated out our basic services geography location.

--And the economic indicators.

--We want to look at how these three tables that we created are related to each other using the e D r

--which is the entity diagram relationship.





SELECT
    *
FROM
    united_nations.Geographic_Location as geo;


SELECT
    *
FROM
    united_nations.Geographic_Location as geo
LEFT JOIN
    united_nations.Economic_Indicators as econ
    ON geo.Country_name = econ.Country_name;


SELECT
    *
FROM
    united_nations.Geographic_Location as geo
LEFT JOIN
    united_nations.Economic_Indicators as econ
    ON geo.Country_name = econ.Country_name
LEFT JOIN
    united_nations.Basic_Services as svc
    ON geo.Country_name = svc.Country_name



SELECT
    *
FROM
    united_nations.Geographic_Location as geo
LEFT JOIN
    united_nations.Economic_Indicators as econ
    ON geo.Country_name = econ.Country_name
LEFT JOIN
    united_nations.Basic_Services as svc
    ON geo.Country_name = svc.Country_name
    AND econ.Time_period = svc.Time_period;

--Suppose we want a summary of estimated unemployment rate per country for each given time period.

--And we suspect that certain data entries of the unemployment rate might be missing.

--To address this issue, we intend to replace the absent value by using the original estimated and employment

--rates available in this table.



| Region                           | Pct_regional_unemployment |
| -------------------------------- | ------------------------- |
| Central and Southern Asia        | 19.59                     |
| Eastern and South-Eastern Asia   | 22.64                     |
| Europe and Northern America      | 24.43                     |
| Latin America and the Caribbean  | 24.23                     |
| Northern Africa and Western Asia | 17.84                     |
| Oceania                          | 4.98                      |
| Sub-Saharan Africa               | 33.65                     |




SELECT
    loc.Country_name
FROM
    united_nations.Geographic_Location AS loc
WHERE REGION LIKE 'Central and Southern Asia';


SELECT
    loc.Country_name,
    eco.Time_period,
    eco.Pct_unemployment

FROM
    united_nations.Geographic_Location AS loc
LEFT JOIN
    united_nations.Economic_Indicators AS eco
    ON eco.Country_name = loc.Country_name

WHERE REGION LIKE '%Central and Southern Asia%';



SELECT
    loc.Country_name,
    eco.Time_period,
    eco.Pct_unemployment

FROM
    united_nations.Geographic_Location AS loc
LEFT JOIN
    united_nations.Economic_Indicators AS eco
    ON eco.Country_name = loc.Country_name

WHERE REGION LIKE '%Central and Southern Asia%'

UNION 

SELECT
    loc.Country_name,
    eco.Time_period,
    eco.Pct_unemployment

FROM
    united_nations.Geographic_Location AS loc
LEFT JOIN
    united_nations.Economic_Indicators AS eco
    ON eco.Country_name = loc.Country_name

WHERE REGION LIKE '%Eastern and Southeastern Asia%'

UNION

SELECT
    loc.Country_name,
    eco.Time_period,
    eco.Pct_unemployment

FROM
    united_nations.Geographic_Location AS loc
LEFT JOIN
    united_nations.Economic_Indicators AS eco
    ON eco.Country_name = loc.Country_name

WHERE REGION LIKE '%Europe and Northern America%';

UNION

SELECT
    loc.Country_name,
    eco.Time_period,
    eco.Pct_unemployment

FROM
    united_nations.Geographic_Location AS loc
LEFT JOIN
    united_nations.Economic_Indicators AS eco
    ON eco.Country_name = loc.Country_name

WHERE REGION LIKE '%Latin America and the Caribbean%';

UNION

SELECT
    loc.Country_name,
    eco.Time_period,
    eco.Pct_unemployment

FROM
    united_nations.Geographic_Location AS loc
LEFT JOIN
    united_nations.Economic_Indicators AS eco
    ON eco.Country_name = loc.Country_name

WHERE REGION LIKE '%Northern Africa and Western Asia%';

UNION

SELECT
    loc.Country_name,
    eco.Time_period,
    eco.Pct_unemployment

FROM
    united_nations.Geographic_Location AS loc
LEFT JOIN
    united_nations.Economic_Indicators AS eco
    ON eco.Country_name = loc.Country_name

WHERE REGION LIKE '%Oceania%';


UNION

SELECT
    loc.Country_name,
    eco.Time_period,
    eco.Pct_unemployment

FROM
    united_nations.Geographic_Location AS loc
LEFT JOIN
    united_nations.Economic_Indicators AS eco
    ON eco.Country_name = loc.Country_name

WHERE REGION LIKE 'Sub-Saharan Africa%';


--Imagine we want to calculate the percentage of land a specific country in the subregion occupy as percentage

--of the total land area in that region.


SELECT
  country_name,
  ROUND(land_area / (total_area_for_mid_Africa) * 100) as pct_regional_land
FROM Geographic_location
WHERE Sub_region = 'Middle Africa'

SELECT 
    SUM(land_area) 
FROM 
    Geographic_Location 
WHERE 
    Sub_region = "Middle Africa"


SELECT
    country_name,
    ROUND(land_area / (3888270.00) * 100) AS pct_regional_land
FROM
    Geographic_Location
WHERE
    Sub_region = 'Middle Africa'


--replacing the value that we have inside here by replacing

--it with the query that produced this value here.

--So this is actually going to be a query inside another query.

--So the query that we're going to have inside is going to be our inner query.

SELECT
    country_name,
    ROUND(land_area / (
        SELECT
            SUM(land_area)
        FROM
            Geographic_location
        WHERE
            Sub_region = 'Polynesia'
    ) * 100) AS pct_regional_land
FROM
    Geographic_location
WHERE
    Sub_region = 'Polynesia'


SELECT
    country_name,
    ROUND(land_area / (
        SELECT
            SUM(land_area)
        FROM
            Geographic_Location
        WHERE
            Sub_region = g.Sub_region
    ) * 100) AS pct_regional_land
FROM
    Geographic_Location AS g



--calculating the subregion


SELECT
    sub_Region,
    SUM(land_area) AS TotalLandArea
FROM
    Geographic_Location
GROUP BY
    sub_Region

-- joining the subregion

SELECT
    geoloc.Country_name,
    geoloc.Land_area,
    geoloc.sub_Region,
    (geoloc.Land_area / land_per_region.TotalLandArea) * 100 AS PctOfRegionLand
FROM
    Geographic_Location AS geoloc
JOIN
    (Subquery) AS land_per_region
    ON geoloc.sub_region = land_per_region.sub_region;



--Let's say we want to get the average GDP and population for countries with unemployment rates above 5%.

SELECT
    Country_name,
    AVG(Est_gdp_in_billions) AS Avg_GDP,
    AVG(Est_population_in_millions) AS Avg_Population
FROM 
    (subquery) AS FilteredCountries

GROUP BY Country_name,
    


SELECT
    Country_name,
    Est_gdp_in_billions,
    Est_population_in_allions
FROM ECONOMIC_Indicators
WHERE
    Pct_unemployment > 5
    AND Time_period = 2020



--We'll use the query this question to create a query for the year 2020.

--Which country has the GDP above the global average, but still have less than 90% of their population

--with access to managed drinking water services?


SELECT
    econ.Country_name,
    econ.Time_period,
    econ.Est_gdp_in_billions,
    service.Pct_managed_drinking_water_services
FROM
    Economic_Indicators AS econ
INNER JOIN
    Basic_Services AS service
ON
    econ.Country_name = service.Country_name
    AND econ.Time_period = service.Time_period
WHERE
    econ.Time_period = 2020
    AND service.Pct_managed_drinking_water_services < 90
    AND econ.Est_gdp_in_billions > (subquery);


SELECT
    AVG(Est_gdp_in_billions)
FROM
    Economic_Indicators
WHERE
    Time_period = 2020










SELECT
    Region,
    Country_name,
    Pct_managed_drinking_mater_services,
    Pct_managed_sanitation_services,
    Est_gdp_in_billions
FROM united_nations.access_to_Basic_Services
WHERE Region = 'Sub-Saharan Africa'
    AND Time_period = 2020



SELECT
    Region,
    Country_name,
    Pct_managed_drinking_mater_services,
    Pct_managed_sanitation_services,
    Est_gdp_in_billions,
    AVG(Est_gdp_in_billions) OVER(PARTITION BY Region) as Avg_gdp_for_region
FROM united_nations.Access_to_Basic_Services
WHERE Region = 'Sub-Saharan Africa'
    AND Time_period = 2020
    AND Pct_managed_drinking_mater_services < 60
    AND Est_gdp_in_billions = Avg_gdp_for_region;