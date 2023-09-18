create database bai_tap_s5;
use bai_tap_s5;

create table products(
id int primary key auto_increment,
product_code int,
product_name varchar(45),
product_price double,
product_amount int,
product_description varchar(45),
product_status varchar(45)
);

insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
values(1,'kẹo',100000,100,'ngon','tốt');

create unique index index_product_code on products(product_code);

create index index_product_name_product_price on products (product_name,product_price);

explain select product_code 
from products 
where product_code = 1;

-- trước khi tạo chỉ mục phải tìm hết rows sau khi tạo thì sẽ tìm thấy và rows =1; 

create view view_products as
select product_code,product_name,product_price,product_status
from products;

update view_products 
set product_name = 'dầu ăn'
where product_code = 1;

drop view view_products ;
​
delimiter // 
create procedure get_all_products()
begin
select *
from products;
end //
delimiter ;

delimiter $$
create procedure add_products(product_code int,product_name varchar(45),product_price double,product_amount int,product_description varchar(45),product_status varchar(45))
begin
insert into products
values(id,product_code,product_name,product_price,product_amount,product_description,product_status) ;
end $$
delimiter ;

delimiter $$
create procedure update_products(id_update int,product_code_update int,product_name_update varchar(45),product_price_update double,product_amount_update int,product_description_update varchar(45),product_status_update varchar(45))
begin
update products
set
product_code = product_code_update,
product_name = product_name_update,
product_price = product_price_update,
product_amount = product_amount_update,
product_description = product_description_update,
product_status = product_status_update
where id = id_update;
end $$
delimiter ;

delimiter $$
create procedure delete_products(id_delete int)
begin
delete 
from products
where id = id_delete;
end $$
delimiter ;



call add_products(6,'Thuốc lá',10000,1,'thơm','tốt/còn hạng sử dụng');
call add_products(8,'Nước mắm',20000,10,'mặn','tốt/còn hạn sử dụng');

call update_products(2,9,'Thuốc lá',10000,1,'thơm','tốt/còn hạng sử dụng');

call delete_products(3);