DROP TABLE IF EXISTS User_Group;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS User_Group_Room;

CREATE TABLE User_Group
(
User_ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
User_Name VARCHAR(30),
Group_Name VARCHAR(30)
);

INSERT INTO User_Group
VALUES 
(0, 'Modesto', 'I.T.'),
(0, 'Ayine', 'I.T.'),
(0, 'Christopher', 'Sales'),
(0, 'Cheng Woo', 'Sales'),
(0, 'Saulat', 'Admin'),
(0, 'Heidy', NULL),
(0, NULL, 'Operations');

CREATE TABLE Room
(
Room_ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
Room_Name VARCHAR(30) NOT NULL
);

INSERT INTO Room
VALUES 
(0, '101'),
(0, '102'),
(0, 'Auditorium A'),
(0, 'Auditorium B');

CREATE TABLE User_Group_Room
(
User_Group_Room_ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
User_Group VARCHAR(30) REFERENCES User_Group(Group_Name),
Room_Name VARCHAR(30) REFERENCES Room(Room_Name)
);

INSERT INTO User_Group_Room
VALUES 
(0, 'I.T.', '101'),
(0, 'I.T.', '102'),
(0, 'Sales', '102'),
(0, 'Sales', 'Auditorium A'),
(0, 'Admin', NULL),
(0, NULL, 'Auditorium B');

# Q1

SELECT
User_Group,
Room_Name
FROM User_Group_Room;

# Q2

SELECT
Room_Name,
User_Group
FROM User_Group_Room;

# Q3

SELECT
u.User_Name,
ugr.User_Group,
ugr.Room_Name
FROM User_Group u
LEFT JOIN User_Group_Room ugr
ON u.Group_Name = ugr.User_Group
ORDER BY u.User_Name, ugr.User_Group, ugr.Room_Name;	