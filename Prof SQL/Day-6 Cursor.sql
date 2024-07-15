use hr;
-- while loop in procedure

select * from employees;

delimiter //
create procedure display_name()
begin
declare i int default 1;
declare output varchar(10) default '';
select first_name from employees;
while i<=5 do
set output=concat(output,first_name,' ');
set i=i+1;
end while;
select output;
end //

call display_name();
drop procedure displayname;

-- label loop

delimiter //
create procedure lableloop()
begin
declare n int;
declare ans varchar(20);
set n=1;
set ans='';
label_loop:loop
set ans=concat(ans,n,' ');
set n=n+1;
iterate label_loop;
end loop;
select ans;
end //

call lableloop;
drop procedure lableloop;

-- label loop(display only 10 emp names)

delimiter //
create procedure empnames1(inout namelist varchar(200))
begin
declare n int default 1;
declare ans varchar(20) default '';
declare empnames_cursor cursor for
select first_name from employees;
open empnames_cursor;
label_loop:loop
fetch empnames_cursor into ans;
if n>10 then leave label_loop; end if;
set namelist=concat(ans,' ',namelist);
set n=n+1;
iterate label_loop;
end loop;
close empnames_cursor;
end //

set @namelist="";
call empnames1(@namelist);
select @namelist;
drop procedure empnames1;


-- insert empname into newemp table by using cursor
create table newemp(first_name varchar(20);
select * from newemp;

delimiter //
create procedure  newempnames()
begin
declare fname varchar(20);
declare newemp_cursor cursor for select first_name from employees;
open newemp_cursor;
fetch newemp_cursor into fname;
insert into newemp values(fname);
close newemp_cursor;
end // 

select * from newemp;
call newempnames;
select * from newemp;
drop procedure newempnames;












