DROP TABLE IF EXISTS Personnel;

CREATE TABLE Personnel
(
EmployeeID INT PRIMARY KEY NOT NULL,
EmployeeName VARCHAR(30),
ManagerID INT,
JobTitle VARCHAR(30)
);

INSERT INTO Personnel
VALUES 
(1, 'Sam', 0, 'CEO'),
(2, 'John', 1, 'Director'),
(3, 'Anna', 2, 'Manager'),
(4, 'Will', 2, 'Manager'),
(5, 'Tom', 2, 'Manager'),
(6, 'Joann', 3, 'Associate');

SELECT 
Employees.EmployeeName AS 'Employee Name',
Managers.EmployeeName AS 'Manager Name',
Employees.JobTitle AS 'Employee Job Title'
FROM Personnel AS Employees
LEFT JOIN Personnel AS Managers
ON Employees.ManagerID = Managers.EmployeeID
ORDER BY Employees.EmployeeName;

