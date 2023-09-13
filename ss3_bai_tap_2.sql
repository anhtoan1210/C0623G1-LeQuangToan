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


