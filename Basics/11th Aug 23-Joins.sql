use college;
select * from student;

create table trainer
(
tid int primary key,
tname char(20),
cid int
);

create table candidate
(
cid int primary key,
cname char(20)
);

select * from trainer;
insert into trainer values(5,'rahul',103);
insert into trainer values(6,'madhesh',null);

insert into candidate values(101,'ganesh');
insert into candidate values(102,'sahil');
insert into candidate values(103,'vinay');

select * from candidate;

select * from candidate,trainer where tid=2;
select tid,cname from candidate,trainer where tid=2;
select * from candidate,trainer;
-- OR

select cid,cname from candidate
union
select tid,cid from trainer;

-- DIsplay candidate name whose studying under trainer id 2.
select tid,candidate.cid,cname from candidate,trainer where tid=2 and trainer.cid=candidate.cid;

-- Find teacher name of student sahil.alter
select tname,candidate.cid,cname from candidate,trainer where cname='sahil' and trainer.cid=candidate.cid;
select tname,candidate.cid,cname from candidate,trainer where cname='sahil'; -- wrong

delete from candidate where cname='vinay';
select * from trainer;
select * from candidate;

insert into trainer values(7,'sneha',104);

desc trainer;

insert into candidate values(103,'Vinay');
insert into candidate values(104,'raju');

select * from candidate;
alter table trainer add constraint foreign key(cid) references candidate(cid);
desc trainer;
show index from trainer;
show create table trainer;
select * from trainer;

insert into trainer values(8,'neha',10); -- error
delete from candidate where cid=101; -- error

alter table trainer add constraint foreign key(cid) references candidate(cid) on delete cascade; -- error
desc trainer;
show create table trainer;
show index from trainer;
select * from candidate;
select * from trainer;
delete from candidate where cid=101;
show create table trainer;
alter table trainer drop constraint trainer_ibfk_1 ;
alter table trainer drop constraint trainer_ibfk_2 ;
alter table trainer drop constraint trainer_ibfk_3 ;
alter table trainer drop index cid;
desc trainer;

alter table trainer add constraint foreign key(cid) references candidate(cid) on delete cascade;
show create table trainer;
desc trainer;

select * from trainer;
select * from candidate;
delete from candidate where cid=101;


create table dept
(
dept_id int primary key,
dept_name varchar(20)
);
create table employee_date
(
empid int primary key,
empname varchar(20),
manager_id int,
dept_id int,
salary int,
foreign key(dept_id) references dept(dept_id) 
);
desc dept;
desc employee_date;


-- A. Display the employee name along with their department name
select empname,dept_name from employee_date,dept where employee_date.dept_id=dept.dept_id;


-- Display the total number of employees working in each department
select dept_name,dept_id,count(empid) from employee_date,dept 
where employee_date.dept_id=dept.dept_id 
group by dept_id;


-- List all the employees those who are getting the same salary











