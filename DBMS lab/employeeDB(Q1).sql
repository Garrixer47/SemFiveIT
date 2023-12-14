create database wce;
use wce;
create table employee(
id int primary key,
name varchar(50),
salary long
);
insert into employee(id, name, salary)
values
(1,"Adam",25000),
(2,"Bob",30000),
(3,"Casey",40000);
select * from employee;

create table emp1(
id int,
salary int default 2000
);
select * from emp1;
insert into emp1 (id) 
values
(1),
(2),
(3);

select * from emp1;