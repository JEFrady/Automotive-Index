--Setup--
CREATE USER indexed_cars_user;

CREATE DATABASE indexed_cars WITH OWNER = indexed_cars_user;


--Timing--
SELECT DISTINCT make_title FROM car_models WHERE make_code = 'LAM';
--22ms

SELECT DISTINCT model_title FROM car_models WHERE make_code = 'NISSAN' AND model_code = 'GT-R';
--16ms

SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code = 'LAM'; 
--26ms

SELECT * FROM car_models WHERE year >= '2010' AND year <= '2015';
--195ms

SELECT * FROM car_models WHERE year = '2010';
--46ms

