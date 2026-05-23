create database const_db;
# dql access krna
# ddl data ko define krn
use const_db;
select database();
# create is a data definition language
create table if not exists test1(id int, age int );
# insert is a data manuplation language
insert into test1 values(101,32),(102,null);
#select data query language command

create table if not exists test1(id int, age int);
#constraint  are the rules which are the applied to the table column to prevent 
#invaild data in the table 
# constraint are the rules which are applied to the table column to prevent invalid data in the table
insert into test3 values(102,32);
select * from test3;
 

insert into test3 values(null,40);
-- default value

create table if not exists tests6(id int primary key,age int);
insert into tests6 values(80,23);
insert into tests6 values(null,27); -- null nhi ho skta h kyuki tests6 m already (80,23) ho rkha h 
select * from tests6;

create table if not exists tests8(id int, age int, salary int, primary key (id,age) );
insert into tests8 values(1,50,5000000), (2,40,20000),(1,51,6000000),(3,50,100);
select * from tests8;
desc tests8;
-- super key ka mtlb h saare combination or composite key ka mtlb h sbse chota combination

create table if not exists tests9(id int, age int check (age >18) );
insert into tests9 values(1,50);
insert into tests9 values(1,10);
select * from tests9;

create table if not exists test10(id int, age int check(age between 18 and 22) );
insert into test10 values(1,20);
insert into test10 values(1,10);

select * from test10;


create table class( cname varchar(20) primary key ); -- 7a,8a,8c
insert into class values(10),(8),(9);
select * from class;

create table student(id int, name varchar(20), cname varchar(20),
foreign key (cname) references class(cname)
);
insert into student values(1,'naina','10'),(2,'abhi','9');

#data types in sql 
select * from student;