create table KHACHHANG (
MAKH int primary key,
HOTEN varchar(25),
DCHI varchar(25),
SODT int ,
NGSINH date,
DOANHSO int,
NGDK date);
create table NHANVIEN (
MANV int primary key,
HOTEN varchar(25),
NGVL date,
SODT int
);
create table SANPHAM (
MASP int primary key,
TENSP varchar(25),
DVT int,
NUOCSX varchar(25),
GIA int
);
create table HOADON (
MAHD int primary key,
NGHD date,
MAKH int,
MANV int,
TRIGIA int,
foreign key (MAKH) references KHACHHANG (MAKH),
foreign key (MANV) references NHANVIEN (MANV)
);
create table CTHD (
SOHD int ,
MASP int ,
SL int ,
primary key (SOHD,MASP),
foreign key (SOHD) references HOADON(MAHD),
foreign key (MASP) references SANPHAM(MASP)
);
INSERT INTO `new_schema`.`nhanvien` (`MANV`, `HOTEN`, `NGVL`, `SODT`) VALUES ('1', 'a', '2023-6-19', '123'),
 ('2', 'b', '2023-6-18', '321'),
 ('3', 'c', '2023-6-17', '456'),
 ('4', 'd', '2023-6-16', '654');
alter table SANPHAM 
MODIFY COLUMN DVT varchar(25);
INSERT INTO `new_schema`.`sanpham` (`MASP`, `TENSP`, `DVT`, `NUOCSX`, `GIA`) 
VALUES ('1', 'tao', 'qua', 'my', '100'),
('2', 'nho', 'qua', 'tau', '100'),
('3', 'buoi', 'doi', 'vn', '2500'),
('4', 'dao', 'doi', 'eu', '2000');
INSERT INTO `new_schema`.`khachhang` (`MAKH`, `HOTEN`, `DCHI`, `SODT`, `NGSINH`, `DOANHSO`, `NGDK`)
 VALUES ('1', 'homelesss', 'ko', '0', '2001-12-2', '0', '2001-1-2'),
 ('2', 'gangter', '12a', '123', '2001-12-2', '500', '2001-1-2'),
 ('3', 'vip', '13a', '321', '2001-12-2', '10000', '2001-1-2'),
 ('4', '!human', '14a', '1', '2001-12-2', '9000', '2001-1-2');
INSERT INTO `new_schema`.`hoadon` (`MAHD`, `NGHD`, `MAKH`, `MANV`, `TRIGIA`) 
VALUES ('1', '2006-12-4', '3', '2', '5000'),
 ('2', '2007-12-4', '3', '1', '1000'),
 ('3', '2006-12-4', '4', '4', '200');
INSERT INTO `new_schema`.`cthd` (`SOHD`, `MASP`, `SL`) 
VALUES ('1', '3', '1'),
('1', '4', '1'),
('2', '3', '1'),
('3', '1', '1'),
('3', '2', '1');

-- question 1 : show sp buyed on 2006
select sp.TENSP, sp.DVT, sp.NUOCSX, sp.GIA
from sanpham sp join cthd db on sp.MASP=db.MASP
join hoadon hd on db.SOHD=hd.MAHD where year(hd.NGHD)=2006;

-- question 2 : show min/max of bill
select max(TRIGIA),min(TRIGIA) from hoadon;
select MAHD, NGHD, MAKH, MANV, TRIGIA from hoadon where TRIGIA = (select max(TRIGIA)from hoadon);
select MAHD, NGHD, MAKH, MANV, TRIGIA from hoadon where TRIGIA = (select min(TRIGIA)from hoadon);

-- question 3 : calculation  avgrage bill in 2006
select avg(trigia) as AmountIn2006 from hoadon where year(NGHD)=2006;

-- question 4 : show amount sale in 2006 
select sum(trigia) from hoadon where year(NGHD)=2006  ;

-- question 5 : show bill max in 2006
select * from hoadon where TRIGIA= (select max(TRIGIA)from hoadon);

-- question 6 : show name client have bill max in 2006
select kh.HOTEN from khachhang kh join 
(select MAKH,TRIGIA from hoadon where TRIGIA = (select max(TRIGIA)from hoadon where year(NGHD)=2006) ) as hd
on kh.MAKH=hd.MAKH;

-- question 7 : print  3 name client have bill max (new syntax DISTINCT ,limit)
INSERT INTO `new_schema`.`hoadon` (`MAHD`, `NGHD`, `MAKH`, `MANV`, `TRIGIA`) VALUES ('4', '2006-12-04', '1', '2', '1000');
select DISTINCT kh.hoten from khachhang kh join (select MAKH,TRIGIA from hoadon order by TRIGIA asc ) as hd on kh.MAKH=hd.MAKH limit 3 ;

-- question 8 : print id and name product have sale in price in top 3 cost max (??? hiển thị ngược)
select distinct  sp.MASP,sp.TENSP,hd.trigia
from sanpham sp join cthd db on sp.MASP=db.MASP
join (select distinct mahd,TRIGIA from hoadon order by TRIGIA desc )as hd on hd.MAHD=db.soHD  limit 3 ;

-- question 9 : print (MASP, TENSP) of product make by thailand in top 3 price max (check with more resufl)
INSERT INTO `new_schema`.`sanpham` (`MASP`, `TENSP`, `DVT`, `NUOCSX`, `GIA`) VALUES ('5', 'sake', 'qua', 'thai', '100');
select  MASP, TENSP from sanpham where NUOCSX='thai'  order by gia desc limit 3;

-- question 10 : print (MASP, TENSP) of product make by china in top 3 price max of list made by china
INSERT INTO `new_schema`.`sanpham` (`MASP`, `TENSP`, `DVT`, `NUOCSX`, `GIA`) VALUES ('6', 'tao tau', 'qua','china', '200');
select  sp.MASP, sp.TENSP from  (select * from sanpham where NUOCSX='china') as sp order by sp.gia desc limit 3;

-- question 11 : print 3 client have sales max by sort rank
select DISTINCT * from khachhang order by DOANHSO desc limit 3;

-- question 12 : count  total product made by china
INSERT INTO `new_schema`.`sanpham` (`MASP`, `TENSP`, `DVT`, `NUOCSX`, `GIA`) VALUES ('7', 'oc cho', 'qua', 'china', '100');
select count(TENSP) from sanpham where NUOCSX='china';

-- question 13 : count tatoal product for everyone
select NUOCSX ,count(TENSP) from sanpham group by NUOCSX;

-- question 14 : everycountry , show min , max , average price (ao ma)
 select NUOCSX,max(gia),min(gia),avg(gia) from sanpham group by NUOCSX;
 
 -- question 15 : caculation amount on daily
 select NGHD, sum(trigia) from hoadon group by NGHD;
 
 -- question 16 : sumary total product sale in 10/2006
 UPDATE `new_schema`.`hoadon` SET `NGHD` = '2006-10-04' WHERE (`MAHD` = '3');
 select db.MASP,sum(db.sl)
 from  hoadon hd 
 join cthd db on hd.mahd=db.sohd 
 where hd.NGHD  between '2006-10-1' and '2006-10-30' 
 group by db.masp;
 
 -- question 17 : caculation amount on every month
 select month(NGHD),sum(trigia) from hoadon group by month(NGHD);
 
 -- question 18 : find bill have 4 product 
 INSERT INTO `new_schema`.`cthd` (`SOHD`, `MASP`, `SL`) VALUES ('4', '1', '1'),
('4', '2', '2'),
('4', '3', '3'),
('4', '4', '4');
select hd.mahd,db.sl
from hoadon hd join (select sohd,count(masp)as sl  from cthd group by sohd) as db on hd.mahd=db.sohd where db.sl=4;

-- question 19 : find 3 bill with product made by viet nam
select distinct hd.mahd
from hoadon hd join cthd db on hd.mahd=db.sohd 
join sanpham sp where sp.NUOCSX='vn' limit 3;
 
 -- question 20 : find client has many time most buy
 create view a as
 select makh,count(makh) as b
 from hoadon group by makh;
select makh from
a where b=(select max(b)from a) ;
 -- way 2 for question 20
 select makh ,count(makh) as timebuy
 from hoadon group by makh order by timebuy desc limit 1 ;
 
-- question 21 : what is month has amount hightest in 2006 ?
select month(NGHD) as month,sum(trigia) as amount
from hoadon where year(NGHD)='2006' group by month order by amount desc limit 1  ;

-- question 22 : find product (MASP, TENSP) has the lowest total sale  in 2006
select sanpham.MASP,sanpham.TENSP
from sanpham  join 
(select MASP,count(sl) as a from hoadon join cthd on hoadon.MAHD=cthd.sohd where year(NGHD)='2006'group by masp order by a asc limit 1) as a
on sanpham.masp=a.MASP;

-- question 23 : find product (MASP,TENSP) for country with highest price
select sp.masp,sp.tensp from sanpham sp join
(select NUOCSX,max(gia) as max from sanpham group by NUOCSX ) as a on a.NUOCSX=sp.nuocsx and a.max=sp.gia;


-- question 24 :find country made 3 product 
select NUOCSX, count(distinct gia) as time
from sanpham  group by NUOCSX having time >=3;

-- question 25 :Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất
select kh.makh,kh.hoten from (select makh,count(makh) from hoadon group by makh order by count(makh) desc limit 1) as hd join
(select makh,hoten,doanhso from khachhang order by doanhso desc limit 10) as kh on hd.makh=kh.makh 
