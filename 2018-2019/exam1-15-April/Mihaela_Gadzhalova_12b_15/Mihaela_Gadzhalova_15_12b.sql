DROP DATABASE IF EXISTS game;
CREATE DATABASE game;
USE game;

CREATE TABLE House (
	Id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(150) NOT NULL,
    Number_of_wins INTEGER DEFAULT 0
);

CREATE TABLE Person (
	Id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    House_id INTEGER NOT NULL,
    
    FOREIGN KEY(House_id) REFERENCES House(Id)
);

CREATE TABLE Battle (
	Id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Winner_id INTEGER NOT NULL,
    Loser_id INTEGER NOT NULL,
    
    FOREIGN KEY(Winner_id) REFERENCES Person(Id),
    FOREIGN KEY(Loser_id) REFERENCES Person(Id)
);

INSERT INTO House (Name, Number_of_wins) VALUES ('dvustaen', 0),
	('tristaen', 0),
    ('maze', 0);
    
INSERT INTO Person (Name, House_id) VALUES ('Sasho', 1),
	('Toni', 2),
    ('Bibi', 3),
    ('Valio', 2),
    ('Vladi', 3),
    ('Dani', 1);
    
INSERT INTO Battle (Winner_id, Loser_id) VALUES (3,4),
	(5,6),
    (1,2);
 
delimiter //
CREATE TRIGGER Create_Update_Wins after insert on Battle for each row
begin
	update House h set h.Number_of_wins = h.Number_of_win = 1 where h.Id = new.Winner_id;
end//

CREATE TRIGGER Update_Update_Wins after update on Battle for each row
begin
	update House h set h.Number_of_wins = h.Number_of_wins + 1 where h.Id = new.Winner_id;
    update House h set h.Number_of_wins = h.Number_of_wins - 1 where h.Id = old.Winner_id;
end//

CREATE TRIGGER Delete_Update_Wins after delete on Battle for each row
begin
    update House h set h.Number_of_wins = h.Number_of_wins - 1 where h.Id = old.Winner_id;
end//
delimiter ;
 
#1
SELECT p.Name AS 'Name of winner'
FROM Person p
RIGHT JOIN Battle b
ON p.Id = b.Winner_id;

#2
SELECT h.Name AS 'Name of house'
FROM Person p
RIGHT JOIN Battle b
ON p.Id = b.Loser_id
LEFT JOIN House h
ON h.Id = p.House_id;

#3
SELECT p.Name as 'Name of winner'
FROM Battle b
LEFT JOIN Person p
ON b.Winner_id = p.Id
-- 
-- LEFT JOIN Person p
-- ON b.Loser_id = p.Id

