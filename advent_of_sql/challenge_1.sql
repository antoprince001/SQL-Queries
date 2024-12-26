-- Create a report that helps Santa and the elves understand:

-- Each child's primary and backup gift choices
-- Their color preferences
-- How complex each gift is to make
-- Which workshop department should handle the creation

-- SCHEMA: santaclaus

-- DROP SCHEMA IF EXISTS santaclaus ;

CREATE SCHEMA IF NOT EXISTS santaclaus
    AUTHORIZATION postgres;

SET SCHEMA 'santaclaus';
	
CREATE TABLE children (
  child_id INT PRIMARY KEY,
  name VARCHAR(100),
  age INT
);
CREATE TABLE wish_lists (
  list_id INT PRIMARY KEY,
  child_id INT,
  wishes JSON,
  submitted_date DATE
);
CREATE TABLE toy_catalogue (
  toy_id INT PRIMARY KEY,
  toy_name VARCHAR(100),
  category VARCHAR(50),
  difficulty_to_make INT
);

INSERT INTO children VALUES
(1, 'Tommy', 8),
(2, 'Sally', 7),
(3, 'Bobby', 9);

SELECT * FROM children;

INSERT INTO wish_lists VALUES
(1, 1, '{"first_choice": "bike", "second_choice": "blocks", "colors": ["red", "blue"]}', '2024-11-01'),
(2, 2, '{"first_choice": "doll", "second_choice": "books", "colors": ["pink", "purple"]}', '2024-11-02'),
(3, 3, '{"first_choice": "blocks", "second_choice": "bike", "colors": ["green"]}', '2024-11-03');

SELECT * FROM wish_lists;

INSERT INTO toy_catalogue VALUES
(1, 'bike', 'outdoor', 3),
(2, 'blocks', 'educational', 1),
(3, 'doll', 'indoor', 2),
(4, 'books', 'educational', 1);
  
SELECT * FROM toy_catalogue;

-------------------------------

-- Expected
-- name  | primary_wish | backup_wish | favorite_color | color_count | gift_complexity | workshop_assignment

-- https://www.freecodecamp.org/news/postgresql-and-json-use-json-data-in-postgresql/
WITH parsed_wished_list as (SELECT 
list_id, 
child_id, 
wishes->>'first_choice' as first_choice,
wishes->>'second_choice' as second_choice,
wishes->>'colors' as favorite_color, -- indexing starts at 1
submitted_date
FROM wish_lists)

SELECT favorite_color::text[],pg_typeof(favorite_color) FROM parsed_wished_list

