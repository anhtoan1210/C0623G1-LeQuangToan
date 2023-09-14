create database QUAN_LY_BAN_HANG;
use QUAN_LY_BAN_HANG;

create table customer(
c_id int primary key auto_increment,
c_name varchar(45) not null,
c_age int not null
);

create table orders(
o_id int primary key auto_increment,
c_id int not null,
o_date date not null,
o_totalPrice double not null,
foreign key(cID)references customer(cID)
);

create table products(
p_id int primary key auto_increment,
p_name varchar(45) not null,
p_price double not null
);

create table orderdetails(
o_id int,
p_id int,
primary key(o_id,p_id),
foreign key(o_id) references orders(o_id),
foreign key (p_id) references products(p_id),
odQTY int
);
