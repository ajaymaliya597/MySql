create database luxury_cars_showroom;

use luxury_cars_showroom;
use 
show tables;

create table luxury_cars (
car_id int primary key,
brand varchar(50),
model varchar(50),
price_lakh decimal(10,2),
fuel_type varchar(50),
torque_nm int,
launch_year int 
);
alter table luxury_cars
change horsepower torque_nm int;
select * from luxury_cars;
INSERT INTO luxury_cars
(car_id, brand, model, price_lakh, fuel_type, torque_nm, launch_year)
VALUES
(1, 'BMW', 'X5', 95.50, 'Diesel', 700, 2024),
(2, 'BMW', 'M4', 153.00, 'Petrol', 650, 2023),
(3, 'Mercedes', 'C-Class', 72.00, 'Petrol', 400, 2024),
(4, 'Mercedes', 'G-Wagon', 255.00, 'Petrol', 850, 2025),
(5, 'Audi', 'A6', 68.00, 'Petrol', 370, 2023),
(6, 'Audi', 'Q8', 118.00, 'Petrol', 500, 2024),
(7, 'Tesla', 'Model S', 150.00, 'EV', 1420, 2025),
(8, 'Tesla', 'Model X', 165.00, 'EV', 1400, 2024),
(9, 'Porsche', '911 Turbo', 210.00, 'Petrol', 750, 2025),
(10, 'Porsche', 'Cayenne', 145.00, 'Petrol', 600, 2024),

(11, 'Lamborghini', 'Huracan', 350.00, 'Petrol', 600, 2025),
(12, 'Lamborghini', 'Urus', 420.00, 'Petrol', 850, 2024),
(13, 'Ferrari', 'Roma', 390.00, 'Petrol', 760, 2023),
(14, 'Ferrari', 'SF90', 750.00, 'Hybrid', 900, 2025),
(15, 'Rolls Royce', 'Phantom', 950.00, 'Petrol', 900, 2024),
(16, 'Rolls Royce', 'Cullinan', 820.00, 'Petrol', 850, 2025),
(17, 'Bentley', 'Continental GT', 520.00, 'Petrol', 900, 2024),
(18, 'Bentley', 'Bentayga', 450.00, 'Petrol', 770, 2023),
(19, 'Jaguar', 'F-Pace', 82.00, 'Diesel', 650, 2024),
(20, 'Jaguar', 'I-Pace', 125.00, 'EV', 696, 2025),

(21, 'Land Rover', 'Defender', 110.00, 'Diesel', 625, 2024),
(22, 'Land Rover', 'Range Rover', 280.00, 'Petrol', 750, 2025),
(23, 'Maserati', 'Levante', 170.00, 'Petrol', 580, 2023),
(24, 'Maserati', 'Ghibli', 155.00, 'Petrol', 500, 2024),
(25, 'Aston Martin', 'DBX', 320.00, 'Petrol', 700, 2025),
(26, 'Aston Martin', 'Vantage', 290.00, 'Petrol', 685, 2024),
(27, 'McLaren', '720S', 480.00, 'Petrol', 770, 2025),
(28, 'Bugatti', 'Chiron', 3200.00, 'Petrol', 1600, 2025),
(29, 'Volvo', 'XC90', 98.00, 'Hybrid', 709, 2024),
(30, 'Lexus', 'LX500d', 150.00, 'Diesel', 700, 2025);

select * from luxury_cars ;

