use `14/06/23`;
select *from student;
select *from student where status=true;
select *from subject where credit<10;
sELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID;
SELECT S.StudentId, S.StudentName, C.ClassNamestudent
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId;
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';
select * from student  where StudentName like 'h%';
select * from class where  month( StartDate)=12;
select *from subject where Credit between 3 and 5;
update student set classid ='2' where StudentName like 'hung';
select s.StudentName, sub.SubName , m.Mark  from student S join mark M on S.StudentId=M.StudentId join Subject sub  on M.SubId = sub.SubId order by  m.Mark asc