#USE buildingenergy;

DROP TABLE IF EXISTS EnergyCategories;
DROP TABLE IF EXISTS EnergyTypes;
DROP TABLE IF EXISTS Buildings;

CREATE TABLE EnergyCategories
(
catID INT PRIMARY KEY NOT NULL,
energy_cat VARCHAR(30)
);

INSERT INTO EnergyCategories
VALUES 
(1, 'Fossil'),
(2, 'Renewable');

CREATE TABLE EnergyTypes
(
typeID INT PRIMARY KEY NOT NULL,
energy_type VARCHAR(30),
energy_catID INT
);

INSERT INTO EnergyTypes
VALUES 
(1, 'Electricity', 1),
(2, 'Gas', 1),
(3, 'Steam', 1),
(4, 'Fuel Oil', 1),
(5, 'Solar', 2),
(6, 'Wind', 2),
(7, 'Geothermal', 2);

SELECT
ec.energy_cat,
et.energy_type
ec
FROM EnergyCategories ec
LEFT JOIN EnergyTypes et
ON ec.catID = et.energy_catID
ORDER BY et.energy_type;

CREATE TABLE Buildings
(
buildingID INT PRIMARY KEY NOT NULL,
building_name VARCHAR(60),
typeID INT REFERENCES EnergyTypes(typeID)
);

INSERT INTO Buildings
VALUES
(1, 'Empire State Building', 1),
(2, 'Empire State Building', 2),
(3, 'Empire State Building', 3),
(4, 'Chrysler Building', 1),
(5, 'Chrysler Building', 3), 
(6, 'Borough of Manhattan Community College', 1),
(7, 'Borough of Manhattan Community College', 3),
(8, 'Borough of Manhattan Community College', 5),
(9, 'Bronx Lion House', 7),
(10, 'Brooklyn Childrens Museum', 1),
(11, 'Brooklyn Childrens Museum', 7);

SELECT
b.building_name,
et.energy_type
FROM Buildings b
LEFT JOIN EnergyTypes et
ON b.typeID = et.typeID
ORDER BY b.building_name;

SELECT
b.building_name,
et.energy_type,
ec.energy_cat
FROM Buildings b
LEFT JOIN EnergyTypes et
ON b.typeID = et.typeID
LEFT JOIN EnergyCategories ec
ON ec.catID = et.energy_catID 
WHERE ec.energy_cat = 'Renewable'
ORDER BY b.building_name;

SELECT
DISTINCT et.energy_type,
COUNT(et.energy_type)
FROM Buildings b
LEFT JOIN EnergyTypes et
ON b.typeID = et.typeID
GROUP BY et.energy_type
ORDER BY COUNT(et.energy_type) DESC;