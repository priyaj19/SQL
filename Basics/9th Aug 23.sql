use college;
select * from student;

-- Math Function

-- sqrt
select sqrt(16);

-- rand() generating random number
select rand(10);

-- round() 
select round(2.456756);
select round(2.556756);

-- truncate() after decimal point it shows given digit
select truncate(454.3435345,2);
select truncate(454.3465345,2);

-- power() or pow()
select power(2,10);
select power(2,21);

-- abs() removes negative sign
select abs(-343);
select abs(1234);

-- sign() returns 1 or -1 (if +ve number then it shows 1 and if -ve number then it show -1)
select sign(-3454);
select sign(3454);

-- ceil() returns round of number and gives largest number
select ceil(1.45654);
select ceil(1.05654);
select ceil(1.95654);

-- mod() returns remainder
select mod(2,3);
select mod(3,3);
select mod(11,7);

-- floor() truncating decicmal points
select floor(2.454);
select floor(3.34545);
select floor(11.778);

-- Aggregate function count(),min(),max(),sum(),avg()

select * from student;

-- Display how many students are there.
select count(rollno) from student;
select count(name) from student; -- it doesn't count null value

-- Display overall count of cities where students belong.
select count(distinct(address)) from student;

-- min() and max()
-- find student details who has lower percentage (sub query)
select * from student where per1=(select min(per1) from student);

-- display lower percentage.
select min(per1) from student;

-- display highest percentage
select max(per1) from student;

-- display total of all percentage
select sum(per1) from student;

-- display average of all percentage
select avg(per1) from student;

-- date function
select now();  -- date and time
select curdate(); -- date 
select current_timestamp(); -- DATE AND TIME
select current_time();
select curtime();
select sysdate();  -- date and time

select date(now());
select date('2023-2-3 12:23:34');
select date('2023-2-3');

select day(sysdate());
select day('2022-12-23');

select dayname(sysdate());
select dayname('2022-12-23');

select month(sysdate());
select month('2022-12-23');

select monthname(sysdate());
select monthname('2022-12-23');

select year(sysdate());
select year('2022-12-23');

select yearweek(sysdate());
select yearweek('2022-12-23');

select week(sysdate());
select week('2022-12-23');

select dayofmonth(sysdate());
select dayofmonth('2022-12-23');

select dayofyear(sysdate());
select dayofyear('2022-12-23');

select dayofweek(sysdate());
select dayofweek('2022-12-23');

-- display age of all students
select name,dob,year(curdate())-year(dob) as 'AGE' from student;

-- addate()
select adddate(sysdate(),14);
select adddate('2022-12-23',4);

-- date_add()
select date_add(sysdate(),interval 20 day);
select date_add(sysdate(),interval 2 month);
select date_add(sysdate(),interval 5 year);

-- datediff()
select datediff(sysdate(),'2022-12-23');

-- date_format
select date_format(sysdate(),'%W %D %M %Y');
select date_format('2020-03-21','%W %D %M %Y');
select date_format('2020-03-21','%w %d %m %y'); -- day count 1 start from monday

-- display student dob in dd-mm-yyyy format
select date_format(dob,'%W %D %M %Y') as 'DOB' from student;

-- hours,min,sec
select curtime();
select hour(curtime());
select hour(current_timestamp());
select hour('2020-02-03 18:23:45');

select second(curtime());
select second(current_timestamp());
select second('2020-02-03 18:23:45');

select minute(curtime());
select minute(current_timestamp());
select minute('2020-02-03 18:23:45');

select date_format('2020-02-03 14:23:4','%W %D %M %Y  %T %p');