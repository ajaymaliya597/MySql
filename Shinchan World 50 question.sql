use shinchan_world;
show tables;
select * from topper_students;
select city,count(*)
from students
group by city;

select city,avg(marks)
from students
group by city;

select city,max(marks)
from students
group by city;

select city,min(marks)
from students
group by city;

select student_id,count(*)
from enrollments
group by student_id;

select s.name,sum(c.fees)
from students s
join enrollments e
on s.student_id=e.student_id
join courses c
on e.course_id=c.course_id
group by s.name;

select t.teacher_name,avg(c.fees)
from teachers t
join courses c
on t.teacher_id=c.teacher_id
group by t.teacher_name;

select teacher_id,count(*)
from courses
group by teacher_id;

select city,count(*)
from students
group by city
having count(*)>2;

select s.name,sum(c.fees)
from students s
join enrollments e
on s.student_id=e.student_id
join courses c
on e.course_id=c.course_id
group by s.name
having sum(c.fees)>10000;

select marks,count(*)
from students
group by marks
having count(*)>1;

select city,avg(marks)
from students
group by city
having avg(marks)>80;

select t.teacher_name,
count(distinct e.student_id)
from teachers t
join courses c
on t.teacher_id=c.teacher_id
join enrollments e
on c.course_id=e.course_id
group by t.teacher_name
order by count(distinct e.student_id) desc
limit 1;

select t.teacher_name,sum(c.fees)
from teachers t
join courses c
on t.teacher_id=c.teacher_id
join enrollments e
on c.course_id=e.course_id
group by t.teacher_name;

select s.name,count(*)
from students s
join enrollments e
on s.student_id=e.student_id
group by s.name
having count(*)=2;

select extract(month from enroll_date),
count(*)
from enrollments
group by extract(month from enroll_date);

select c.course_name,avg(s.marks)
from courses c
join enrollments e
on c.course_id=e.course_id
join students s
on e.student_id=s.student_id
group by c.course_name
having avg(s.marks)>85;

select s.city,sum(c.fees)
from students s
join enrollments e
on s.student_id=e.student_id
join courses c
on e.course_id=c.course_id
group by s.city
order by sum(c.fees) desc
limit 1;

select t.teacher_name,count(*)
from teachers t
join courses c
on t.teacher_id=c.teacher_id
join enrollments e
on c.course_id=e.course_id
group by t.teacher_name
having count(*)>3;

select c.course_name,sum(c.fees)
from courses c
join enrollments e
on c.course_id=e.course_id
group by c.course_name
order by sum(c.fees) desc
limit 1;

select s.name, c.course_name
from students s
join enrollments e
on s.student_id = e.student_id
join courses c
on e.course_id = c.course_id;

select s.name, c.course_name, c.fees
from students s
join enrollments e
on s.student_id = e.student_id
join courses c
on e.course_id = c.course_id;

select s.name, e.enroll_date
from students s
join enrollments e
on s.student_id = e.student_id
where e.enroll_date > '2025-02-03';

select c.course_name
from courses c
join teachers t
on c.teacher_id = t.teacher_id
where t.teacher_name = 'matsuzaka';

select s.name, t.teacher_name
from students s
join enrollments e
on s.student_id = e.student_id
join courses c
on e.course_id = c.course_id
join teachers t
on c.teacher_id = t.teacher_id;

select s.name, count(*) as total_courses
from students s
join enrollments e
on s.student_id = e.student_id
group by s.name
having count(*) > 2;

select s.name, sum(c.fees) as total_fees
from students s
join enrollments e
on s.student_id = e.student_id
join courses c
on e.course_id = c.course_id
group by s.name;

select s.name, c.course_name, c.fees
from students s
join enrollments e
on s.student_id = e.student_id
join courses c
on e.course_id = c.course_id
order by c.fees desc
limit 1;

select s.name, t.teacher_name, t.salary
from students s
join enrollments e
on s.student_id = e.student_id
join courses c
on e.course_id = c.course_id
join teachers t
on c.teacher_id = t.teacher_id;

select s.name
from students s
join enrollments e
on s.student_id = e.student_id
join courses c
on e.course_id = c.course_id
where c.course_name in ('math master','science pro')
group by s.name
having count(distinct c.course_name)=2;

select c.course_name,count(*) as total_students
from courses c
join enrollments e
on c.course_id=e.course_id
group by c.course_name
having count(*)>2;

select s.city,count(*) as total_enrollments
from students s
join enrollments e
on s.student_id=e.student_id
group by s.city;

select t.teacher_name,count(*) as total_courses
from teachers t
join courses c
on t.teacher_id=c.teacher_id
group by t.teacher_name
order by total_courses desc
limit 1;

select distinct s.name
from students s
join enrollments e
on s.student_id=e.student_id
join courses c
on e.course_id=c.course_id
where c.fees>7000;

select s.name,avg(c.fees)
from students s
join enrollments e
on s.student_id=e.student_id
join courses c
on e.course_id=c.course_id
group by s.name;
-- left join
select s.name,c.course_name
from students s
left join enrollments e
on s.student_id=e.student_id
left join courses c
on e.course_id=c.course_id;

select s.name
from students s
left join enrollments e
on s.student_id=e.student_id
where e.student_id is null;

select s.name,count(e.course_id)
from students s
left join enrollments e
on s.student_id=e.student_id
group by s.name;

select t.teacher_name,c.course_name
from teachers t
left join courses c
on t.teacher_id=c.teacher_id;

select s.name,max(e.enroll_date)
from students s
left join enrollments e
on s.student_id=e.student_id
group by s.name;
-- right join
select c.course_name,s.name
from students s
right join enrollments e
on s.student_id=e.student_id
right join courses c
on e.course_id=c.course_id;

select c.course_name
from enrollments e
right join courses c
on e.course_id=c.course_id
where e.course_id is null;

select t.teacher_name,count(c.course_id)
from courses c
right join teachers t
on c.teacher_id=t.teacher_id
group by t.teacher_name;

select c.course_name,t.teacher_name
from courses c
right join teachers t
on c.teacher_id=t.teacher_id;

select c.course_name,
coalesce(sum(c.fees),0)
from enrollments e
right join courses c
on e.course_id=c.course_id
group by c.course_name;
-- self join
select s1.name,s2.name,s1.city
from students s1
join students s2
on s1.city=s2.city
and s1.student_id<s2.student_id;

select s1.name,s2.name,s1.marks
from students s1
join students s2
on s1.marks=s2.marks
and s1.student_id<s2.student_id;

select t1.teacher_name,t2.teacher_name,t1.city
from teachers t1
join teachers t2
on t1.city=t2.city
and t1.teacher_id<t2.teacher_id;

select s1.name,s2.name
from students s1
join students s2
on s1.age>s2.age;

select s1.city
from students s1
join students s2
on s1.city=s2.city
and s1.student_id<s2.student_id;
