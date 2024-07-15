use college;
show tables;
select * from emp;
-- 1) Write a query to add new column as manager_name and deptname in emp table
alter table emp add(manager_name char(10),deptname char(10));

-- 2) Write a query to remove commission from in emp table
alter table emp drop commission;
select * from emp;

-- 3) Write a query to set gender datatype as char(20) from in emp table
desc emp;
alter table emp modify gender char(20);

-- 4) Write a query to rename hiredate to joiningdate in emp table.
alter table emp change hiredate joiningdate date;
desc emp;

select * from emp;
insert into emp values(6,'aaa',now(),106,'male',50000,'xyz','zzzz');
insert into emp(manager_name,deptname) values('xx','zz');

update emp set manager_name='xxx'; -- update all rows of column manager_name
select * from emp;

update emp set manager_name='ganesh' where empno=1;
update emp set deptname='finance' where empno=1;
update emp set manager_name='ganesh', deptname='finance'  where empno=2;
update emp set manager_name='shree', deptname='HR'  where empno=3;
select * from emp;
update emp set manager_name='akash', deptname='engineer'  where empno in(3,5); -- multiple rows with condition

delete from emp where deptname='zz';
select * from emp;

-- Constraint (rule set for records)
-- Not null
desc emp;
alter table emp modify empno int not null;
insert into emp values(7,null,'2023-2-2',null,null,null,null,null);
select * from emp;
insert into emp values(null,null,'2023-2-2',null,null,null,null,null); -- error

-- unique
desc emp;
alter table emp modify deptno int unique;
insert into emp values(8,null,'2023-2-2',null,null,null,null,null);
select * from emp;
insert into emp values(8,'ddd','2023-2-2',106,null,null,null,null); -- error
insert into emp values(8,'ddd','2023-2-2',108,null,null,null,null); 
delete from emp where empno=8;
select * from emp;
desc emp;
alter table emp modify ename char(20) unique;
delete from emp where empno=7;
alter table emp modify ename char(20) not null unique;




