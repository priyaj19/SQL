use batch408;
-- creating funtion
delimiter //
create function shownumbers(n int)
returns varchar(20)
deterministic
begin
declare i int default 1;
declare answer varchar(20) default '';
while i<=5 do
set answer=concat(answer,i,' ');
set i=i+1;
end while;
return answer;
end //
select shownumbers(5);
drop function shownumbers;


-- write a function to show remarks for employees salary. if salary is greater than 50000 
-- then show upper grade and if less than 50000 then show lower grade remark.

delimiter //
create function remarkofsalary(sal int)
returns varchar(30)
deterministic
begin
declare remark varchar(20);
if sal>=50000 then
set remark='upper grade';
else
set remark='lower grade';
end if;
return remark;
end //
select *,remarkofsalary(salary) from employee;

-- cursor (iterator in procedure reads one row at a time)
use hr;
-- display
select distinct(count(*)) from employees;
-- write procedure to display 10 emp name by using loop
delimiter //
create procedure employees10(inout namelist varchar(100))
begin
declare i int default 1;
declare answer varchar(20) default '';
	declare e10 cursor for
	select first_name from employees;
	open e10;
while i<=10 do
	fetch e10 into answer;
set namelist=concat(answer,' ',namelist);
set i=i+1;
end while;
	close e10;
end //
drop procedure employees10;

set @namelist='';
call employees10(@namelist);
select distinct(@namelist) from employees;























