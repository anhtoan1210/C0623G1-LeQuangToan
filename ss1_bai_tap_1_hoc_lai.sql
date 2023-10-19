create database book_management;
use book_management;

create table books(
id int not null auto_increment primary key,
books_name varchar(45) not null,
books_page_size int,
books_author varchar(45)
);

insert into books(books_name,books_page_size,books_author)
value ('Toán',45,'Nguyễn Thái Học'),
('Văn',34,'Trần Mình Hoàng'),
('sử',56,'Dương Trung Quốc'),
('Địa',76,'Lê Văn Hiến'),
('Hoá',32,'Hà Văn Minh');

set sql_safe_updates = 0;
update books set books_page_size = 50 where books_name = "Sử";

delete books from books where id = 5;

drop table books;

drop database book_management;
