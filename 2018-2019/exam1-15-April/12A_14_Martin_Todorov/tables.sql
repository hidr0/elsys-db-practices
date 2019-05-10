DROP DATABASE IF EXISTS Youtube;
CREATE DATABASE Youtube;
USE Youtube;

CREATE TABLE User(
	id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    number_of_total_views INTEGER
);

CREATE TABLE Channel(
	id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE Video(
	id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    channel_id INTEGER NOT NULL,
    views INTEGER,
    FOREIGN KEY (channel_id) REFERENCES Channel(id)
);