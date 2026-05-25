use datatypedb;


-- out of range (1byte -> 8bit -> 2**8(0 1) (-128 to 127))
-- small int --> 2byte medium int -> 3byte
-- int --4
-- big int -> 8byte

create table test3(salary float , salary2 double);
insert into test3 values(1989.9301934,1989.9301934);
select * from test3;

create table test4(price double(6,2));
insert into test4 values(0.7366484);
insert into test4 values(44.7326723);
insert into test4 values(4453);
insert into test4 values(44531);
select * from test4;

create table test5(countrycode char(3));
insert into test5 values('IND');
select * from test5;
create table test6(countrycode varchar(3));
insert into test6 values('IND');
insert into test6 values('I    ');
select * from test6;







