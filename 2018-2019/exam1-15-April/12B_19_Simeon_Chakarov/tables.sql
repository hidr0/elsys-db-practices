DROP DATABASE IF EXISTS Game_Of_Thrones;
CREATE DATABASE Game_Of_Thrones;
USE Game_Of_Thrones;

CREATE TABLE House(
	House_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    House_Name VARCHAR(255) NOT NULL,
    House_Number_Of_Wins INT NOT NULL DEFAULT 0
);

CREATE TABLE Person(
	Person_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Person_Name VARCHAR(255) NOT NULL,
    Person_HouseId INT NOT NULL,
    
    FOREIGN KEY (Person_HouseId) REFERENCES House(House_Id)
);

CREATE TABLE Battle(
	Battle_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Battle_Winner_Id INT NOT NULL,
    Battle_Loser_Id INT NOT NULL,
    
    FOREIGN KEY (Battle_Winner_Id) REFERENCES Person(Person_Id),
    FOREIGN KEY (Battle_Loser_Id) REFERENCES Person(Person_Id)
);
