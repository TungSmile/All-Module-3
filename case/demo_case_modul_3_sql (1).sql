create database demo_case_modul_3;
use demo_case_modul_3;

-- quyền đăng nhập
create table `role`(
`id_role` bigint not null Primary key auto_increment ,
`name` varchar(255) not null,
`code` varchar(255) not null,
`createddate` timestamp null, -- ngày tạo
`modifieddate` timestamp null, -- ngày sửa đổi
`createdby` varchar(255) null, -- được tạo bởi
`modifiedby` varchar(255) null -- sửa đổi bởi ai 
);

-- tài khoản
create table `user` (
`id_user` bigint not null primary key  auto_increment,
`username` varchar(100) not null,
`password` varchar(255) not null,
`status` boolean not null,
`id_role` bigint not null,
`createddate` timestamp null, -- ngày tạo
`modifieddate` timestamp null, -- ngày sửa đổi
`createdby` varchar(255) null, -- được tạo bởi
`modifiedby` varchar(255) null, -- sửa đổi bởi ai
foreign key(`id_role`) references `role`(`id_role`)
);

-- nhân viên
create table `nhanvien`(
`id_nhanvien` bigint not null primary key auto_increment,
`ten_nhanvien` varchar(100) not null,
`ngay_vaolam` date not null,
`sdt` varchar(20) not null,
`id_user` bigint not null,
foreign key(`id_user`) references `user`(`id_user`)
);

-- khach hang
create table `khachhang`(
`id_khachhang` bigint not null primary key  auto_increment,
`ten_khachhang` varchar(100) not null,
`diachi` varchar(255)  not null,
`sdt` varchar(20) not null,
`birthday` date not null,
`id_user` bigint not null,
foreign key(`id_user`) references `user`(`id_user`)
);

 -- chủ đề
 create table `chudesach`(
 `id_chude` bigint not null primary key  auto_increment,
 `chude` varchar(255) not null
 );

-- tác giả
create table `tac_gia` (
`id_tacgia` bigint not null primary key  auto_increment,
`ten_tacgia` varchar(100) not null
);

-- sách
 create table  `sach` (
 `id_sach` bigint not null primary key auto_increment,
 `ten_sach` varchar(100) not null,
 `so_luong` bigint not null,
 `gia` float not null,
 `mieu_ta` varchar(255) not null,
 `id_tacgia` bigint not null,
 `id_chude` bigint not null,
 foreign key(`id_tacgia`) references `tac_gia`(`id_tacgia`),
 foreign key(`id_chude`)  references `chudesach` (`id_chude`)
 );
 
 -- đơn hàng
 create table `donhang` (
 `id_donhang` bigint not null primary key auto_increment,
 `id_khachhang` bigint not null,
 `Ngay_taoDH` date not null,
 `id_nhanvien` bigint not null,
 `giatri_donhang` float,
 `trangthai_donhang` varchar(255) not null,
 foreign key(`id_khachhang`) references `khachhang`(`id_khachhang`),
 foreign key(`id_nhanvien`) references `nhanvien`(`id_nhanvien`)
 );
 

 
 -- đặt hàng
 create table `oder`(
 `id_oder` bigint not null primary key auto_increment,
 `id_donhang` bigint not null,
 `status` boolean not null,
 foreign key (`id_donhang`) references  `donhang`(`id_donhang`)
 );
 
 -- chi tiết đặt hàng
 create table `ctOder` (
 `id_oder` bigint not null,
 `id_sach` bigint not null,
 `soluong_sach` int,
foreign key (`id_sach`) references `sach`(`id_sach`),
foreign key (`id_oder`) references `oder`(`id_oder`)
 );
  