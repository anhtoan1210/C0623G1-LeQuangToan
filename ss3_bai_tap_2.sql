create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
cID int primary key auto_increment,
cName varchar(45),
cAge int 
);

create table orders(
oID int primary key auto_increment,
cID int,
oDate date,
oTotalPrice double,
foreign key(cID)references customer(cID)
);

create table products(
pID int primary key auto_increment,
pName varchar(45),
pPrice double
);

create table OrderDetails(
oID int,
pID int,
primary key(oID,pID),
foreign key(oID) references orders(oID),
foreign key (pID) references products(pID),
odQTY int
);

insert into customer (cName,cAge)
values('Minh Quân',10),
('Ngọc Oanh',20),
('Hong Ha',50);

insert into orders(cID,cName,oTotalPrice)
values(1,'3/21/2006',null),
(2,'3/23/2006',null),
(1,'3/16/2006',null);

insert into products(pName,pPrice)
values ('Máy giặc',3),
('Tủ lạnh',5),
('Điều hoà',7),
('Quạt',1),
('Bếp điện',2);

insert into  OrderDetails(oID,pID,odQTY)
values(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select cID,cName,oTotalPrice
from orders;

select orders.oID,customer.cName
from orders 
join customer on orders.cID=customer.cID
where orders.oID is null;

select orders.oID,customer.cName
from orders 
join customer on orders.cID=customer.cID;




