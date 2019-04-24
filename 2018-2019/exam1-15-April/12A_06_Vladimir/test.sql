DROP DATABASE IF EXISTS got;
CREATE DATABASE got;
USE got;

CREATE TABLE House(
	H_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    H_Name VARCHAR(255) NOT NULL,
    H_Number_Of_Wins INT NOT NULL DEFAULT 0
);

CREATE TABLE Person(
	P_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    P_Name VARCHAR(255) NOT NULL,
    P_HouseId INT NOT NULL,
    
    FOREIGN KEY (P_HouseId) REFERENCES House(H_Id)
);

CREATE TABLE Battle(
	B_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    B_Winner_Id INT NOT NULL,
    B_Loser_Id INT NOT NULL,
    
    FOREIGN KEY (B_Winner_Id) REFERENCES Person(P_Id),
    FOREIGN KEY (B_Loser_Id) REFERENCES Person(P_Id)
);

INSERT INTO House(H_Name) VALUES('Tuesari');
INSERT INTO House(H_Name) VALUES('NPMGeici');
INSERT INTO House(H_Name) VALUES('JonAtanasofci');

INSERT INTO Person(P_Name, P_HouseId) VALUES('Vlado', 1);
INSERT INTO Person(P_Name, P_HouseId) VALUES('Ne-Vlado', 1);

INSERT INTO Person(P_Name, P_HouseId) VALUES('Gosho', 2);
INSERT INTO Person(P_Name, P_HouseId) VALUES('Pesho', 2);

INSERT INTO Person(P_Name, P_HouseId) VALUES('Kalimanjarof', 3);
INSERT INTO Person(P_Name, P_HouseId) VALUES('Onq', 3);


DELIMITER $
CREATE TRIGGER battle_insert AFTER INSERT ON Battle 
FOR EACH ROW
BEGIN
	UPDATE House
	SET H_Number_Of_Wins = H_Number_Of_Wins +1
    WHERE H_Id = NEW.B_Winner_Id;
END;$

CREATE TRIGGER battle_delete AFTER DELETE ON Battle
FOR EACH ROW
BEGIN
	UPDATE House
    SET H_Number_Of_Wins = H_Number_Of_Wins -1
    WHERE H_Id = OLD.B_Winner_Id;
END;$

CREATE TRIGGER battle_update AFTER UPDATE ON Battle
FOR EACH ROW
BEGIN
	UPDATE House
	SET H_Number_Of_Wins = H_Number_Of_Wins -1
    WHERE H_Id = OLD.B_Winner_Id;
    
    UPDATE House
    SET H_Number_Of_Wins = H_Number_Of_Wins +1
    WHERE H_Id = NEW.B_Winner_Id;
    
END;$
DELIMITER ;

INSERT INTO Battle(B_Winner_Id, B_Loser_Id) VALUES (1, 3);
INSERT INTO Battle(B_Winner_Id, B_Loser_Id) VALUES (2, 5);
INSERT INTO Battle(B_Winner_Id, B_Loser_Id) VALUES (4, 6);

SELECT P_Name AS 'Name of winner'
FROM Person p
RIGHT JOIN Battle b
ON b.B_Winner_Id = p.P_Id;

SELECT H_Name AS 'Name of House'
FROM Person p
RIGHT JOIN Battle b
ON b.B_Loser_Id = p.P_Id
LEFT JOIN House h
ON h.H_Id = p.P_HouseId
GROUP BY H_Name;