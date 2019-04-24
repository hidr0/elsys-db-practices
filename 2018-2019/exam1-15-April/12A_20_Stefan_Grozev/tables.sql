DROP DATABASE IF EXISTS School;
CREATE DATABASE School;
USE School;

CREATE TABLE House(
	id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(300),
    number_of_wins INTEGER DEFAULT 0,
    PRIMARY KEY(id)
);

CREATE TABLE Person(
	id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(300),
    house_id INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY (house_id) REFERENCES House(id)
);

CREATE TABLE Battle(
	id INTEGER NOT NULL AUTO_INCREMENT,
    winner_id INTEGER,
    loser_id INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (winner_id) REFERENCES Person(id),
    FOREIGN KEY (loser_id) REFERENCES Person(id)
);