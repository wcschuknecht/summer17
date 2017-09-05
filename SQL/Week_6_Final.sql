DROP SCHEMA IF EXISTS buildingenergy;

CREATE SCHEMA IF NOT EXISTS buildingenergy;

USE buildingenergy;

# Create EnergyCategories table and insert data

CREATE TABLE EnergyCategories
	(
	catID INT NOT NULL,
	energy_cat VARCHAR(30),
	PRIMARY KEY (catID)
);

INSERT INTO EnergyCategories
VALUES 
(1, 'Fossil'),
(2, 'Renewable');

# Create EnergyTypes table and insert data

CREATE TABLE EnergyTypes
	(
	typeID INT NOT NULL,
	energy_type VARCHAR(30),
	energy_catID INT,
    PRIMARY KEY (typeID),
    FOREIGN KEY (energy_catID) 
		REFERENCES Energycategories(catID)
		ON DELETE SET NULL
        ON UPDATE CASCADE
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

# JOIN statement showing energy categories and associated energy types // Result 10

SELECT
ec.energy_cat,
et.energy_type
ec
FROM EnergyCategories ec
LEFT JOIN EnergyTypes et
ON ec.catID = et.energy_catID
ORDER BY et.energy_type;

# Create Buildings table and insert data

CREATE TABLE Buildings
	(
	buildingID INT NOT NULL,
	building_name VARCHAR(60),
	PRIMARY KEY (buildingID)
	);

INSERT INTO Buildings
	VALUES
	(1, 'Empire State Building'),
	(2, 'Chrysler Building'),
	(3, 'Borough of Manhattan Community College'),
	(4, 'Bronx Lion House'),
	(5, 'Brooklyn Childrens Museum');

# Create Building and EnergyTypes bridge table and inset data

CREATE TABLE Buildings_EnergyTypes
	(
	BuildingID INT,
	FOREIGN KEY (BuildingID) 
		REFERENCES Buildings(buildingID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	EnergyTypeID INT,
	FOREIGN KEY (EnergyTypeID) 
		REFERENCES EnergyTypes(typeID)
        ON DELETE CASCADE
        ON UPDATE CASCADE  
	);

INSERT INTO Buildings_EnergyTypes
	VALUES 
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 3), 
	(3, 1),
	(3, 3),
	(3, 5),
	(4, 7),
	(5, 1),
	(5, 7);

# JOIN statement showing buldings and associated energy types // Result 11

SELECT
b.building_name,
et.energy_type
FROM Buildings b
LEFT JOIN Buildings_EnergyTypes bet ON b.buildingID = bet.BuildingID
LEFT JOIN EnergyTypes et ON bet.EnergyTypeID = et.typeID
ORDER BY b.building_name;

# JOIN statement displaying all buildings using renewable energy // Result 12

SELECT
b.building_name,
et.energy_type,
ec.energy_cat
FROM Buildings b
LEFT JOIN Buildings_EnergyTypes bet ON b.buildingID = bet.BuildingID
LEFT JOIN EnergyTypes et ON bet.EnergyTypeID = et.typeID
LEFT JOIN EnergyCategories ec ON et.energy_catID = ec.catID
WHERE ec.energy_cat = 'Renewable'
ORDER BY b.building_name;

# JOIN statement showing frequency count of Energy Type // Result 13

SELECT
DISTINCT et.energy_type,
COUNT(et.energy_type)
FROM Buildings b
LEFT JOIN Buildings_EnergyTypes bet ON b.buildingID = bet.BuildingID
LEFT JOIN EnergyTypes et ON bet.EnergyTypeID = et.typeID
GROUP BY et.energy_type
ORDER BY COUNT(et.energy_type) DESC;