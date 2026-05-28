-- this tcl command insure make sure my data is correct 


-- ACID (Web Site exanple)
-- Atomicity -> wheter it is complettly done or completely undone
-- consistency -> step by step execution
-- isolation -> sirf kaam mere liye hoga 
-- durability -> changes saves karna

create database rajdb;
use rajdb;
create table raj45(id int);
start transaction; # case 1 
# case 2 disable autocommit , it start only when we try to executes dml commands
# when they end , we have try to write commit , ddl,rollback when we use them then started
# transaction get stop
drop table raj45;
insert into raj45 values('11'),('68');
SET SQL_SAFE_UPDATES = 0;
rollback; # start transaction get stopped
select @autocommit; # bydefault value is 1
commit;
delete from raj45 where id = 10;
start transaction; # case 1 
rollback;
start transaction;
insert into raj45 values('768'),('500'),(400);
select * from raj45;
savepoint raj45_savepoint_ins;
update raj45 set id=800;
rollback to raj45_savepoint_ins;