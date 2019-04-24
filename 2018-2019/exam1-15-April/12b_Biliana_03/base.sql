DROP DATABASE IF EXISTS Youtube;
CREATE DATABASE Youtube;

USE Youtube;

CREATE TABLE User(
	id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	name VARCHAR(50) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    number_of_total_views INTEGER DEFAULT 0
);


CREATE TABLE Channel(
	id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	c_name VARCHAR(50) NOT NULL,
    user_id INTEGER NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE Video(
	id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
	v_name VARCHAR(20) NOT NULL,
    channel_id INTEGER NOT NULL,
    views INTEGER NOT NULL DEFAULT 0,
	
    FOREIGN KEY (channel_id) REFERENCES Channel(id)
);

INSERT INTO User(id, name, username, number_of_total_views) VALUES(1, 'Toni', 'tonyut', 0),
	(2,'Ani', 'anna', 0),
    (3,'Mimi', 'mims5059', 0);


INSERT INTO Channel (id, c_name, user_id)VALUES(1,'Channel1', 1),
	(2,'Channel2', 2),
    (3,'Channel3', 3);

INSERT INTO Video (id, v_name, channel_id, views)VALUES(1, 'T', 1, 5),
	(2, 'A', 2, 8),
    (3, 'AA', 2, 1);




DELIMITER $
CREATE TRIGGER insert_t
AFTER INSERT ON User
FOR EACH ROW
BEGIN
	UPDATE User u SET u.number_of_total_views = (SELECT SUM(v.views) FROM Video v
		LEFT JOIN Channel c 
        ON v.id = c.id 
		LEFT JOIN User u 
        ON c.user_id = u.id
		GROUP BY u.id
    );
END$
    
CREATE TRIGGER delete_t AFTER DELETE ON User
FOR EACH ROW
BEGIN
	UPDATE User u SET u.number_of_total_views = (
		SELECT SUM(v.views) FROM Video v
		LEFT JOIN Channel c ON v.id = c.id 
		LEFT JOIN User u ON c.user_id = u.id
		GROUP BY u.id
    );
END$

CREATE TRIGGER update_t AFTER UPDATE ON User
FOR EACH ROW
BEGIN
	UPDATE User u SET u.number_of_total_views = (
		SELECT SUM(v.views) FROM Video v
		LEFT JOIN Channel c ON v.id = c.id 
		LEFT JOIN User u ON c.user_id = u.id
		GROUP BY u.id
    );
END$

DELIMITER ;

SELECT v.v_name AS 'Video Name', v.views AS 'Video Views', u.name as 'User name', c.c_name AS 'Channel name' 
FROM Video v
LEFT JOIN Channel c ON c.id = v.channel_id
INNER JOIN User u ON u.id = c.user_id;

SELECT c.c_name AS 'Name of channel' 
FROM Channel c
INNER JOIN Video v ON v.channel_id = c.id
GROUP BY c.c_name;

SELECT u.name AS 'Name of user', u.username AS 'Username', u.number_of_total_views AS 'numbre of views'
FROM User u
INNER JOIN Channel c ON c.user_id = u.id
INNER JOIN Video v ON v.channel_id = c.id
GROUP BY u.name, u.username, u.number_of_total_views;