use dcl;
select * from mysql.user;

# create user ishan identified by '123'; 
create user Ajay identified by '123'; 
create user Raj identified by '123'; 
create role 'group';
grant 'group' to 'ishan','Ajay','Raj';
set default role 'group' to
'ishan',
'Ajay',
'Raj';
select * from mysql.role_edges;
select current_user();
create table emp(id int, name varchar(20));
insert into emp values(20,'Abhi'),(21,'Naina');
select * from emp;
SET SQL_SAFE_UPDATES = 0;
show grants for ishan;

grant select on dcl.emp to ishan ;
grant delete on dcl.company to ishan;




create table company(id int,name varchar(20));
insert into company values(1,'IT'),(2,'Infosys'),(3,'Microsoft');
select * from company;

grant select on company to ishan;
grant select,insert on company to ishan;
revoke select,insert on company from ishan;
revoke delete on dcl.* from ishan;
grant select(id) on company to ishan;
grant select on company to ishan;
revoke select on company from ishan;





