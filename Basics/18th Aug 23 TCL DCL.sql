use college;
select * from customer;
select * from orders;

-- find customers who has not placed orders
select cid,name from customer where cid not in(select cid from orders);

select cid,name from customer where not exists
(select cid from orders where customer.cid=orders.cid);


create table products
(
pid int primary key,
total int,
pname char(20)
);

create table orders1
(
oid int,
qty int,
pid int,
foreign key(pid) references products(pid)
);
insert into products values(1,10,'nike shoes');
insert into products values(2,1,'tital watches');
insert into products values(3,5,'laptop');
insert into products values(4,6,'apple airpod');

insert into orders1 values(101,10,1);
insert into orders1 values(102,5,2);
insert into orders1 values(103,2,3);
select * from products;
select * from orders1;

-- find product orders details whose order is similar to total product available.

select * from orders1 where qty in
(select total from products where orders1.pid=products.pid);

select * from orders1 where qty =
(select total from products where orders1.pid=products.pid);

select * from orders1 where qty=all
(select total from products where orders1.pid=products.pid);

select * from orders1 where qty=any
(select total from products where orders1.pid=products.pid);

-- find product orders details whose available products are insufficient.
--  oR
-- find product orders details whose order can not be proceed further
select orders1.pid,products.pname,products.total,qty 
from orders1,products 
where orders1.pid=products.pid and qty>
(select total from products where orders1.pid=products.pid);



-- TCL (commit,savepoint,rollback)

select * from orders1;
start transaction;
savepoint beforetruncate;
delete from orders1;
select * from orders1;
rollback to beforetruncate;

start transaction;
create table user1(uid int);
savepoint beforedroptable;
drop table user1;
rollback to beforedroptable; -- drop can not roll back


commit;

select * from products;
start transaction;
delete from products where pid=4;
rollback;

-- DCL (grant,revoke)
select user();
select current_user();

select user from mysql.user;

create user 'user1'@'localhost' identified by '1234';
select user from mysql.user;
show grants for user1@localhost;

grant all privileges on *.* to 'user1'@'localhost';
show grants for user1@localhost;







