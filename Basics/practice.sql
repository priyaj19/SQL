use college;

select * from customer;
insert into customer values(5,null,43,'mumbai',5000);

select count(name),address from customer group by address;
select count(address),address from customer group by address;

-- TCL commit,savepoint,rollback
select * from student;
start transaction;
savepoint beforedeletestudent;
delete from student;
rollback to beforedeletestudent;

-- DCL grant,revoke
select user();
select current_user();

select user from mysql.user;

create user 'priya'@'localhost' identified by 'qwerty';
show  grants for priya@localhost;

alter user 'priya'@'localhost' identified by 'priya';

grant all privileges on *.* to 'priya'@'localhost';
show  grants for priya@localhost;



