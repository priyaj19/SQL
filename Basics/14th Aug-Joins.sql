use college;
show tables;

create table customer
(
cid int primary key,
name char(20),
age int,
address varchar(20),
salary float
);

create table orders
(
oid int primary key,
cid int,
orderdate date,
amount float,
foreign key(cid) references customer(cid)
);
desc customer;
desc orders;

show create table orders;

insert into customer values(1,'ramesh',32,'mumbai',2000);
insert into customer values(2,'kilan',25,'delhi',1500);
insert into customer values(3,'kaushik',23,'kota',2000);
insert into customer values(4,'chaitali',25,'mumbai',6500);

select * from customer;

insert into orders values(101,1,'2023-5-5',3000);
insert into orders values(102,1,'2023-4-5',1000);
insert into orders values(103,2,'2023-6-5',1500);
insert into orders values(104,3,'2023-7-5',2000);
insert into orders values('105','3','2023-7-5','2000');
select * from orders;

-- Equi-join

-- find customers details those who have placed order.
select distinct(customer.cid),name from customer,orders where customer.cid=orders.cid;

select distinct(c.cid),c.name from customer c,orders o where c.cid=o.cid;  -- aliase

select distinct(customer.cid),name from customer,orders 
where oid is not null and customer.cid=orders.cid;

-- on clause
select distinct(c.cid),c.name from customer c join orders o on c.cid=o.cid; -- compare matched and unmatched values

-- using clause
select distinct(c.cid),c.name from customer c join orders o using(cid);  -- only compare matching values

-- inner joins
select distinct(c.cid),c.name from customer c inner join orders o on c.cid=o.cid;

-- natural join -- instersection
select * from customer natural join orders;
select distinct(cid),name from customer natural join orders;

-- left join -- returns all left table rows
select distinct(c.cid),c.name from customer c left join orders o on c.cid=o.cid;

select distinct(c.cid),c.name,o.oid from customer c left outer join orders o on c.cid=o.cid;

-- right join -- returns all right table rows
select distinct(c.cid),c.name from customer c right join orders o on c.cid=o.cid;

select distinct(c.cid),c.name,o.oid from customer c right outer join orders o on c.cid=o.cid;

-- find customers details those who have not placed order.  -- sub query
select cid ,name from customer where not exists(select cid from orders where customer.cid=orders.cid);

-- full outer joins

select * from customer c left join orders o on c.cid=o.cid
union
select * from customer c right join orders o on c.cid=o.cid;

select * from customer c left join orders o on c.cid=o.cid
union
select * from orders o right join customer c on c.cid=o.cid;

-- cross join (full joining rows) many to many

select c.cid,c.name,o.oid from customer c cross join orders o;

select * from customer cross join orders ;

-- self joins

-- find customers order id who placed order between may to june.

select cid,oid from orders where month(orderdate) between 5 and 6;
select cid,oid,orderdate from orders where orderdate between '2023-05-01' and '2023-06-30';

select o1.oid,o1.orderdate from orders o1,orders o2
where o1.oid=o2.oid and month(o2.orderdate) between 5 and 6;

-- non-equi join

select distinct(customer.cid),name from customer,orders 
where customer.cid=orders.cid and orders.orderdate between '2023-05-01' and '2023-06-30';
