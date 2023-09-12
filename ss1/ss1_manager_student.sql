create database manager_student;
use manager_student;

create table classes(
id int auto_increment primary key,
name varchar(45)
);

create table teachers(
id int auto_increment primary key,
name varchar(45),
age int,
country varchar(45)
);

insert into classes(name)
values ('Toản'),
('Lâm');

insert into teachers(name,age,country)
values('Lâm',21,'Việt Nam'),
('Sang',26,'Lào');

SELECT id,name FROM teachers;

delete
from teachers
where id=1;