create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
c_id int primary key auto_increment,
c_name varchar(45),
c_age int 
);

create table orders(
o_id int primary key auto_increment,
c_id int not null,
o_date date,
o_total_price double,
foreign key(cID)references customer(cID)
);

create table products(
p_id int primary key auto_increment,
p_name varchar(45),
p_price double
);

create table orderdetails(
o_id int not null,
p_id int not null,
primary key(o_id,p_id),
foreign key(o_id) references orders(o_id),
foreign key (p_id) references products(p_id),
od_qty int
);

insert into customer (c_name,c_age)
values('Minh Quân',10),
('Ngọc Oanh',20),
('Hong Ha',50);

insert into orders(c_id,c_name,o_total_price)
values(1,'3/21/2006',null),
(2,'3/23/2006',null),
(1,'3/16/2006',null);

insert into products(p_name,p_price)
values ('Máy giặc',3),
('Tủ lạnh',5),
('Điều hoà',7),
('Quạt',1),
('Bếp điện',2);

insert into  orderDetails(o_id,p_id,od_qty)
values(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select c_id,c_name,o_total_price
from orders;

select orders.o_id,customer.c_name
from orders 
join customer on orders.c_id=customer.c_id
where orders.o_id is null;

select orders.o_id,customer.c_name
from orders 
join customer on orders.c_id=customer.c_id;




