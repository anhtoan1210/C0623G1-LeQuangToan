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
`name` varchar(45),
page_size int,
author_id int,
foreign key(author_id) references authors(id),
category_id int,
foreign key(category_id) references category(id)
);


create table borrows(
id int primary key auto_increment,
student_id int,
books_id int,
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
value ('Nguyễn Văn A','1999-12-12','C0822G1'),
('Nguyễn Văn B','1999-12-13','C0822G1'),
('Nguyễn Văn C','1999-12-14','C0822G1'),
('Nguyễn Văn D','1999-12-15','C0922G1'),
('Nguyễn Văn E','1999-12-16','C01022G1');

insert into books(`name`,page_size,author_id,category_id)
value ('Toán',45,1,1),
('Văn',34,2,2),
('Sử',56,3,2),
('Địa',76,4,2),
('Hoá',32,5,1);

set foreign_key_checks=0;
insert into borrows(student_id,books_id,borrow_date,return_date)
value (1,1,'2022-12-12','2022-12-13'),
 (2,2,'2022-12-12','2022-12-15'),
(3,3,'2022-12-12','2022-12-13'),
(4,4,'2022-12-12','2022-12-12'),
(1,5,'2022-12-13','2022-12-15'),
(1,5,'2022-12-14','2022-12-14'),
(3,4,'2022-12-15','2022-12-29'),
 (3,3,'2022-12-8','2022-12-14'),
 (1,2,'2022-12-6','2022-12-30');
 
 select b.name,b.page_size,a.name,c.name
 from books b
 join category c  on c.id = b.category_id
 join authors a on a.id = b.author_id;
 
 select students.*,borrows.borrow_date,borrows.return_date
 from students
 join borrows on borrows.student_id = students.id
 where books_id >= 1
 order by students.name;
 
--  select b.name, count(b.id) as max
--  from books b
--  join category c on c.id = b.category_id
--  join authors a on a.id = b.author_id
--  join borrows br on br.books_id = b.id;
 
 select b.`name`, count(borrows.books_id) as 'so_lan_muon'
 from books b
 left join borrows on borrows.books_id = b.id
 group by b.id
 order by count(borrows.books_id) desc
 limit 2;
 
  create view bookss as 
  select b.`name`,count(br.books_id) as 'so_luong'
 from books b
 join borrows br on br.books_id = b.id
 group by b.id;

select *
from bookss
where so_luong = (select max(so_luong)
from bookss);

select *
from bookss
where so_luong not in (select so_luong
from bookss);

select s.name,count(s.id) as 'so_luong'
from students s
join borrows br on br.student_id = s.id
group by s.id
order by so_luong desc;

 select s.name, count(s.id) as 'so_luong'
 from students s 
 join borrows br on br.student_id = s.id
 group by s.id
 order by so_luong desc
 limit 1;
 
 create  index books_name on books(name);
 
 create view books_view as
 (select b.name,count(b.id) as 'so_luong'
 from books b
 join borrows br on br.books_id = b.id);
 
 delimiter //
 create procedure books_procedure(name varchar(50), page_size int,author_id int,category_id int)
 begin
 insert into books (name,page_size,author_id,category_id)
 values (name,page_size,author_id,category_id);
 end //
 delimiter ;
 
 call books_procedure('Lý',50,2,1);
