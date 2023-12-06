create database chuyen_doi_erd_lop_dem;

use chuyen_doi_erd_lop_dem;

create table phieu_xuat(
so_phieu_xuat int primary key auto_increment not null,
ngay_xuat date not null
);

create table vat_tu(
ma_vat_tu int primary key auto_increment not null,
ten_vat_tu varchar(50)
);

create table phieu_nhap(
so_phieu_nhap int primary key auto_increment not null,
ngay_nhap date
);

create table nha_cung_cap(
ma_nha_cung_cap int primary key auto_increment not null,
ten_nha_cung_cap varchar(50),
dia_chi varchar(100)
);

create table so_dien_thoai(
ma_so_dien_thoai int,
ma_nha_cung_cap int,
primary key(ma_so_dien_thoai,ma_nha_cung_cap),
foreign key(ma_nha_cung_cap)references nha_cung_cap(ma_nha_cung_cap)
);

create table don_dat_hang(
so_dat_hang int primary key auto_increment,
ngay_dat_hang date,
ma_nha_cung_cap int,
foreign key(ma_nha_cung_cap)references nha_cung_cap(ma_nha_cung_cap)
);

create table chi_tiet_phieu_xuat(
so_phieu_xuat int not null,
ma_vat_tu int not null,
primary key(so_phieu_xuat,ma_vat_tu),
foreign key (so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
don_gia_xuat double,
so_luong_xuat int
);

create table chi_tiet_phieu_nhap(
ma_vat_tu int not null,
so_phieu_nhap int not null,
primary key(ma_vat_tu,so_phieu_nhap),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_phieu_nhap)references phieu_nhap(so_phieu_nhap),
don_gia_nhap double,
so_luong_nhap int
);

create table chi_tiet_don_hang(
ma_vat_tu int not null,
so_dat_hang int not null,
primary key (ma_vat_tu,so_dat_hang),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_dat_hang)references don_dat_hang(so_dat_hang)
);