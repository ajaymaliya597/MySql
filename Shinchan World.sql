show databases;
use shinchan_world;
show tables;
desc students;
select name from students ;
select city,avg(marks) from students
group by city;
# Q16. Show student names with enrolled courses
select * from students;
select * from courses; # froeign key is the key which refers other tables primary key
select * from enrollments; #course id,student id 
select s.name,c.course_name,e.enroll_date from enrollments e 
join students s 
on e.student_id = s.student_id 
join courses c 
on e.course_id =  c.course_id;
select courses , enrollments;

select * from students;
select * from courses;
select * from teachers;

select course_name,teacher_name from courses c join teachers t
on c.teacher_id = t.teacher_id;



select s.name ,count(*) from students s 
join enrollments e 
on e.student_id = s.student_id 
join courses c 
on e.course_id =  c.course_id 
group by s.name
having count(*) > 2
;


















