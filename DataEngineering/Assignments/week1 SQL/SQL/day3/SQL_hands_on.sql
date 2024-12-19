create database pet_adoption;
use pet_adoption;
create table adoptions(
animal_id int not null,
name varchar(40),
contact varchar(40)
);
create table animals(
id int not null,
name varchar(40),
breed varchar(30),
color varchar(30),
gender varchar(10),
status int
);

--create table shelter(
--id int,
--name varchar(50),
--location varchar(50)
--);
--Storing Data in the table------------------
--insert into animals(id,name,breed,color,gender,status) values(501,'Bellyflop','Beagle','Brown','Male',0);
--insert into animals(id,name,breed,color,gender,status) values(502,'Snowy','Husky','White','Female',0);
--insert into animals(id,name,breed,color,gender,status) values(503,'Princes','Pomarnian','Black','Female',0);
--insert into animals(id,name,breed,color,gender,status) values(504,'Cricket','Chihuahua','Brown','Female',0);
--insert into animals(id,name,breed,color,gender,status) values(505,'Spot','Dalmation','Black and White','Male',0);

--insert into adoptions(animal_id,name,contact) values(501,'Pinnochio','pinnocchio@gmail.com');
--insert into adoptions(animal_id,name,contact) values(502,'Stella','Stella@gmail.com');
--insert into adoptions(animal_id,name,contact) values(503,'Bob','bob@gmail.com');
--insert into adoptions(animal_id,name,contact) values(504,'alex','alex@gmail.com');
--insert into adoptions(animal_id,name,contact) values(505,'sunny','sunny@gmail.com');

--Updating data in the table-------------------
--update adoptions
--set contact='alex.joseph@gmail.com' 
--where name='alex'

--update animals
--set gender='male',status='1'
--where id=502

--Deleting Data in the table-----------
delete from adoptions
where animal_id=505
delete from animals
where id=505
--Retrieving specific attributes--------
select id,name,breed from animals where id in (504,502)
select animal_id,contact from adoptions

-------------------------Retreiving selected rows----------------
select top 3* from animals

--filtering rows(where,between,in,like,or)-------------
select * from animals where id<504
select * from animals where id between 501 and 503
select * from animals where id in (501,504)
select * from adoptions where name like '%ex'
select * from animals where id=503 or id in(501,504)

--Data Integrity Implementation
ALTER TABLE animals
ADD CONSTRAINT pk_animal PRIMARY KEY (id);

ALTER TABLE adoptions
ADD CONSTRAINT fk_animal FOREIGN KEY (animal_id) REFERENCES animals(id);

--String functions
SELECT CONCAT(UPPER(name), ' - ', LOWER(breed)) AS AnimalInfo FROM animals;

--Aggregate functions
SELECT COUNT(*) AS TotalAdoptions FROM adoptions;
SELECT breed, COUNT(*) AS CountPerBreed FROM animals GROUP BY breed;

select * from animals order by id desc
SELECT breed, COUNT(*) AS CountPerBreed FROM animals GROUP BY breed having breed='husky';