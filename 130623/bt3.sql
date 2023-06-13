create table product (
id int auto_increment primary key,
name varchar(255),
cost int ,
quality int );

 create table client(
 id int auto_increment primary key,
 name varchar(255),
 adder varchar(255),
 contact varchar(255)
 );
 
create table bill (
id int auto_increment primary key,
day_order date,
id_client int,
total int,
foreign key (id_client)references client(id)
 );
 create table detail_bill(
 id int auto_increment primary key,
 id_bill int,
 id_product int,
 foreign key (id_bill) references bill(id),
 foreign key (id_product) references product(id)
 );