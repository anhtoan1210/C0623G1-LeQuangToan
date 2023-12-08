create database quan_ly_ban_hang_lop_dem;
use quan_ly_ban_hang_lop_dem;

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
foreign key(c_id)references customer(c_id)
);

create table products(
p_id int primary key auto_increment,
p_name varchar(45),
p_price int
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

insert into orders(c_id,o_date,o_total_price)
values(1,'2006-3-21',null),
(2,'2006-3-23',null),
(1,'2006-3-16',null);

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

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select c_id,o_date,o_total_price
from orders;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer.c_name from customer
where customer.c_id not in (select orders.c_id from orders);

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select products.p_name,customer.c_id,customer.c_name
from  customer
join orders on orders.c_id=customer.c_id
join orderDetails on orders.o_id= orderDetails.o_id
join products on orderDetails.p_id=products.p_id;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select od.o_id,od.o_date, sum(o.od_qty*p.p_price) as o_total_price
from orders od
join orderDetails o on od.o_id=o.o_id
join products p on o.p_id=p.p_id
group by od.o_id,od.o_date;



