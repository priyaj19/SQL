use batch408;
-- trigger is nothing but an event which can be happens 
-- on table before and after operations like insert,update and delete

-- syntax
-- delimiter //
-- create trigger triggername
-- before | after
-- on table_name
-- for each row
-- begin
-- stmt1
-- stmt2
--
--
-- end //
create database triggerdb;
use triggerdb;
-- write trigger for insert same data into table2 when insert happens on table1
create table table1(id int,name char(20));
create table table2(id int,name char(20));

delimiter //
create trigger trInsertTable1
after insert
on table1
for each row
begin 
insert into table2(id,name) values(new.id,new.name);
end //
select * from table1;
select * from table2;
insert into table1 values (101,'ajay');
select * from table1;
select * from table2;
insert into table1 values (102,'pooja');
insert into table1 values (103,'meena');
insert into table1 values (104,'raj');
select * from table1;
select * from table2;

create table table3
(
id int,
name char(20),
tableaction varchar(20),
logdatetime datetime
);

delimiter //
create trigger trDeleteTable1
before delete
on table1
for each row
begin
insert into table3 values(old.id,old.name,'delete',now());
end //
select * from table1;
select * from table3;
delete from table1 where id=103;
select * from table1;
select * from table3;  -- deleted record inserted here
select * from table2;
drop trigger trDeleteTable1;

select user();

create table table4
(
username varchar(50),
description varchar(100),
logdatetime datetime
);

delimiter //
create trigger trUpdateTable1
after update
on table1
for each row
begin 
insert into table4 values
(user(),concat('update table1 record ',old.id,' Previous Name: ',old.name,' New name: ',new.name),now());
end //

select * from table1;
select * from table4;
update table1 set name='neha' where id=101;









