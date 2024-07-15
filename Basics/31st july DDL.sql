show databases;
create database college;
use college;
create schema class;
use class;
drop database college;
-- create table
use college;
show tables;

create table student
(
sid int,
name char(10),
dob date,
mobile_no int,
percentage float,
email varchar(20)
);
 
 describe student;
 desc student;
 
 select * from student; 
 
 create table student1 as select * from student;
 
 desc student1;
 
 select * from student1;
 
 create table student2 as select sid,name,percentage from student;
 
 desc student2;

 select * from student2;
 
 show tables;
 
 drop table student2;
 show tables;
 
 create table login
 ( 
 uid int,
 passwd varchar(20)
 );
 
 desc login;
 select * from login;