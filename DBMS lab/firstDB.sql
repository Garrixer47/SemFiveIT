create database org;
use org;
create table student( 
id int primary key,
name varchar(255),
age int not null
);
insert into student values(1,"aaditya",20);
insert into student values(2,"Viren",21);
select * from student;
drop table student;

create table student(
roll_no int primary key,
name varchar(50)
);
select * from student;
insert into student
(roll_no, name) 
values 
(1,"aaditya"),
(2,"Himanshi"),
(3,"Rupa");
select * from student;
insert into student values(4,"Kusum");
select * from student;