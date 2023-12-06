create database loai_khach_hang;
use loai_khach_hang;

create table loai_khach(
id int primary key not null auto_increment,
ma varchar(50),
ten varchar(50),
uu_dai int
);

insert into loai_khach(ma,ten,uu_dai)
values("LK0121","Member",0),
("LK0122","Gold",3),
("LK0123","Platinum",6),
("LK0126","Platinum",6);

select * from loai_khach;


select * from loai_khach;
select loai_khach.ma,loai_khach.ten,loai_khach.uu_dai from loai_khach where ma = "LK0121";