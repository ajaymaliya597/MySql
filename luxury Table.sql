create database caars;
use caars;
CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    Brand VARCHAR(50) UNIQUE,
    Country VARCHAR(50)
);
INSERT INTO Company VALUES
(1, 'BMW', 'Germany'),
(2, 'Audi', 'Germany'),
(3, 'Mercedes', 'Germany'),
(4, 'Tesla', 'USA'),
(5, 'Ferrari', 'Italy');
CREATE TABLE LuxuryCars (
    CarID INT PRIMARY KEY,
    Brand VARCHAR(50),
    Model VARCHAR(50),
    PriceInLakhs DECIMAL(10,2),
    FuelType VARCHAR(20),

    CONSTRAINT uq_brand_model UNIQUE (Brand, Model),

    CONSTRAINT fk_brand
    FOREIGN KEY (Brand)
    REFERENCES Company(Brand)
);
INSERT INTO LuxuryCars VALUES
(101, 'BMW', 'X5', 98.50, 'Petrol'),
(102, 'BMW', 'XM', 210.00, 'Hybrid'),
(103, 'Audi', 'Q7', 95.00, 'Petrol'),
(104, 'Mercedes', 'S-Class', 180.00, 'Diesel'),
(105, 'Tesla', 'Model S', 150.00, 'Electric'),
(106, 'Ferrari', 'Roma', 380.00, 'Petrol');
CREATE TABLE CarFeatures (
    FeatureID INT PRIMARY KEY,
    CarID INT,
    Feature VARCHAR(50),

    CONSTRAINT fk_car
    FOREIGN KEY (CarID)
    REFERENCES LuxuryCars(CarID)
);
INSERT INTO CarFeatures VALUES
(1, 101, 'Sunroof'),
(2, 101, 'GPS'),
(3, 101, 'ABS'),
(4, 103, 'Ventilated Seats'),
(5, 104, 'Massage Seats'),
(6, 105, 'Autopilot');
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Phone VARCHAR(20) UNIQUE,
    City VARCHAR(50)
);
INSERT INTO Customers VALUES
(1, 'Ajay', '9876543210', 'Jaipur'),
(2, 'Ravi', '9876543211', 'Delhi'),
(3, 'Aman', '9876543212', 'Mumbai');
CREATE TABLE Orders (
    CustomerID INT,
    CarID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),

    PRIMARY KEY (CustomerID, CarID),

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID),

    FOREIGN KEY (CarID)
    REFERENCES LuxuryCars(CarID)
);
INSERT INTO Orders VALUES
(1, 101, '2026-05-01', 98.50),
(1, 103, '2026-05-03', 95.00),
(2, 105, '2026-05-04', 150.00),
(3, 104, '2026-05-05', 180.00);

SELECT *
FROM LuxuryCars
WHERE CarID = 103;







