create database tables;
use tables;
create table test10(id int , name varchar(20));

insert into test10 values(1,'Abhi'),(2,'shimi'),(3,'Yash');
drop table test10;
truncate test10;
show tables;
select * from test10;

alter table test10 add column (salary int);
alter table test10 add column (age int default 18);
alter table test10 drop column salary;
alter table test10 rename column age to newage;
alter table test10 add constraint primary key(id);
desc test10;  # describe table
# add a column before  the name column
# change the data type of name column to integer
# add not null constraint to the name and its column
# add a foriegn key of a column department id reference to the depart table

create table ajay as # ctas create table as select
select actor_id , first_name from sakila.actor;
select * from ajay;
insert into ajay values(19999,'Ajay');
set sql_safe_updates = 0;
#update command
update ajay set first_name='Ajay Maliya' where actor_id=2;
delete from ajay where actor_id = 2;
# what is ddl and dml statement
# difference between truncate delter or drop
# what is normalisation
# difference between char and varchar datatype

# add a column before the name column
alter table test10 
add column city varchar(20) before name;

# change the data type of name column to integer
alter table test10 
modify column name int;

# add not null constraint to the name column
alter table test10 
modify column name varchar(20) not null;

# add a foreign key of department_id reference to department table
alter table test10
add column department_id int;

alter table test10
add constraint fk_dept
foreign key (department_id)
references department(department_id);

# add column
alter table test10 add salary int;

# drop column
alter table test10 drop column salary;

# rename column
alter table test10 rename column age to newage;

# primary key
alter table test10 add constraint primary key(id);

# describe table
desc test10;