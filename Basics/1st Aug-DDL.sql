use college;
desc student;
select * from student;
-- add new column
alter table student add address int;
alter table student add (course char(20),subject char(20));

-- delete column
desc student;
alter table student drop subject;
alter table student drop address;

-- add column with fisrt and after
alter table student add address varchar(20) after dob;
alter table student add rollno int first;
desc student;
select * from student;

-- changing datatype of column
desc student;
alter table student modify course varchar(20);
alter table student modify course varchar(50);

--  renaming column name as well as set new data type 
alter table student change percentage per float;
desc student;
alter table student change per per1 int;
desc student;

-- renaming table name
desc student;
alter table student rename newstudent;
desc newstudent;

-- OR
rename table newstudent to student;
desc student;

-- database rename for existing db
-- rename database class to class1;  --error

-- removing all rows or records

truncate table student;
truncate student;
select * from student;

-- DML(insert,update,delete)

desc student;
select * from student;
insert into student(rollno,sid,name,dob,address,mobile_no,per1,email,course) values
(1,1001,'seema','2000-12-3','malad',657656868,80,'seema@gmail.com','FSD/DSE');

insert into student values 
(4,1004,'rahul','2002-10-31','borivali',657656868,80,'rahul@gmail.com','DS'),
(5,1005,'raj','2003-2-13','bandra',353454654,90,'raj@gmail.com','FSD'),
(6,1006,'pooja','2001-3-31','virar',464564564,70,'pooja@gmail.com','ML');

SELECT * FROM STUDENT;


create table emp
(
empno int,
ename varchar(15),
hiredate date,
deptno int,
gender varchar(15),
salary  float,
commission float
);
desc emp;

insert into emp values
(1,'rahul',now(),101,'male',50000,2000),
(2,'raj','2022-12-23',102,'male',40000,8000),
(3,'sahil','2023-05-3',103,'male',30000,5000),
(4,'pooja','2023-01-01',104,'female',50000,2000),
(5,'rakesh',now(),105,'female',80000,7000);

select * from emp;

