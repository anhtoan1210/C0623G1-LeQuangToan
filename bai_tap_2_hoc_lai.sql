create database library;
use library;

create table students(
id int not null auto_increment primary key,
`name` varchar(45),
birthday date,
class_name varchar(45)
);

create table authors(
id int not null auto_increment primary key,
`name` varchar(45)
);

create table category(
id int not null auto_increment primary key,
`name` varchar(45)
);

create table books(
id int not null auto_increment primary key,
title varchar(45),
page_size int,
author_id int,
foreign key(author_id) references authors(id),
category_id int,
foreign key(category_id) references category(id)
);


create table borrows(
student_id int,
books_id int,
primary key(student_id,books_id),
foreign key(student_id) references students(id),
foreign key(books_id) references books(id),
borrow_date date,
return_date date
);

insert into category(`name`)
value('Tự nhiên'),
('Xã hội'),
('Truyện'),
('Tiểu thuyết'),
('Khác');

insert into authors(`name`)
value ('Nguyễn Thái Học'),
('Trần Minh Hoàng'),
('Dương Trung Quốc'),
('Lê Văn Hiến'),
('Hà Văn Minh');

insert into students(`name`,birthday,class_name)
value ('Nguyễn Văn A','12-12-1999','C0822G1'),
('Nguyễn Văn B','12-13-1999','C0822G1'),
('Nguyễn Văn C','12-14-1999','C0822G1'),
('Nguyễn Văn D','12-15-1999','C0922G1'),
('Nguyễn Văn E','12-16-1999','C01022G1');

