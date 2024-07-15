use college;
select * from student;

select name,per1,
case 
when per1>80 then 'O grade'
when per1<=80 and per1>=70 then 'A grade'
when per1<70 and per1>=50 then 'B grade'
else 'Fail'
end as Grade
from student;

-- Built-n Function 
-- String

-- concat()-joinging string
select * from student;
select concat('Welcome ','everyone ','good morining');
select concat(name,' ',rollno) as 'Name and RollNO' from student;

-- length()-show count letters or numbers in string
select length('itvedant - 2023');
select char('itvedant - 2023'); -- conversion
select char_length('itvedant - 2023');
select character_length('itvedant - 2023');

select name,length(name) as 'Length of Name' from student;

-- lower() and upper()- shows data in lowercase and uppercase
select lower('ItVedant');
select lcase('ItVedant');
select upper('saurabh');
select ucase('saurabh');
select ucase(name) as 'NAME' from student;

-- reverse() --shows data in reverse order
select reverse('itvedant');
select reverse(name) from student;

-- replace() -- replace existing values into new values
select replace('www.google.com','w','a');
select replace('www.google.com','com','co.in');
select * from student;
select course,replace(course,'FSD','FULL Stack') as 'New Course' from student;

-- trim() --remove white spaces(left+right)
select trim('     itvedant       ') as 'trim';
select ltrim('     itvedant       ') as 'Left trim';
select rtrim('     itvedant       ') as 'Right trim';
select trim(name) from student;

-- left() and right() --returns specified position data (others truncating or removes)
select left('www.google.com',2);
select right('www.google.com',3);
select right(name,3) from student;
select right(sid,2) from student;

-- lpad() and rpad() -- adding sepcified value after string on given size (padding)
select lpad('neha',13,'itvedant-');
select lpad('it',4,'#');
select lpad(name,14,'itvedant-') from student;
select rpad(name,14,'-itvedant') from student;

-- insert(str,pos,remove,newstr) -- inserting new string 
select insert('welcome',4,0,'done'); -- without remove
select insert('welcome',4,4,'done');
select insert('welcome',4,2,'done');
select insert(name,3,0,'-itvedant-') from student;

-- substr() or substring() -- truncate specified position values and returns new string
select substring('welcome',4);
select substr('welcome',4);
select substring('welcome',2,4);
select substr('welcome',2,4);