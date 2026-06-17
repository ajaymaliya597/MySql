
CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(20),
    dept_id INT
);

CREATE TABLE Departments (
    dept_id INT,
    dept_name VARCHAR(20)
);
INSERT INTO Employees VALUES (1, 'Ajay', 10);
INSERT INTO Employees VALUES (2, 'Ravi', 20);
INSERT INTO Employees VALUES (3, 'Aman', 30);
INSERT INTO Employees VALUES (4, 'Neha', NULL);

INSERT INTO Departments VALUES (10, 'HR');
INSERT INTO Departments VALUES (20, 'IT');
INSERT INTO Departments VALUES (40, 'Finance');
select * from Employees;