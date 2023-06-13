create table staff(
id int auto_increment primary key,
name varchar(255),
birthday date,
adder varchar(255),
salary double,
id_deparment int,
id_project int);
create table deparment(
id int auto_increment primary key,
name varchar(255),
id_manager int
);
create table project(
id int auto_increment primary key,
name varchar(255),
describe_pj varchar(255)
);
create table manager(
id int auto_increment primary key,
id_staff int);

alter table staff
add constraint fk1 FOREIGN KEY (id_deparment) REFERENCES deparment(id),
add constraint fk2 FOREIGN KEY (id_project) REFERENCES project(id);
alter table deparment
add constraint fk3 FOREIGN KEY (id_manager) REFERENCES manager(id);
alter table manager
add constraint fk4 FOREIGN KEY (id_staff) REFERENCES staff(id);