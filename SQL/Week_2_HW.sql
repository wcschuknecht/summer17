
DROP TABLE Reviewers;
DROP TABLE videos;
CREATE TABLE Videos(ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL, title text, length_sec INT, URL text);

INSERT INTO Videos values(0,'MySQL Tutorial for Beginners', '612','https://www.youtube.com/watch?v=JcRvy-4rf1Y');
INSERT INTO Videos values(0,'MySQL 1 - Intro to MySQL', '793','https://www.youtube.com/watch?v=UGu9unCW4PA');
INSERT INTO Videos values(0,'MySQL Database Tutorial - 1 - Introduction to Databases', '451','https://www.youtube.com/watch?v=KgiCxe-ZW8o');

SELECT * FROM videos;

CREATE TABLE Reviewers(name text, ID INT, rating INT, review text);

INSERT INTO Reviewers values('Steve', 1, 5, 'I love MySQL');
INSERT INTO Reviewers values('Josh', 1, 5, 'Dope!');
INSERT INTO Reviewers values('Jared', 3, 1, 'Hated it :(');
INSERT INTO Reviewers values('Mariya', 3, 3, 'Meh. It was whatever.');

SELECT * FROM Reviewers;

SELECT *
FROM Videos
LEFT JOIN Reviewers
ON Videos.ID = Reviewers.ID;

#DROP TABLE REVIEWERS;