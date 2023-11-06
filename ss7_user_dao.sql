CREATE DATABASE user_dao;
USE user_dao; 
create table users ( 
      id int(3) NOT NULL AUTO_INCREMENT, 
      name varchar(120) NOT NULL, 
      email varchar(220) NOT NULL, 
      country varchar(120), 
      PRIMARY KEY (id) 
);
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

DELIMITER $$
CREATE PROCEDURE get_user_by_id(IN user_id INT)
begin
 SELECT users.name, users.email, users.country
 FROM usersusers
 where users.id = user_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE delete_by_id(IN user_id INT)
begin
 delete users
 from users
 where users.id = user_id;
END $$
DELIMITER ;

call delete_by_id(1);
call get_user_by_id(1);

DELIMITER $$
CREATE PROCEDURE get_all()
begin
 SELECT *
 FROM users;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE update_user(user_id int,name_up varchar(120),email_up varchar(220),country_up varchar(120))
begin
 update users
 set 
 users.name = name_up,
 users.email = email_up,
 users.country = country_up
 where users.id = user_id;
END $$
DELIMITER ;

call update_user(3,1,1,1)