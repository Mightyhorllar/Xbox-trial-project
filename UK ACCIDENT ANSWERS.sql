--QUESTION 1 --

/**Provide a month by month breakdown of vehicle accidents for each 
region of GB by vehicle type, vehicle direction from, 
vehicle direction to and the severity of the accidents from 2015 to 2019.**/


SELECT a.accident_year, DATE_TRUNC (‘month’, a.dates) AS months, v.vehicle_type, v.vehicle_direction_from, v.vehicle_direction_to, sum(a.number_of_vehicles) AS sum_of_vehicles, a.accident_severity, e.region
FROM accident a JOIN vehicle v ON (a.accident_reference = v.accident_reference) JOIN england e ON (a.lsoa_of_accident_location = e.LSOA11CD)
GROUP BY 1,EXTRACT (MONTH FROM a.dates),3,4,5,7,8
ORDER BY 1, 2




SELECT CONCAT(a.accident_year , '/', EXTRACT(month FROM dates)) AS months, v.vehicle_type, v.vehicle_direction_from, v.vehicle_direction_to, sum(a.number_of_vehicles) AS sum_of_vehicles, a.accident_severity, e.region
FROM accident a JOIN vehicle v ON (a.accident_reference = v.accident_reference) JOIN england e ON (a.lsoa_of_accident_location = e.LSOA11CD)
GROUP BY 1,2,3,4,6,7
ORDER BY 1

OR

SELECT a.accident_year, CONCAT(a.accident_year , '/', EXTRACT(month FROM dates)) AS months, v.vehicle_type, v.vehicle_direction_from, v.vehicle_direction_to, sum(a.number_of_vehicles) AS sum_of_vehicles, a.accident_severity, e.region
FROM accident a JOIN vehicle v ON (a.accident_reference = v.accident_reference) JOIN england e ON (a.lsoa_of_accident_location = e.LSOA11CD)
GROUP BY 1,2,3,4,5,7,8
ORDER BY 1, 2

OR 

SELECT CONCAT(a.accident_year,'-', date_part('month', a.dates)) AS months, v.vehicle_type, v.vehicle_direction_from, v.vehicle_direction_to, sum(a.number_of_vehicles) AS sum_of_vehicles, a.accident_severity, e.region
FROM accident a JOIN vehicle v ON (a.accident_reference = v.accident_reference) JOIN england e ON (a.lsoa_of_accident_location = e.LSOA11CD)
GROUP BY 1,2,3,4,6,7







-- QUESTION 2--
/** What is the impact of weather condition, light condition, road surface condition on vehicle accidents 
in GB from 2015 to 2019. **/

SELECT accident_year, SUM(light_conditions)AS sum_light_condition, SUM(weather_conditions) AS sum_weather_conditions, SUM(road_surface_conditions) AS sum_road_surface_condition, SUM(number_of_vehicles) AS sum_number_of_vehicles
FROM accident
GROUP BY 1
ORDER BY 1

/** This shows that we have higher number of vehicle accidents in 2015 due to the impact of weather condition, light 
condition and road surface condtion. **/


-- QUESTION 3 --
/** What is the number of cars involved in RTA by the sex of driver, age band of driver in York Shie from 
2015 to 2019 **/

SELECT a.accident_year, SUM(a.number_of_vehicles) AS sum_of_vehicles, v.sex_of_driver, v.age_band_of_driver, e.region
FROM accident a JOIN vehicle v ON (a.accident_reference = v.accident_reference) JOIN england e ON (a.lsoa_of_accident_location = e.LSOA11CD)
WHERE e.region LIKE 'Yorkshire%'
GROUP BY a.accident_year, v.sex_of_driver, v.age_band_of_driver, e.region
ORDER BY 1



-- QUESTION 4
/** On each day of the week, what is the number of cars involved in RTA by area(Urban or Rural) of the accident 
from 2015 to 2019 in York shire **/

SELECT a.accident_year, SUM(a.number_of_vehicles) AS sum_of_vehicles, a.day_of_week, a.urban_or_rural_area, e.region
FROM accident a 
JOIN england e ON (a.lsoa_of_accident_location = e.LSOA11CD)
WHERE e.region LIKE 'Yorkshire%'
GROUP BY 1,3,4,5
ORDER BY 1 ASC


-- QUESTION 5 --
/** Provide an insight into the number of Cars involved in RTA by the road type and vehicle manoeuvre
in Yorkshire from 2015 to 2019. **/ 

SELECT a.accident_year, SUM(a.number_of_vehicles) AS sum_of_vehicles, a.road_type, v.vehicle_manoeuvre, e.region
FROM accident a 
JOIN vehicle v ON (a.accident_reference = v.accident_reference) 
JOIN england e ON (a.lsoa_of_accident_location = e.LSOA11CD)
WHERE e.region LIKE 'Yorkshire%'
GROUP BY 1,3,4,5
ORDER BY 1