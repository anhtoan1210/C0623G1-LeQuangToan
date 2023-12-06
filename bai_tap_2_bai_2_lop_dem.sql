create database quan_ly_ban_hang_lop_dem;
use quan_ly_ban_hang_lop_dem;

create table customers(
c_id int primary key not null auto_increment,
c_name varchar(50),
c_age date
);

create table orders(
o_id int primary key not null auto_increment,
c_id int not null,
o_date date,
o_totalprice double not null,
foreign key(c_id)references customers(c_id)
);

create table products(
p_id int primary key not null auto_increment,
p_name varchar(50),
p_price double not null
);

create table orderdetail(
o_id int not null,
p_id int not null,
primary key(o_id,p_id),
foreign key(o_id)references orders(o_id),
foreign key(p_id)references products(p_id),
od_qty int
);