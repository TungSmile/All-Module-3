create table Customer (
cid int primary key,
name varchar(25),
cage tinyint
);
create table order_ (
oid int primary key,
cid int ,
odate datetime,
oTotalprice int,
foreign key (cid) references Customer (cid)
);
create table Product (
pid int primary key,
pname varchar(25),
pprice int 
);
create table OrderDetail (
oid int,
pid int,
odqty int,
primary key (oid,pid),
foreign key (oid) references order_ (oid),
foreign key (pid) references Product (pid)
);
insert into Customer (cid,name,cage)
value (1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);
insert into Order_(oid,cid,odate,ototalprice)
value (1,1,'2006-3-21',null),
(2,2,'2006-3-23',null),
(3,1,'2006-3-16',null);
insert into Product (pid,pname,pprice)
value (1,'May Giat',3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',7),
(4,'Quat',1),
(5,'Bep Dien',2);
insert into OrderDetail (oid,pid,odqty)
value (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

-- question 1 : show  oid,odate,oprice by bill in order_
select oid,odate,ototalprice from order_ o join customer c on o.cid=c.cid;
-- question 2 : show list client bought and list item buyed by client
select c.name,p.pname  
from customer c join Order_ o on o.cid=c.cid
                join OrderDetail od on o.oid=od.oid
                join Product p on p.pid=od.pid;
-- question 3 : show list name client hasnt buy anything
select c.name
from customer c  left join Order_ o on o.cid=c.cid
where o.cid=null;
-- question 4 : show id bill , date sell ,total price by order
select o.oid,o.odate,sum(od.odqty * p.pprice)
from order_ o join OrderDetail od on o.oid=od.oid
              join Product p on p.pid=od.pid
              group by (o.oid);