DROP TABLE IF EXISTS Users;
DROP Table IF EXISTS User_Groups;
DROP TABLE IF EXISTS Rooms;

CREATE TABLE Users (User_ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL, User_Name VARCHAR(30) NOT NULL);

INSERT INTO Users (User_ID, User_Name) VALUES (0, 'Modesto');
INSERT INTO Users (User_ID, User_Name) VALUES (0, 'Ayine');
INSERT INTO Users (User_ID, User_Name) VALUES (0, 'Christopher');
INSERT INTO Users (User_ID, User_Name) VALUES (0, 'Cheng Woo');
INSERT INTO Users (User_ID, User_Name) VALUES (0, 'Saulat');
INSERT INTO Users (User_ID, User_Name) VALUES (0, 'Heidy');

# SELECT * FROM Users;

CREATE TABLE User_Groups (Group_ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL, Group_Name VARCHAR(30) NOT NULL, User_ID INT NULL REFERENCES Users);

INSERT INTO User_Groups (Group_ID, Group_Name, User_ID) VALUES (0, 'I.T', 1);
INSERT INTO User_Groups (Group_ID, Group_Name, User_ID) VALUES (0, 'I.T', 2); 
INSERT INTO User_Groups (Group_ID, Group_Name, User_ID) VALUES (0, 'Sales', 3); 
INSERT INTO User_Groups (Group_ID, Group_Name, User_ID) VALUES (0, 'Sales', 4); 
INSERT INTO User_Groups (Group_ID, Group_Name, User_ID) VALUES (0, 'Administration', 5); 
INSERT INTO User_Groups (Group_ID, Group_Name, User_ID) VALUES (0, 'Operations', NULL);

SELECT * FROM User_Groups;

CREATE TABLE Rooms (Room_ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL, Room_Name VARCHAR(30) NOT NULL, Group_ID INT NULL REFERENCES User_Groups);

INSERT INTO Rooms (Room_ID, Room_Name, Group_ID) VALUES (0, '101', 1);
INSERT INTO Rooms (Room_ID, Room_Name, Group_ID) VALUES (0, '102', 2);
INSERT INTO Rooms (Room_ID, Room_Name, Group_ID) VALUES (0, '102', 3);
INSERT INTO Rooms (Room_ID, Room_Name, Group_ID) VALUES (0, 'Auditorium A', 4);
INSERT INTO Rooms (Room_ID, Room_Name, Group_ID) VALUES (0, 'Auditorium B', NULL);

SELECT * FROM User_Groups;

SELECT
g.Group_ID,
g.Group_Name,
u.User_ID,
u.User_Name
FROM Users u
RIGHT JOIN User_Groups g
ON u.User_ID = g.User_ID;

SELECT
r.Room_ID,
r.Room_Name,
g.Group_ID,
g.Group_Name
FROM User_Groups g
RIGHT JOIN Rooms r
ON r.Group_ID = g.Group_ID;

SELECT
u.User_ID,
u.User_Name,
g.Group_Name,
r.Room_Name
FROM Users u
LEFT JOIN User_Groups g
ON u.User_ID = g.User_ID
LEFT JOIN Rooms r
ON g.Group_ID = r.Group_ID
ORDER BY u.User_Name, g.Group_Name, r.Room_Name;