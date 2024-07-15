use college;
create table student5
(
sid int primary key,
name char(20)
);

create table marks5
(
sid int,
totalmarks int,
foreign key(sid) references student5(sid)
);


insert into student5 values(1,'abhi');
insert into student5 values(2,'roshan');
insert into student5 values(3,'vinay');
insert into student5 values(4,'raj');

insert into marks5 values(1,95);
insert into marks5 values(2,80);
insert into marks5 values(3,74);
insert into marks5 values(4,81);

select * from student5;
select * from marks5;

-- find students names & marks where marks are greater than id=3
select s.name,m.totalmarks from student5 s,marks5 m 
where s.sid=m.sid and m.totalmarks>(select totalmarks from  marks5 where sid=3);

-- find students names & id whose marks are present lesser than average of all students.

select s.name,m.totalmarks from student5 s,marks5 m 
where s.sid=m.sid and m.totalmarks<(select avg(totalmarks) from  marks5);

-- find students names & id whose marks are present.                                
insert into student5 values(5,'rahul');

select s.name,m.totalmarks from student5 s,marks5 m 
where s.sid=m.sid and exists (select totalmarks from marks5);

-- find students names & id whose marks are not present.
select * from student5 
where not exists(select sid from marks5 where student5.sid=marks5.sid);

-- views (visual/virtual table) result table
create view marksnot as 
select * from student5
where not exists(select sid from marks5 where student5.sid=marks5.sid);

select * from marksnot;

-- subquery (create,insert,update,delete)

create table newstudent as select * from student5;
select * from newstudent;

delete from newstudent where sid IN(select sid from student5 where sid>3);
select * from newstudent;

insert into newstudent select * from student5 where sid>3;
select * from newstudent;

update newstudent set name='seema' where sid =(select sid from student5 where sid=5);
select * from newstudent;
select * from student5;


-- use hr database

use hr;
select * from employees;
-- (employee_id,first_name,last_name,email,phone_number,hire_date,@job_id,salary,
-- commission_pct,@manager_id,@department_id)
select * from departments;
-- (department_id,department_name,@manager_id,@location_id)
select * from locations;
-- (location_id,street_address,postal_code,city,state_province,@country_id)
select * from countries;
-- (country_id,country_name,@region_id)
select * from job_history;
-- (employee_id,@start_date,end_date,@job_id,@department_id)
select * from jobs;
-- (job_id,job_title,min_salary,max_salary)
select * from regions;
-- (region_id,region_name)

-- Write a query to display the name (first and last ) for those employees who gets more 
-- salary than the employee whose ID is 163.
select employee_id,first_name,last_name,salary from employees 
where salary>(select salary from employees where employee_id=163);

-- Write a query to display all the information of employess whose salary is within the 
-- range of smallest salary and 2500.
-- select min(salary) from employees where salary between 2100 and 2500;

select * from employees where salary IN (select min(salary) from employees) and 2500;


-- Write a query to display the name (first and last ),salary,department id,job id 
-- for those employees who works in the 
-- same designation as the employee works whose id is 169.



-- Write a query to display the name (first and last ),salary,department id,job id for 
-- those employees who earn such amount of 
-- salary which is the smallest salary of any of the departments.


-- Write a query to get the details of employees who are managers.


-- Write a query to get the details of employees who manage a department.


-- Write a query to display the department id and the total salary for those 
-- departments which contains at least one employee


--  Write a query to display the name (first and last ) and department for 
-- all employees for any existence of 
-- those employees whose salary is more than 3700.                         


-- Write a query to display all the information of those employees who 
-- did not have any job in the past.


-- Write a query to display employee name(firstname,lastname),
-- employee_id and job title for all employees whose location is Toronto

