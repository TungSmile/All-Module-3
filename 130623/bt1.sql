create table shedules(
id int auto_increment primary key,
date_shedules date,
place_form varchar(255),
place_to varchar(255),
start_hour time,
end_hour time
);
create table passenger(
id int auto_increment primary key,
name_client varchar(255),
convient int,
contact varchar(255)
);
 create table ticket(
 id_ticket int auto_increment primary key,
 id_passenger int ,
 id_shedules int,
 FOREIGN KEY ( id_shedules) REFERENCES shedules(id),
 FOREIGN KEY ( id_passenger) REFERENCES passenger(id)
 );
 

 insert into shedules (date_shedules,place_form,place_to,start_hour,end_hour)
 value('1990-05-20','hanoi','hcm','09:00:00','10:00:00');
 insert into passenger(name_client,convient,contact) value ('xalo',1,'084123456789');
 insert into ticket (id_passenger,id_shedules) value(1,1);