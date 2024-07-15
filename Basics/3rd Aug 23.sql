use college;
desc emp;
select * from emp;
alter table emp add id int not null first;
alter table emp add constraint id_pk primary key(id); -- error 
alter table emp modify empno int; -- it removes pk but adding pk to next unique key
-- so we are creating new table from emp.
create table empnew as select joiningdate,deptno,gender,salary,deptname from emp;
desc empnew;
select * from empnew;
alter table empnew add eid int;
alter table empnew modify eid int primary key auto_increment;
alter table empnew modify deptno int primary key; -- error

-- use of auto_increment
create table login1
(
uid int primary key auto_increment,
uname varchar(20) not null,
passwd varchar(20)
);

desc login1;
insert into login1(uname) values('a11'),('a12'),('a13');
select * from login1;
update login1 set passwd=123;

-- default
desc empnew;
select current_timestamp();
select now();

select * from empnew;
insert into empnew(joiningdate,deptno,gender,salary,deptname) values
(null,107,'male',60000,'qqq');

alter table empnew modify joiningdate datetime default now();

desc empnew;

insert into empnew(deptno,gender,salary,deptname) values
(108,'male',60000,'xxx');
select * from empnew;


-- check constraint
alter table empnew modify salary float check(salary>=20000);
desc empnew;
insert into empnew(deptno,gender,salary,deptname) values
(109,'male',1000,'xxx'); -- error for check salary
select * from empnew;
insert into empnew(deptno,gender,salary,deptname) values
(109,'male',20000,'xxx');

-- enum (set of values but allows only one)

desc empnew;
select * from empnew;
alter table empnew modify gender enum('male','female');
desc empnew;
insert into empnew(deptno,gender,salary,deptname) values
(110,'sdgdfh',20000,'xxx'); -- error because of enum

-- set (set of values but allows multiple)
desc empnew;
select * from empnew;
delete from empnew where eid in(1,2,7,8,9);
alter table empnew modify deptname set('finance','engineer','HR','ACC');
insert into empnew(deptno,gender,salary,deptname) values
(111,'male',20000,'HR,ACC,finance');
select * from empnew;
