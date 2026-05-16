use luxury_cars_showroom;
CREATE TABLE employ (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);
INSERT INTO employ
(emp_id, emp_name, manager_id)
VALUES
(1, 'Ajay', NULL),
(2, 'Rohit', 1),
(3, 'Sneha', 1),
(4, 'Karan', 2),
(5, 'Priya', 2);
CREATE TABLE car_owner (
    owner_id INT PRIMARY KEY,
    owner_name VARCHAR(50),
    car_id INT,
    city VARCHAR(50),
    purchase_year INT,
    FOREIGN KEY (car_id) REFERENCES luxury_cars(car_id) # ese apn do tables ko connect 
    #kar kar primary key or foriegn key se connect karte hai
);

INSERT INTO car_owner
(owner_id, owner_name, car_id, city, purchase_year)
VALUES
(1, 'Ajay Maliya', 1, 'Jaipur', 2024),
(2, 'Rohit Mehta', 4, 'Delhi', 2025),
(3, 'Priya Singh', 7, 'Mumbai', 2025),
(4, 'Karan Verma', 10, 'Pune', 2024),
(5, 'Sneha Kapoor', 15, 'Bangalore', 2025),
(6, 'Amit Jain', 3, 'Chandigarh', 2024),
(7, 'Vikas Yadav', 8, 'Hyderabad', 2024),
(8, 'Neha Gupta', 20, 'Ahmedabad', 2025),
(9, 'Rahul Khanna', 12, 'Delhi', 2024),
(10, 'Simran Kaur', 5, 'Jaipur', 2023),
(11, 'Arjun Malhotra', 18, 'Mumbai', 2023),
(12, 'Pooja Saini', 25, 'Pune', 2025),
(13, 'Manish Arora', 30, 'Delhi', 2025),
(14, 'Riya Bansal', 22, 'Bangalore', 2025),
(15, 'Tarun Joshi', 9, 'Jaipur', 2025);

SELECT * FROM luxury_cars;
SELECT * FROM car_owner;
#Q1
select car_owner.owner_name, car_owner.city,luxury_cars.brand,
luxury_cars.model from luxury_cars join car_owner 
on car_owner.car_id=luxury_cars.car_id;
#Q2
select luxury_cars.brand,luxury_cars.model, car_owner.owner_name
from luxury_cars left outer join car_owner 
on car_owner.car_id=luxury_cars.car_id;
#Q3
select car_owner.city,luxury_cars.brand
from luxury_cars cross join car_owner 
on car_owner.car_id=luxury_cars.car_id;
#Q4


SELECT e1.emp_name as Employee ,e2.emp_name as Manager FROM employ e1
join employ e2 
on 
e1.manager_id = e2.emp_id;

select * from employ;

SELECT * FROM luxury_cars;
SELECT * FROM employ;
SELECT * FROM car_owner;






