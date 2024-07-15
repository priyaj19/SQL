use batch408;
call showmsg();
call showemp;

-- create procedure to show employees whose salary is grater than 50000
delimiter $
create procedure showsalary()
begin
select * from employee where salary>50000;
end
$

call showsalary;


-- Types of Procedure(IN,OUT,INOUT) parameters
-- write procedure to take input as emp name and display his/her details.

-- use of IN Parameter
delimiter //
create procedure getnamedata(in name char(30))
begin
select * from employee where ename=name;
end //

drop procedure getnamedata;
call getnamedata("raj");
call getnamedata("roshan");
call getnamedata("komal");

-- use of OUT Parameter
-- show calculator operation by using in and out parameter

delimiter //
create procedure calculator(in a int,in b int,out addition int)
begin
set addition=a+b;
select addition;
end //

call calculator(5,45,@addition);

delimiter //
create procedure calculator1(in a int,in b int,out addi int,out sub int,out mult int,out divi int)
begin
set addi=a+b;
set sub=a-b;
set mult=a*b;
set divi=a/b;
end //

call calculator1(2,4,@addi,@sub,@mult,@divi);
select @addi,@sub,@mult,@divi;


-- write procedure to fetch total count of employees by using (out parameter)

delimiter //
create procedure totalemp(out total int)
begin 
select count(*) into total from employee;
end //
call totalemp(@t);
select @t;

-- use INOUT
-- write procedure to fectch salary of 'raj' employee.
delimiter //
create procedure specificname(inout name char(20))
begin
select salary into name  from employee where ename=name;
end //

set @name='raj';
call specificname(@name);
select @name;

set @name='neha';
call specificname(@name);
select @name;

-- If-else in Procedure
delimiter //
create procedure chkzero(in n int)
begin
if n=0 then
select 'n is zero' as 'output';
else
select 'n is not zero' as 'output';
end if;
end //
drop procedure chkzero;
call chkzero(4);
call chkzero(0);

-- find gratest number among any 3 numbers
delimiter //
create procedure gretestnumber(in a int,in b int,in c int)
begin
if a>b and a>c then
select 'a is greater' as 'output';
elseif b>c then
select 'b is greater' as 'output';
else
select 'c is greater' as 'output';
end if;
end //

call gretestnumber(4,5,6);

-- write procedure to show employees max salary and name when salary is greather than 50k
-- and min salary when salary is less than 50k.





















