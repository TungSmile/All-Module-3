create table test(
testid int primary key,
name varchar(20)
);
create table student (
rn int primary key,
name varchar(20),
age tinyint 
);
create table StudentTest(
rn int ,
testid int,
date datetime,
mark float,
foreign key (rn) references student(rn),
foreign key (testid) references test(testid),
primary key (rn,testid)
);

insert into student (rn,name,age)
value (1,'Nguyen Hong Ha',20 ),
(2,'Truong Ngoc Anh',30),
(3,'Tuan Minh',25),
(4,'Dan Truong',22);
insert into test (testid,name)
value (1,'EPC'),
(2,'DWMX'),
(3,'SQL1'),
(4,'SQL2');
insert into StudentTest (rn,testid,date,mark)
value (1,1,'2006-7-17',8),
(1,2,'2006-7-18',5),
(1,3,'2006-7-19',7),
(2,1,'2006-7-17',7),
(2,2,'2006-7-18',4),
(2,3,'2006-7-19',2),
(3,1,'2006-7-17',10),
(3,3,'2006-7-18',1);
-- câu 2 :
-- lỗi khi tạo thứ tự mai check sau
set @row_number=0;
select (@row_number:=@row_number+1) as ''  , s.name,t.name,st.mark,st.date 
from Studenttest st join student s on st.rn=s.rn
join test t on st.testid=t.testid ORDER BY s.name ASC ;
-- câu 3 :
select * from student where rn=4;
-- câu 4 :
select s.name,t.name,st.mark,st.date 
 from Studenttest st join student s on st.rn=s.rn
 join test t on st.testid=t.testid where st.mark<5;
 -- câu 5 :
create view avgmark as
 select s.name,avg(st.mark) as Average
 from Studenttest st join student s on st.rn=s.rn
 group by (s.name) order by Average desc;
 -- câu 6 :
select  max(Average) from avgmark;
select name , max(Average) from  avgmark group by name ;
