DROP DATABASE IF EXISTS game_of_thrones;
CREATE DATABASE game_of_thrones;

USE game_of_thrones; 

CREATE TABLE Houses (
	id INTEGER AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    number_of_wins INTEGER DEFAULT 0,
    
    PRIMARY KEY(id)
);

CREATE TABLE Persons (
	id INTEGER AUTO_INCREMENT NOT NULL, 
    name VARCHAR(50) NOT NULL,
    house_id INTEGER NOT NULL,
    
    PRIMARY KEY(id),
    FOREIGN KEY(house_id) REFERENCES Houses(id)
);

CREATE TABLE Battles (
	id INTEGER AUTO_INCREMENT NOT NULL, 
    winner_id INTEGER NOT NULL,
    loser_id INTEGER NOT NULL,
    
    PRIMARY KEY(id),
    FOREIGN KEY(winner_id) REFERENCES Persons(id),
    FOREIGN KEY(loser_id) REFERENCES Persons(id)
);

CREATE TABLE PersonBattles (
	id INTEGER AUTO_INCREMENT NOT NULL, 
    person_id INTEGER NOT NULL,
    battle_id INTEGER NOT NULL,
    
    PRIMARY KEY(id),
    FOREIGN KEY(person_id) REFERENCES Persons(id),
    FOREIGN KEY(battle_id) REFERENCES Battles(id)
);