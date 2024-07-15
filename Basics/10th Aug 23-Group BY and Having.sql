use college;
show tables;
select * from student;

-- find no of student as per address.
select address,count(name) as 'No of students' from student group by address;

-- find student count as per percentage.
select per1,count(rollno) as 'No of students' from student group by per1;

-- find student count as per percentage who score above 80.
select per1,count(rollno) as 'No of students' 
from student group by per1
having per1>80;

select * from student; -- f-1,2,6 m-4,5,8

-- add gender details of all students.
alter table student add gender enum('m','f'); 
update student set gender='f' where rollno in(1,2,6);
update student set gender='m' where rollno in(4,5,8);

-- find number of male and female student.
select gender,count(name) from student group by gender;

-- find how many students birthdays in december month.
select dob,count(name) from student group by dob having month(dob)=12;

-- find how many students birthdays in 2002 year.
select dob,count(name) from student group by dob having year(dob)=2002;

-- find how many students birthdays in next week.
select dob,count(name) from student 
where month(dob)=8
group by dob 
having day(dob) between day(curdate()) and day(date_add(curdate(),interval 7 day));

select date_add(curdate(),interval 7 day);

select * from student;
insert into student values(10,1009,'aa','2000-08-12','virar',3534534,45,'abc@yahoo.com','FSD','m');

-- find how many students uses gmail account.

select count(email) from student where email like '%gmail.com';

-- find how many students are using gmail and yahoo account.
select count(email),name from student  where email like '%gmail.com' ;

SELECT COUNT(*) as "Gmail and Yahoo Users"
FROM student
WHERE email LIKE '%gmail%'
UNION
SELECT COUNT(*) as "Yahoo Users"
FROM student
WHERE email LIKE '%yahoo%';