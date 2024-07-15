use college;
show tables;
-- Display all students.
select * from student;

-- Display student name as per their dob and address.
select name,dob,address from student;

select name as 'Student Name',dob as 'Date of Birth',address from student;
desc student;

-- Display student names who stay at malad.
select name,address from student where address='malad';

-- arithmatic operator
select 10+23;
select 10+23,10-23,10*23,10/23,10%23;

-- Display 50% of student percentage.
select name,per1,(per1*50)/100 as '50% per' from student;

-- Display students name who has got percentage 80 and above.
select name,per1 from student where per1>=80;

select * from student;

-- Display students name with address except who stay at virar.
select name,address from student where address!='virar';
select name,address from student where address<>'virar';

-- Display students details who score 70 and stay at virar.
select * from student where per1=70 and address='virar';

-- Display students details who score 70 and stay at malad.
select * from student where per1=70 and address='malad';

-- Display students details who score 70 or stay at malad.
select * from student where per1=70 or address='malad';

-- Display students details who score 70 and 80 percentage.
select * from student where per1 in(70,80);

select * from student;

-- find student names who has not selected course as ML.
select name,course from student where not (course='ML');
select name,course from student where course!='ML';
select name,course from student where course<>'ML';

-- Display students details who roll number start from 3 and ends with 5.
select * from student where rollno between 3 and 5; -- 3 to 5
select * from student where rollno>=3 and rollno<=5; -- 3 to 5

select * from student where rollno in(3,5); -- in will show for only 3 and 5

select 5 in(3,545,43);
select 5 between 3 and 545 and 43;
select * from student;
-- Like _ , %
select name from student where name like 's%'; -- start with s
select name from student where name like '%a'; -- ends with a
select name from student where name like 'p%a%'; -- start with p and ends with a
select name from student where name like '__j%'; -- unknow of start 2 char 
select name from student where name like 'r%_h__'; -- unknow with any char
insert into student values(7,1007,null,null,null,null,null,null,null);
insert into student values(8,1008,'vinay',null,null,null,null,null,null);
insert into student values(9,1008,'',null,null,null,null,null,null);
select * from student;

-- find student details whoes name is not given
select * from student where name is null or name='';

-- find student details whoes percentage is not given
select * from student where per1 is null;

-- distinct()
select distinct(name) from student;
select distinct(address) from student;

-- order by (default ascending)
select distinct(name) from student order by name;
select distinct(name) from student order by name asc;

select distinct(name) from student order by name desc;

select distinct(address) from student order by address;
select distinct(address) from student order by address desc;

-- limit
select * from student limit 3;