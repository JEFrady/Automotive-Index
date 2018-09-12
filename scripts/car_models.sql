-- db indexed_cars

CREATE TABLE IF NOT EXISTS car_models
(
 id serial,
 make_code character varying(125) NOT NULL,
 make_title character varying(125) NOT NULL,
 model_code character varying(125) NOT NULL,
 model_title character varying(125) NOT NULL,
 year integer NOT NULL,
 PRIMARY KEY (id)
);

-- Indexing --

/* Tried indexing make_titles first, ran at only 1ms different. Switched to make_code and reduced time to 2m */

CREATE INDEX index_make_codes ON car_models (make_code);

CREATE INDEX index_make_model ON car_models (make_code, model_code);

CREATE INDEX index_years ON car_models (year);

SELECT DISTINCT make_title FROM car_models WHERE make_code = 'LAM';
--2ms

SELECT DISTINCT model_title FROM car_models WHERE make_code = 'NISSAN' AND model_code = 'GT-R';
--2ms

SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code = 'LAM'; 
--6ms

SELECT * FROM car_models WHERE year >= '2010' AND year <= '2015';
--202ms

SELECT * FROM car_models WHERE year = '2010';
--43ms
