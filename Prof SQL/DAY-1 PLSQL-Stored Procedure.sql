-- PL/SQL Stored Procedure
create database batch408;
use batch408;

delimiter //
create procedure showmsg()
begin
declare message varchar(100);
set message="welcome to PL-SQL Block";
select message;
end
//

call showmsg();
drop procedure showmsg;

-- create procedure to show all records of employees.
delimiter $
create procedure showemp()
begin
select * from employee;
end $

call showemp;








