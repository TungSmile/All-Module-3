create table Products (
Id int primary key,
productCode int,
productName varchar(25),
productPrice float,
productAmount int check (productAmount>0) ,
productDescription text,
productStatus tinyint
);
insert into Products(Id,productCode,productName,productPrice,productAmount,productDescription,productStatus)
value (1,1,'tong lao',100,4,'+3 ho bao',1),
(2,2,'bitis',200,7,'+5 chi mang',1),
(3,3,'ao ba lo',100,3,'+1 nhanh nhen',1),
(4,4,'dieu cay',100,1,'+10 chi mang',1),
(5,5,'quan hoa',100,5,'+1 nhanh nhen',1);
-- question 1 : create unique index for productCode
create unique index indexint on Products(productCode);
-- question 2 : create Composite Index for table Products
create index CompositeIndex on Products(productName,productPrice);
-- question 3 : use command explain for how does it work 
explain select productCode from Products where productCode=4;
-- question 4 : compare before and after create select index ???? i dont know
-- question 5  : create view by productCode, productName, productPrice, productStatus to table products
create view viewtest as
select productCode, productName, productPrice, productStatus
from Products;
-- question 6 : edit that view ( edit view can change table primary )
update viewtest set productprice = 200 where productCode=4;
-- question 7 : delete that view 
drop view viewtest;
-- question 8 : create store procedure , that get all infomation of everything product in table
delimiter //
 create procedure qs8 (in Id int ,
productCode int,
productName varchar(25),
productPrice float,
productAmount int  ,
productDescription text,
productStatus tinyint )
begin
end;
// delimiter ;

-- question 9 : create new product by store procedure
delimiter //
 create procedure crenew (in 
Id int ,
 Code1 int,
 Name1 varchar(25),
 Price float,
 Amount int  ,
 Description1 text,
 Status1 tinyint )
begin
insert into Products (Id,productCode,productName,productPrice,productAmount,productDescription,productStatus)
value (Id,Code1,Name1,Price,Amount,Description1,Status1);
end;
// delimiter ;
-- sử dụng call
SET @Id = 6;
SET @Code1 = 123;
SET @Name1 = 'Product 1';
SET @Price = 10.5;
SET @Amount = 100;
SET @Description1 = 'This is a product';
SET @Status1 = 1;

CALL crenew(@Id, @Code1, @Name1, @Price, @Amount, @Description1, @Status1);

-- question 10 : edit product by id
 delimiter //
 create procedure editbyid(in 
Id1 int ,
 Code1 int,
 Name1 varchar(25),
 Price float,
 Amount int  ,
 Description1 text,
 Status1 tinyint )
 begin
 update products 
 set productCode=Code1,
  productName=Name1,
  productPrice=Price,
  productAmount=Amount,
  productDescription=Description1,
  productStatus=Status1
 where id=id1;
 end
// delimiter  ;
call editbyid (1,1,'edit',777,8,'edit',1);
-- question 11 : del by id
delimiter //
 create procedure delbyid(in id1 int)
 begin
 delete from products where id=id1;
 end
 // delimiter ;
 call delbyid(1);