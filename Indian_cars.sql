create database indian_cars;
use indian_cars;
CREATE TABLE cars (
    car_id INT PRIMARY KEY,
    brand VARCHAR(30),
    model VARCHAR(30),
    fuel_type VARCHAR(20),
    transmission VARCHAR(20),
    torque_nm INT,
    price_lakh DECIMAL(5,2),
    mileage INT,
    seating_capacity INT,
    city VARCHAR(30)
);
INSERT INTO cars VALUES
(1,'Tata','Nexon','Diesel','Manual',260,12.50,24,5,'Jaipur'),
(2,'Mahindra','Scorpio N','Diesel','Automatic',400,22.00,18,7,'Delhi'),
(3,'Hyundai','Creta','Petrol','Manual',144,15.20,17,5,'Mumbai'),
(4,'Maruti','Swift','Petrol','Manual',113,8.20,25,5,'Jaipur'),
(5,'Toyota','Fortuner','Diesel','Automatic',500,42.00,14,7,'Delhi'),
(6,'Kia','Seltos','Diesel','Manual',250,18.00,20,5,'Pune'),
(7,'Honda','City','Petrol','CVT',145,14.50,18,5,'Mumbai'),
(8,'Mahindra','Thar','Diesel','Manual',300,17.00,15,4,'Jaipur'),
(9,'Tata','Harrier','Diesel','Automatic',350,24.00,16,5,'Delhi'),
(10,'Maruti','Baleno','Petrol','AMT',113,9.00,23,5,'Pune');

select * from cars;

select car_id, brand, model, fuel_type, transmission, torque_nm, price_lakh, city from cars
where torque_nm > 200;

select car_id, brand, model, fuel_type, transmission, torque_nm, price_lakh, city from cars
where fuel_type = 'Diesel';

select car_id,mileage, brand, model, fuel_type, transmission, torque_nm, price_lakh, city from cars
where city = 'jaipur' and mileage > 20 ;

select brand,max(torque_nm),model from cars
 group by brand,model;
 
select brand , avg(torque_nm) as t from cars
group by brand
having t > 200;

select brand , avg(torque_nm) as t from cars
group by brand
having t > 200;

use indian_cars;

select city,max(torque_nm) as t from cars
group by city
having t > 300 ;


 
