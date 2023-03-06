SELECT * FROM crime_scene_report
WHERE date = '20180115'and lower(city) = 'sql city' and type = 'murder';

SELECT * FROM person WHERE address_street_name = 'Northwestern Dr' 
ORDER BY address_number DESC LIMIT 1;


SELECT * FROM person 
WHERE lower(name) LIKE 'annabel%' 
AND address_street_name= 'Franklin Ave';


SELECT * FROM get_fit_now_member WHERE id like "48Z%"   
AND membership_status = "gold";


SELECT * FROM drivers_license WHERE plate_number like "%H%4%2%W%";
  
SELECT name FROM drivers_license JOIN person ON drivers_license.id = person.license_id
WHERE plate_number like "%H%4%2%W%";

