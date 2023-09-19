create database case_study_db;

use case_study_db;

create table vi_tri(
ma_vi_tri int primary key auto_increment,
ten_vi_tri varchar(45)
);

create table trinh_do(
ma_trinh_do int primary key auto_increment,
ten_trinh_do varchar(45));

create table bo_phan(
ma_bo_phan int primary key auto_increment,
ten_bo_phan varchar(45));

create table nhan_vien(
ma_nhan_vien int primary key auto_increment,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong double not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
foreign key(ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key(ma_bo_phan) references bo_phan(ma_bo_phan)
);
create table loai_khach(
ma_loai_khach int primary key auto_increment,
ten_loai_khach varchar(45));

create table khach_hang(
ma_khach_hang int primary key auto_increment,
ma_loai_khach int,
foreign key(ma_loai_khach) references loai_khach(ma_loai_khach),
ho_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit,
so_cmnd varchar(45) not null,
so_dien_thoai varchar(45)not null,
email varchar(45),
dia_chi varchar(45)
);

create table loai_dich_vu(
ma_loai_dich_vu int primary key auto_increment,
ten_loai_dich_vu varchar(45));

create table kieu_thue(
ma_kieu_thue int primary key auto_increment,
ten_kieu_thue varchar(45)
);

create table dich_vu(
ma_dich_vu int primary key auto_increment,
ten_dich_vu varchar(45)not null,
dien_tich int,
chi_phi_thue double not null,
so_nguoi_toi_da int,
ma_kieu_thue int,
ma_loai_dich_vu int,
foreign key(ma_kieu_thue) references kieu_thue(ma_kieu_thue),
foreign key(ma_loai_dich_vu)references loai_dich_vu(ma_loai_dich_vu),
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
dich_vu_mien_phi_di_kem text
);

create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key auto_increment,
ten_dich_vu_di_kem varchar(45) not null,
gia double not null,
don_vi varchar(10) not null,
trang_thai varchar(45)
);

create table hop_dong(
ma_hop_dong int primary key auto_increment,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc datetime not null,
tien_dat_coc double not null,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
foreign key(ma_nhan_vien) references nhan_vien(ma_nhan_vien),
foreign key(ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key(ma_dich_vu) references dich_vu(ma_dich_vu)
);

create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key auto_increment,
ma_hop_dong int,
ma_dich_vu_di_kem int,
foreign key(ma_hop_dong) references hop_dong(ma_hop_dong),
foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
so_luong int not null
);

insert into vi_tri(ten_vi_tri)
values ('Quản lý'),('Nhân viên');

insert into trinh_do(ten_trinh_do)
values ('Trung cấp'),('Cao đẳng'),('Đại học'),('Sau đại học');

insert into bo_phan(ten_bo_phan)
values ('Sale-Marketing'),('hành chính'),('Phục vụ'),('Quuanr lý');

insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
values ('Nguyễn Văn An','1970-11-07','456231786',10000000,'0901234121','annguyen@gmail.com','295 Nguyễn Tất Thành, Đà Nẵng',1,3,1),
	   ('Lê Văn Bình','1997-04-09','654231234',7000000,'0934212314','binhlv@gmail.com','22 Yên Bái,Đà Nẵng',1,2,2),
       ('Hồ Thị yến','1995-12-12','999231723',14000000,'0412352315','thiyen@gail.com','K234/11 Điện Biên Phủ,Gia Lai',1,3,2),
       ('Võ Công Toản','1980-04-04','12231365',17000000,'0374443232','toan0404@gmail.com,','77 Hoàng Diệu,Quảng Trị',1,4,4),
       ('Nguyễn Bỉnh Phát','1999-12-09','454363232',6000000,'0902341231','phatphat@gmail.com','43 Yên Bái, Đà Nẵng',2,1,1),
       ('Khúc Nguyễn An Nghi','2000-11-08','964542311',7000000,'0978653213','annghi20@gmail.com','294 Nguyễn Tất Thành,Đà Nẵng',2,2,3),
       ('Nguyễn Hữu Hà','1993-01-01','534323231',8000000,'0941234553','nhh0101@gmail.com','4 Nguyễn Chí Thanh,Huế',2,3,2),
       ('Nguyễn Hà Đông', '1989-09-03','234414123',9000000,'0642123111','donghanguyen@gmail.com','111 Hùng Vương, Hà Nội', 2,4,4 ),
       ('Tòng Hoang','1982-09-03','256781231',6000000,'0245144444','hoangtong@gmail.com','213 Hàm Nghi,Đà Nẵng',2,4,4),
       ('Nguyễn Công Đạo','1994-01-08','755434343',8000000,'0988767111','nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai',2,3,2);
       
       insert into loai_khach(ten_loai_khach)
       values('Diamond'),('Platinium'),('Gorl'),('Sliver'),('Menber');
       
       insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach)
       values('Nguyễn Thị Hào','1970-11-07',0,'64341213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng',5),
       ('Phạm Xuân Diệu','1992-08-08',1,'865342123','0954333333','xuandieu92@gmail.com','K77/2 Thái Phiên,Quảng Trị',3),
       ('Trương Đình Nghệ','1990-02-27',1,'488645199','0373213122','nghenha2702@gmail.com','K323/12 Ông Ích Khiêm ,Vinh',1),
       ('Dương Văn Quan','1981-07-08',1,'543432111','0490039241','duongquan@gmail.com','k453/12 Lê Lợi, Đà Nẵng',1),
       ('Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai',4),
       ('Tôn Nữ Mộc Châu','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng',4),
       ('Nguyễn Thị Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh',1),
       ('Nguyễn Thị Hào','1999-04-08',0,'965656433','0763212345','haohao99@gmail.com','55 Nguyễn Văn Linh,Kon Tum',3),
       ('Trần Đại Danh','1994-07-01',1,'4322411235','0643343433','danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi',1),
       ('Nguyễn Tâm Đắc','1989-07-01',1,'344343432','0987654321','dactam@gmail.com','22 Ngô Quyền, Đà Nẵng',2);
       
       insert into kieu_thue(ten_kieu_thue)
       values ('year'),('month'),('day'),('hour');
       
       insert into loai_dich_vu(ten_loai_dich_vu)
       values ('Villa'),('House'),('Room');
       
       insert into dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu)
       values('Villa Beach Front',25000,1000000,10,'vip','Có hồ bơi',500,4,null,3,1),
       ('House Princess 01',14000,5000000,7,'vip','Có thêm bếp nướng',null,3,null,2,2),
       ('Room Twin 01',5000,1000000,2,'normal','Có ti vi',null,null,'1 xe máy,1 xe đạp',4,3),
       ('Villa No Beach Front',22000,9000000,8,'normal','Có hồ bơi',300,3,null,3,1),
       ('House Princess 02',10000,4000000,5,'normal','Có thêm bêp nướng',null,2,null,3,2),
       ('Room Twin 02',3000,900000,2,'normal','Có ti vi',null,null,'1 xe máy',4,3);
       
       insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai)
       values ('karaoke',10000,'giờ','tiện nghi, hiện tại'),
       ('Thuê xe máy',10000,'chiếc','hỏng 1 xe'),
       ('Thuê xe đạp',20000,'chiếc','tốt'),
       ('Buffer buổi sáng',15000,'suất','Đầy đủ đồ ăn, trángn miệng'),
       ('Buffer buổi trưa',90000,'suất','đầy đủ đồ ăn, tráng miệng'),
       ('Bufer buổi tối', 16000,'suất','đầy đủ đồ ăn, tráng miệng');
       
       insert into hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
       values('2020-12-08','2020-12-08',0,3,1,3),
       ('2020-07-14','2020-07-21',200000,7,3,1),
       ('2021-03-15','2021-03-17',50000,3,4,2),
       ('2021-01-14','2021-01-18',100000,7,5,5),
       ('2021-07-14','2021-07-15',0,7,2,6),
       ('2021-06-01','2021-06-03', 0,7,7,6),
       ('2021-09-02','2021-09-05',100000,7,4,4),
       ('2021-06-17','2021-06-18',150000,3,4,1),
       ('2020-11-19','2020-11-19',0,3,4,3),
       ('2021-04-12','2021-04-14',0,10,3,5),
       ('2021-04-25','2021-04-25',0,2,2,1),
       ('2021-05-25','2021-05-27',0,7,10,1);
       
       insert into hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem)
       values (5,2,4),
       (8,2,5),
       (15,2,6),
       (1,3,1),
       (11,3,2),
       (1,1,3),
       (2,1,2),
       (2,12,2);
       
--     2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
       select *
       from nhan_vien
       where (ho_ten like 'H%' or ho_ten like 'K%' or ho_ten like 'T%') and char_length(ho_ten) <=15;
       
--        cau  3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
       select *
       from khach_hang
       where(TIMESTAMPDIFF(YEAR, ngay_sinh, CURDATE()) between 18 and 50) and (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị');
    
    --  cau  4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
--     Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
	select kh.ma_khach_hang,kh.ho_ten,count(hd.ma_khach_hang) as "so_lan_dat_phong"
    from khach_hang kh
	join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
    where kh.ma_loai_khach = 1
    group by hd.ma_khach_hang
    order by count(hd.ma_khach_hang) asc;
    
-- câu 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc,
 -- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem,
--  hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.ma_khach_hang,kh.ho_ten,lk.ten_loai_khach,hd.ma_hop_dong,
dv.ten_dich_vu,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,
sum(ifnull(ifnull(dv.chi_phi_thue,0) + ifnull(hdct.so_luong,0) * ifnull(dvdk.gia,0),0)) as "tong_tien"
from khach_hang kh
left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong;
       
	-- cau  6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các
    -- loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
	   select ma_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,ten_loai_dich_vu
       from dich_vu  d
       join loai_dich_vu  l on
       d.ma_loai_dich_vu = l.ma_loai_dich_vu
       where d.ma_dich_vu not in (
       select ma_dich_vu
       from hop_dong
       where(quarter(ngay_lam_hop_dong)=1)
       );
       
   --     cau  7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue,
  --  ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng 
-- đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
       select ma_dich_vu,ten_dich_vu,dien_tich,so_nguoi_toi_da,chi_phi_thue,ten_loai_dich_vu
       from dich_vu d
       join  loai_dich_vu l
       on 
       d.ma_loai_dich_vu = l.ma_loai_dich_vu
	   where ma_dich_vu not in (
       select ma_dich_vu
       from hop_dong
       where(year(ngay_lam_hop_dong)=2021)
       ) and ma_dich_vu in(
      select ma_dich_vu
      from hop_dong
      where(year(ngay_lam_hop_dong)=2020)
      );
      
--       cau 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

      select ho_ten 
      from khach_hang
      union
      select ho_ten
      from khach_hang;
      
      select ho_ten
      from khach_hang
      group by ho_ten;
      
      select distinct ho_ten
      from khach_hang;
      
     --  cau 9thuc iện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.


      select month(hd.ngay_lam_hop_dong) as "thang",count(*) as "so_luong_khach_hang"
from khach_hang kh
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
where hd.ngay_lam_hop_dong and year(hd.ngay_lam_hop_dong) = "2021"
group by month(hd.ngay_lam_hop_dong)
order by thang;

  --   cau 10 .	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
  -- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
--   (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
    select hd.ma_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,hd.tien_dat_coc,
sum(ifnull(so_luong,0)) as "so_luong_dich_vu_di_kem"
-- if(hdct.so_luong is null ,0,sum(so_luong)) as "so_luong_dich_vu_di_kem"
from hop_dong hd
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
order by ma_hop_dong;
  
--  cau 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond”
--  và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select kh.ho_ten,lk.ten_loai_khach,kh.dia_chi,dvdk.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem
from loai_khach lk
join khach_hang kh on kh.ma_loai_khach = lk.ma_loai_khach
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where ten_loai_khach = 'dinamold' and (dia_chi like '%Vinh%' or dia_chi like '% Quảng Ngãi%')
order by dvdk.ma_dich_vu_di_kem ;

--     cau 12 	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), 
-- so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
--  tien_dat_coc của tất cả các dịch vụ đã từng được khách 
-- hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong, nv.ho_ten,kh.ho_ten,kh.so_dien_thoai,hd.ma_dich_vu,dv.ten_dich_vu,
sum(ifnull(so_luong,0)) as "so_luong_dich_vu_di_kem",hd.tien_dat_coc
from nhan_vien nv
left join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where dv.ma_dich_vu in (select hop_dong.ma_dich_vu
from hop_dong 
where hop_dong.ngay_lam_hop_dong between "2020-10-01" and "2020-12-31")
and dv.ma_dich_vu not in  (
select dich_vu.ma_dich_vu
from dich_vu 
join hop_dong 
on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
where hop_dong.ngay_lam_hop_dong between "2021-01-01" and "2021-06-30")
group by hd.ma_hop_dong;

      
     --  13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
--       (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
      select dvdk.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem,sum(so_luong) as "so_luong_dich_vu_di_kem"
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having sum(so_luong) = (
select sum(so_luong) as "so_luong_dich_vu"
from hop_dong_chi_tiet
join dich_vu_di_kem 
on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by dich_vu_di_kem.ma_dich_vu_di_kem
order by so_luong_dich_vu desc
limit 1
)
order by ma_dich_vu_di_kem;

-- cau 14Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong,
 -- ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hd.ma_hop_dong,ldv.ten_loai_dich_vu,dvdk.ten_dich_vu_di_kem,count(dvdk.ma_dich_vu_di_kem) as "so_lan_su_dung"
from loai_dich_vu ldv
join dich_vu dv on dv.ma_loai_dich_vu = ldv.ma_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_lan_su_dung = 1
order by hd.ma_hop_dong;

-- cau 15 .	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan,
--  so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien,nv.ho_ten,td.ten_trinh_do,bp.ten_bo_phan,nv.so_dien_thoai,nv.dia_chi
from nhan_vien nv
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
where hd.ngay_lam_hop_dong between "2020-01-01" and "2021-12-31"
group by hd.ma_nhan_vien
having count(hd.ma_nhan_vien) < 4
order by hd.ma_nhan_vien;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
   set sql_safe_updates = 0;
   alter table nhan_vien
       add xoa bit default 0;
       update nhan_vien
       set
       xoa = 1
       where 
       ma_nhan_vien not in (select
       nv.ma_nhan_vien
       from
       (select nv.ma_nhan_vien
       from 
       nhan_vien nv
       left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
       where 
       year(hd.ngay_lam_hop_dong) between 2019 and 2021) as nv) ;
       

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
--  chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

create view tinh_tong as
select kh.ma_khach_hang
from khach_hang kh
left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv on dv. ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct. ma_hop_dong = hd.ma_hop_dong
left join  dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where year(hd.ngay_lam_hop_dong) = 2021 
group by hd.ma_khach_hang
having sum(ifnull(ifnull(dv.chi_phi_thue,0)+ ifnull(hdct.so_luong,0) * ifnull(dvdk.gia,0),0)>10000000) ;

update khach_hang
set ma_loai_khach = 1
where ma_khach_hang in(
select ma_khach_hang
from tinh_tong
);

select khach_hang.ma_khach_hang,khach_hang.ho_ten,loai_khach.ten_loai_khach
from khach_hang
join loai_khach on loai_khach. ma_loai_khach = khach_hang.ma_loai_khach ;

drop view tinh_tong ;


-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
--  thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select khach_hang.ma_khach_hang as id, khach_hang.ho_ten,khach_hang.email,
khach_hang.so_dien_thoai,khach_hang.ngay_sinh,khach_hang.dia_chi
from khach_hang
union 
select nhan_vien.ma_nhan_vien as id ,nhan_vien.ho_ten,nhan_vien.email,nhan_vien.so_dien_thoai,
nhan_vien.ngay_sinh,nhan_vien.dia_chi
from nhan_vien ;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update dich_vu_di_kem
set gia = gia * 2
where ma_dich_vu_di_kem in(
select ma_dich_vu_di_kem
from hop_dong_chi_tiet
join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
where so_luong >10 and year(ngay_lam_hop_dong) = 2020
group by ma_dich_vu_di_kem
) ;



       



