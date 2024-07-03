create database booking;
use booking;
create table hotel(hotel_no int primary key auto_increment,name varchar(20),city varchar(20));
describe hotel;
insert into hotel values(101,'Empire hotel','New york');
insert into hotel values(102,'Park palace','New york');
insert into hotel values(103,'Brownstone hotel','Toronto');
insert into hotel values(104,'James plaza','Torornto');
insert into hotel values(105,'Devon hotel','Boston');
insert into hotel values(106,'Clairmont hotel','Boston');
select * from hotel;

create table room(room_no int primary key,hotel_no int,type varchar(20),price int,
foreign key(hotel_no)references hotel(hotel_no));
describe room;
insert into room values(401,101,'s',145);
insert into room values(402,102,'s',145);
insert into room values(403,103,'n',190);
insert into room values(404,104,'n',180);
insert into room values(405,105,'s',200);
insert into room values(406,106,'n',155);
select * from room;

create table booking(guest_no int primary key,hotel_no int,date_from date,date_to date,room_no int,
foreign key(hotel_no)references hotel(hotel_no));
insert into booking values(301,101,'1999-08-16','1999-08-20',401);
insert into booking values(302,102,'1999-06-15','1999-06-20',402);
insert into booking values(303,103,'1999-05-10','1999-05-15',403);
insert into booking values(304,104,'1999-04-12','1999-04-16',404);
insert into booking values(305,105,'1999-09-20','1999-09-25',405);
insert into booking values(306,106,'1999-10-15','1999-10-20',406);
select * from booking;

create table guest(guest_no int primary key,name varchar(20),city varchar(20));
describe guest;
insert into guest values(201,'Adam wayne','Pittsburge');
insert into guest values(202,'Tara cummings','Baltimore');
insert into guest values(203,'Vanessa perry','Pittsburge');
insert into guest values(204,'Tom hancock','Philadelphia');
insert into guest values(205,'robert swift','Atlanta');
insert into guest values(206,'Edward cane','Baltimore');
select * from guest;

#1. List full details of all hotels.
select * from hotel;

#2)List full details of all hotels in Mumbai.
select * from hotel where city='mumbai';

#3)List the names and cities of all guests, ordered according to their cities.
select * from guest order by city;

#4)List all details for non-smoking rooms in ascending order of price.
select * from room order by price;

#5)List the number of hotels there are.
select count(name)as Hotel from hotel;

#6)List the cities in which guests live. Each city should be listed only once.
select distinct city from guest;

#7)List the average price of a room.
select avg(price)from room;

#8)List hotel names, their room numbers, and the type of that room
select hotel.name,room.room_no,room.type
from hotel
inner join room
on hotel.hotel_no=room.hotel_no;

#9)List the hotel names, booking dates, and room numbers for all hotels in Banglore.
SELECT h.name AS hotel_name, b.date_from, b.date_to, b.room_no
FROM hotel h
JOIN booking b ON h.hotel_no = b.hotel_no
WHERE h.city = 'Bangalore';

select hotel.name as hotel_name,booking.date_from,booking.date_to,booking.room_no
from hotel
inner join booking
on hotel.hotel_no=booking.hotel_no
where hotel.city='bangalore';

#10)What is the number of bookings that started in the month of September?
select count(*)as number_of_booking
from booking
where month(date_from)=9;

#11)List the names and cities of guests who began a stay in Mumbai in August.
select guest.name,guest.city
from guest
join booking
on guest.guest_no=booking.guest_no
where month(booking.date_from)=8 and guest.city='mumbai';

#12) List the hotel names and room numbers of any hotel rooms that have not been booked.
SELECT h.name AS hotel_name, r.room_no
FROM hotel h
JOIN room r ON h.hotel_no = r.hotel_no
LEFT JOIN booking b ON r.room_no = b.room_no
WHERE b.room_no IS NULL;

#13)List the hotel name and city of the hotel with the highest priced room.
select hotel.name,hotel.city
from hotel
join room
on hotel.hotel_no=room.hotel_no
where room.price=(select max(price)from room);

#14)List hotel names, room numbers, cities, and prices for hotels that have rooms with prices lower than the lowest priced room in a Gujrat hotel.
SELECT h.name, r.room_no, h.city, r.price
FROM hotel h
JOIN room r ON h.hotel_no = r.hotel_no
WHERE r.price < (
  SELECT MIN(price)
  FROM room
  JOIN hotel ON room.hotel_no = hotel.hotel_no
  WHERE hotel.city = 'Gujarat'
);

#15) List the average price of a room grouped by city.
select hotel.city,avg(room.price)as average_room_price
from hotel
join room
on hotel.hotel_no=room.hotel_no
group by hotel.city;










 


