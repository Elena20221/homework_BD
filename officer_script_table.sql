CREATE TABLE IF NOT EXISTS officer (
	id serial PRIMARY KEY, 
	officer_name varchar(100) NOT NULL UNIQUE, 
	department varchar(100) NOT NULL UNIQUE,
	cheif_id int REFERENCES officer(id));