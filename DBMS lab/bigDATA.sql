create database college;
use college;
create table student(
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(2),
city varchar(10)
);
insert into student 
values
(1,"Aaditya",78,"C","Pune"),
(2,"Bhumika",93,"A","Goa"),
(3,"Chetan",88,"B","Pune"),
(4,"Nishi",60,"E","Delhi"),
(5,"Prem",90,"A","Kolhapur"),
(6,"Aadit",71,"C","Pune");

select * from student;
select name, marks from student;
select rollno, name, marks from student;

-- where clause

select * from student where marks > 60;
select marks from student where rollno < 5;
select * from student where marks > 60 and rollno < 5;
select * from student where marks = 78;
select * from student where marks != 78; 

-- limit clause

select * from student limit 4;

-- order by clause

select * from student order by rollno desc;
select * from student order by marks; 
select * from student order by grade;
select * from student order by marks desc limit 3;

-- aggregate functions (returns single value)

select max(marks) from student;
select min(marks) from student;
select avg(marks) from student;
select count(marks) from student;

-- group by clause

select city, count(rollno) from student group by city;
select city, avg(marks) from student group by city;

-- practice query

select city, avg(marks) from student group by city order by avg(marks);