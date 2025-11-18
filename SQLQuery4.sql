create table user1(
userid int primary key,
email varchar(100)
);

select * from user1;

insert into user1(userid, email) values (1, 'test@example.com');
insert into user1 (userid, email) values (2, 'dummy@example.com');

create table orders (
orderid int,
productid int,
quantity int,
primary key (orderid, productid)
);

select * from orders;

drop table orders;

create table orders (
orderid int not null,
productid int,
quantity int);


alter table orders add constraint pk_orderid primary key (orderid);

alter table orders drop constraint pk_orderid;


select constraint_name, constraint_type,table_name
from information_schema.table_constraints where table_name = 'orders';

create table products (
productid int primary key,
price decimal(10, 2) check (price > 0)
);

insert into products(productid, price) values (1, 50.00);

select * from products;

insert into products(productid, price) values (2, -5.00);

drop table orders;

create table orders (
orderid int primary key,
location varchar(100) default 'pune'
);

insert into orders(orderid) values (1);

select * from orders;

insert into orders (orderid, location) values (2, 'mumbai');

insert into orders (orderid, location) values (3,null);

insert into orders (orderid, location) values (4,null);



create table  employees1(
employeeid int identity primary key,
fullname varchar(100)
);

insert into employees1 (fullname) values ('alice'),
('bob'),
('charlie');

select * from employees1;

insert into employees1(employeeid, fullname)
values (9999,'test user');

set identity_insert employees1 on;

identity(starting value, increment step)

create table employees2(
employeeid int identity(1001,1) primary key,
fullname varchar(100)
);

select * from  employees2;

create table product1 (
productid int primary key,
productname varchar(100) not null,
category varchar(50),
price decimal(10,2),
stockuantity int
);

create table order1(
orderid int primary key,
productid int,
quantity int,
orderdate date,
customername varchar(100),
foreign key (productid) references product1(productid)
);