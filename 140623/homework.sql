create table nhacungcap(
manhacc int auto_increment primary key,
tennhacc varchar(255),
diachi varchar(255),
sodt int(11),
masothue int(20)
);
create table loaidichvu (
maloaidv int auto_increment primary key,
tenloaidv varchar(255)
);
create table mucphi (
mamp int auto_increment primary key,
dongia int,
mota text
);
create table dongxe (
dongxe varchar(255) primary key,
hangxe varchar(255),
sochongoi tinyint
);
create table dangkycungcap (
madkcc int auto_increment primary key,
manhacc int,
maloaidv int,
dongxe varchar(255),
mamp int,
ngaybatdaucungcap date,
ngayketthuccungcap date,
soluongxedangky int,
foreign key (manhacc) references nhacungcap(manhacc),
foreign key (maloaidv) references loaidichvu(maloaidv),
foreign key (dongxe) references dongxe(dongxe),
foreign key (mamp) references mucphi(mamp)
);
select * from dongxe where sochongoi >5;
select b.* from dangkycungcap a  
join nhacungcap b on a.manhacc=b.manhacc 
join mucphi c on a.mamp=c.mamp 
join dongxe e on a.dongxe=e.dongxe
where (e.hangxe='toyota' and c.dongia=15000) or (e.hangxe='KIA' and c.dongia=20000);
select * from nhacungcap a order by a.tennhacc asc , a.masothue desc;
select b.*,count(b.manhacc) as solandk from dangkycungcap a join nhacungcap b on a.manhacc=b.manhacc where a.ngaybatdaucungcap='2015-11-20' group by a.manhacc;
select b.hangxe from dangkycungcap a join dongxe b on a.dongxe=b.dongxe ;
select a.MaDKCC,a.MaNhaCC,b.TenNhaCC,b.DiaChi,b.MaSoThue,c.TenLoaiDV,d.DonGia,e.hangxe,a.ngaybatdaucungcap,a.ngayketthuccungcap 
from nhacungcap b left join dangkycungcap a on a.manhacc=b.manhacc 
left join loaidichvu c on c.maloaidv=a.maloaidv
left join mucphi d on d.mamp=a.mamp
left join dongxe e on e.dongxe=a.dongxe;
select a.* from dangkycungcap b join nhacungcap a on b.manhacc=a.manhacc
join dongxe c on b.dongxe=c.dongxe  where c.dongxe='Hiace';
select b.* from dangkycungcap a  left join nhacungcap b on a.manhacc=b.manhacc;
select nhacungcap.* from dangkycungcap join nhacungcap on nhacungcap.manhacc=dangkycungcap.manhacc where nhacungcap.manhacc=null;