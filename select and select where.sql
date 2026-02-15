use united_nations;
-- SELECT all columns in the database
SELECT
	*
    FROM 
        access_to_basic_services;
    -- SELECT all columns and limit to 10 rows
    select
    *
    from
    access_to_basic_services
    limit 10;
    

-- select distinct column
select distinct
country_name
from
access_to_basic_services;

-- saving query into a table
create table
country_list(
country_name varchar(225)
);
insert into country_list(
country_name
)
select distinct
country_name
from
access_to_basic_services

																														-- check for country that has the lowest pct of people with access to managed drinking water services
																														select
																														 country_name,
																														time_period,
																														pct_managed_drinking_water_services as pct_access_water
																														from
																														access_to_basic_services
																														where 
																														time_period = 2020;