 CREATE database four;
use  four;
 create table customer (
 acc_no integer primary key, 
cust_name varchar(20), 
 avail_balance decimal
 );

 create table mini_statement (
 acc_no integer, 
 avail_balance decimal, 
foreign key(acc_no) references customer(acc_no) on delete cascade
 ); 

 insert into customer values (1000, "Fanny", 7000);
 insert into customer values (1001, "Peter", 12000); 
 create trigger update_cus
       before update on customer
       for each row
       begin
       insert into mini_statement values (old.acc_no, old.avail_balance);
       end;


 update customer set avail_balance = avail_balance -2500 where acc_no = 1001;
 update customer set avail_balance = avail_balance + 3050 where acc_no = 1000; 

 select *from customer;
 select *from mini_statement;


 create table micro_statement (
 acc_no integer, 
 avail_balance decimal, 
 foreign key(acc_no) references customer(acc_no) on delete cascade
 ); 

insert into customer values (1002, "Janitor", 4500);

 create trigger update_after
 after update on customer
 for each row
 begin
 insert into micro_statement values(new.acc_no, new.avail_balance) ;

 select *from customer;
 select *from mini_statement;

update customer set avail_balance = avail_balance + 100000 where acc_no = 1002; 


select *from customer;
select *from micro_statement;