CREATE DATABASE dino_thunder;
USE dino_thunder;

CREATE TABLE rangers (
    ranger_id INT PRIMARY KEY,
    ranger_name VARCHAR(50),
    color VARCHAR(20)
);

CREATE TABLE dinosaurs (
    dino_id INT PRIMARY KEY,
    dino_name VARCHAR(50),
    ranger_id INT,
    FOREIGN KEY (ranger_id)
    REFERENCES rangers(ranger_id)
);

INSERT INTO rangers VALUES
(1,'Conner','Red'),
(2,'Ethan','Blue'),
(3,'Kira','Yellow');

INSERT INTO dinosaurs VALUES
(101,'T-Rex',1),
(102,'Triceratops',2),
(103,'Pterodactyl',3);

SELECT r.ranger_name, r.color, d.dino_name
FROM rangers r
JOIN dinosaurs d
ON r.ranger_id = d.ranger_id;