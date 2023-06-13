audiences
create table audiences(
id int auto_increment primary key,
name varchar(250),
adder varchar(250),
contact varchar(250)
);
create table author(
id int auto_increment primary key,
name varchar(250),
country varchar(250)
);
create table category(
id int auto_increment primary key,
info varchar(250)
);
create table book(
id int auto_increment  primary key ,
name varchar(250),
id_author int,
id_category int,
foreign key (id_author) references audiences (id),
foreign key (id_category) references category (id)
);
 
 

