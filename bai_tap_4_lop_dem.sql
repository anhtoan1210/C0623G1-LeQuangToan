create database quan_ly_sinh_vien_lop_dem;
use quan_ly_sinh_vien_lop_dem;

create table Class(

         ClassID int not null auto_increment primary key,

          ClassName varchar(60) not null,

          StartDate datetime not null,

          Status bit

);
create table Student(

          StudentId int not null auto_increment primary key,

          StudentName varchar(30)  not null,

          Address varchar(50),

          Phone varchar(20),

          Status bit,

          ClassId int not null,

          foreign  key (ClassId) references Class (ClassID)

);
create table Subject(

         SubId int not null auto_increment primary key,

         SubName varchar(30)  not null,

         Credit tinyint  not null default 1 check ( Credit >= 1 ),

         Status bit default 1

);
create table Mark(

        MarkId int not null auto_increment primary key,

        SubId int not null,

        StudentId int not null,

        Mark float default 0 check ( Mark BETWEEN 0 AND 100),

        ExamTimes tinyint default 1,

        unique (SubId, StudentId),

        foreign  key (SubId) references Subject (SubId),

        foreign  key(StudentId) references Student (StudentId)

 );
 insert into  Class
values (1, 'A1', '2008-12-20', 1);
 insert into  Class
values (2, 'A2', '2008-12-22', 1);
 insert into  Class
values (3, 'B3', current_date, 0);

 insert into  Student (StudentName, Address, Phone, Status, ClassId)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
 insert into  Student (StudentName, Address, Status, ClassId)
values ('Hoa', 'Hai phong', 1, 1);
 insert into  Student (StudentName, Address, Phone, Status, ClassId)
values ('Manh', 'HCM', '0123123123', 0, 2);
 insert into  Subject
values (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
 insert into Mark (SubId, StudentId, Mark, ExamTimes)
values (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);

select SubName, max(m.mark)
from mark m
join subject s on s.SubId=m.SubId
group by SubName
order by max(m.mark) desc
limit 1;

select SubId,SubName,Status,max(Credit)
from subject
group by SubId
order by Credit desc 
limit 1;

select m.StudentId,s.StudentName,avg(m.mark) as "medium_score"
from mark m
join student s
on m.StudentId=s.StudentId
group by m.StudentId
order by avg(m.mark) desc;