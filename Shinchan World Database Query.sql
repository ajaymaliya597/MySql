CREATE DATABASE shinchan_world;

USE shinchan_world;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50),
    marks INT,
    phone VARCHAR(20),
    admission_date DATE
);

CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(50),
    subject_name VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50),
    fees INT,
    duration_months INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id)
    REFERENCES teachers(teacher_id)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enroll_date DATE,
    FOREIGN KEY (student_id)
    REFERENCES students(student_id),
    FOREIGN KEY (course_id)
    REFERENCES courses(course_id)
);

INSERT INTO students
(name, age, gender, city, marks, phone, admission_date)
VALUES
('Shinchan', 5, 'Male', 'Kasukabe', 40, '9000000001', '2025-01-10'),
('Kazama', 5, 'Male', 'Tokyo', 95, '9000000002', '2025-01-11'),
('Nene', 5, 'Female', 'Osaka', 88, '9000000003', '2025-01-12'),
('Bochan', 5, 'Male', 'Kyoto', 70, '9000000004', '2025-01-13'),
('Masao', 5, 'Male', 'Nagoya', 60, '9000000005', '2025-01-14'),
('Himawari', 2, 'Female', 'Kasukabe', 77, '9000000006', '2025-01-15'),
('Ai Chan', 5, 'Female', 'Tokyo', 95, '9000000007', '2025-01-16'),
('Misae', 29, 'Female', 'Kasukabe', 66, '9000000008', '2025-01-17'),
('Hiroshi', 35, 'Male', 'Osaka', 81, '9000000009', '2025-01-18'),
('Principal', 50, 'Male', 'Tokyo', 99, '9000000010', '2025-01-19');

INSERT INTO teachers
(teacher_name, subject_name, salary, city)
VALUES
('Matsuzaka', 'Math', 50000, 'Tokyo'),
('Yoshinaga', 'Science', 55000, 'Osaka'),
('Ume', 'Drawing', 45000, 'Kyoto'),
('Kuroiso', 'Sports', 60000, 'Nagoya'),
('Sunflower', 'Dance', 52000, 'Tokyo');

INSERT INTO courses
(course_name, fees, duration_months, teacher_id)
VALUES
('Math Master', 5000, 6, 1),
('Science Pro', 6000, 8, 2),
('Drawing Basic', 3000, 3, 3),
('Football Camp', 7000, 4, 4),
('Dance Training', 5500, 5, 5),
('Advanced Math', 9000, 12, 1),
('Robotics', 10000, 10, 2),
('Painting Expert', 6500, 7, 3);

INSERT INTO enrollments
(student_id, course_id, enroll_date)
VALUES
(1, 1, '2025-02-01'),
(1, 3, '2025-02-03'),
(1, 5, '2025-02-04'),

(2, 1, '2025-02-01'),
(2, 2, '2025-02-02'),
(2, 6, '2025-02-05'),

(3, 5, '2025-02-02'),
(3, 8, '2025-02-06'),

(4, 4, '2025-02-01'),

(5, 3, '2025-02-03'),
(5, 7, '2025-02-07'),

(6, 5, '2025-02-02'),

(7, 1, '2025-02-01'),
(7, 6, '2025-02-05'),
(7, 7, '2025-02-08'),

(8, 2, '2025-02-02'),

(9, 4, '2025-02-04'),
(9, 5, '2025-02-06'),

(10, 6, '2025-02-01'),
(10, 7, '2025-02-03'),
(10, 8, '2025-02-05');

CREATE INDEX idx_student_marks
ON students(marks);

CREATE INDEX idx_course_fees
ON courses(fees);

CREATE VIEW topper_students AS
SELECT *
FROM students
WHERE marks >= 90;