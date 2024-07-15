use batch408;
-- loops in procedure
-- while loop
delimiter //
create procedure whiledemo()
begin
declare i int default 1;
declare output varchar(20) default '';
while i<=5 do
-- select i; -- opens output 5 times
set output=concat(output,i,' ');
set i=i+1;
end while;
select output;
end 
//
drop procedure whiledemo;
call whiledemo;

-- until or repeat loop
delimiter //
create procedure repeatloop()
begin
declare i int;
declare output varchar(50);
set i=1;
set output='';
repeat
set output=concat(output,i,' ');
set i=i+1;
until i>5 end repeat;
select output;
end //

call repeatloop;
drop procedure repeatloop;


--  label loop
delimiter //
create procedure lableloop()
begin
declare i int default 1;
declare output varchar(10) default '';
go:loop
if i>5 then leave go;
end if;
set output=concat(output,i,' ');
set i=i+1;
iterate go;
end loop;
select output;
end //

call lableloop;


-- show employees whose salary is greater than 60000 show only 2 records;
select * from employee;

delimiter //
create procedure salary()
begin 
declare i int default 1;
declare output varchar(20) default '';
select ename from employee where salary>60000;
while i<=2 do
set output=concat(output,ename,' ');
set i=i+1;
end while;
select output;
end //

call salary;















