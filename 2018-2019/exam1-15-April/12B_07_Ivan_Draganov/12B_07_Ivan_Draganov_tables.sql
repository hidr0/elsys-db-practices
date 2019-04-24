DROP DATABASE IF EXISTS Test;
CREATE DATABASE Test;
USE Test;

CREATE TABLE House(
    houseid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    housename VARCHAR(255) NOT NULL,
    house_number_of_wins INT NOT NULL DEFAULT 0
);

CREATE TABLE Person(
	personid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    personname VARCHAR(255) NOT NULL,
    personHouseId INT NOT NULL,
    
    FOREIGN KEY (personHouseId) REFERENCES House(houseid)
);

CREATE TABLE Battle(
	battleid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    battleWinnerid INT NOT NULL,
    battleLoserid INT NOT NULL,
    
    FOREIGN KEY (battleWinnerid) REFERENCES Person(personid),
    FOREIGN KEY (battleLoserid) REFERENCES Person(personid)
);
