
CREATE TABLE postgres.university (
	univ_id bigint NOT NULL PRIMARY KEY,
    univ_name varchar(50) NOT NULL,
    univ_address varchar(30)  NOT NULL,
    univ_type varchar(30)  NOT NULL
);

CREATE TABLE postgres.department (
	dept_id bigint NOT NULL PRIMARY KEY,
    dept_name varchar(50) NOT NULL,
	dept_student_count int NOT NULL,
	univ_id bigint NOT NULL REFERENCES postgres.university(univ_id)
);


INSERT INTO postgres.university 
VALUES
(1,'AU   ','Chennai,India,Asia','UG'),
(2,'  VIT','Vellore,India,Asia','UG'),
(3,'  CU   ','Bangalore,India,Asia','PG');


INSERT INTO postgres.department 
VALUES
(1,'IT',199,1),
(2,'CSE',201,2),
(3,'ECE',185,3),
(4,'EEE',179,2),
(5,'BioTech',191,3),
(6,'IT',195,2),
(7,'ECE',180,1),
(8,'CSE',200,3),
(9,'MECH',210,1);


SELECT * FROM postgres.university ;

SELECT * FROM postgres.university_staging ;

SELECT * FROM postgres.ug_university ;

SELECT * FROM postgres.pg_university;


DROP VIEW postgres.pg_university;

DROP VIEW postgres.ug_university;

TRUNCATE TABLE postgres.university_staging;

TRUNCATE TABLE postgres.university

DROP TABLE postgres.department

DROP TABLE postgres.university


  SELECT univ_id, count(univ_id),SUM(dept_student_count) 
  FROM postgres.department
  GROUP BY univ_id;












