use p;
create table student(
id int primary key,
name varchar(20 )
);
insert into student values (1,'Ajay'),(2,'Raj');
create table class(
class_id int primary key,
batch_name varchar(20),
batch_id int,
foreign key (batch_id)
references student(id) # bhar ata table(column)
);
insert into class values(1,'Python',1),(2,'Raj',2),(3,'SQL',1);

select * from class;

select s.name ,c.batch_name from student s join class c
on c.batch_id = s.id 
where batch_id = 1;


