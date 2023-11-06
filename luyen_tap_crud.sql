create database luyen_tap_crud;

use luyen_tap_crud;

create table loai_bai_hoc(
ma_loai_bai_hoc int primary key auto_increment,
ten_loai_bai_hoc varchar(50)
);

create table bai_hoc(
ma_bai_hoc int auto_increment primary key,
ma_loai_bai_hoc int,
foreign key(ma_loai_bai_hoc) references loai_bai_hoc(ma_loai_bai_hoc),
do_kho int,
module int,
link varchar(255),
trang_thai_xoa int(1) default 0
);

insert into loai_bai_hoc(ten_loai_bai_hoc)
values("Java"),
("C#"),
("PHP");

insert into bai_hoc(ma_loai_bai_hoc,do_kho,module,link)
values(2,1,2,"Https:ok")