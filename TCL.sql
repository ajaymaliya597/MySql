-- this tcl command insure make sure my data is correct 


-- ACID (Web Site exanple)
-- Atomicity -> wheter it is complettly done or completely undone
-- consistency -> step by step execution
-- isolation -> sirf kaam mere liye hoga 
-- durability -> changes saves karna

create database rajdb;
use rajdb;
create table raj45(id int);
start transaction;
insert into raj45 values('10'),('50');
select * from raj45;
commit;