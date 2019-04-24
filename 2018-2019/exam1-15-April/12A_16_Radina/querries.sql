DROP DATABASE IF EXISTS radina_12a;
CREATE DATABASE radina_12a;
USE radina_12a;

CREATE TABLE user(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    username VARCHAR(30) NOT NULL UNIQUE,
    number_of_total_views INTEGER DEFAULT 0
);
CREATE TABLE channel(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    user_id INTEGER,
	FOREIGN KEY (user_id) REFERENCES user(id)
);
CREATE TABLE video(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    channel_id INTEGER,
    views INTEGER DEFAULT 0,
	FOREIGN KEY (channel_id) REFERENCES channel(id)
);

INSERT INTO user(username,name) VALUES('Radi','dnakjsd');
INSERT INTO user(username,name) VALUES('Radi1','dnakjsd');
INSERT INTO user(username,name) VALUES('Radi2','dnakjsd');

INSERT INTO channel(name,user_id) VALUES('channel1',1);
INSERT INTO channel(name,user_id) VALUES('channel2',2);
INSERT INTO channel(name,user_id) VALUES('channel3',3);

INSERT INTO video(name,channel_id,views) VALUES('video1',1,10);
INSERT INTO video(name,channel_id,views) VALUES('video2',2,90);
INSERT INTO video(name,channel_id,views) VALUES('video3',2,14);

CREATE TRIGGER update_INSERT_number_of_views
AFTER INSERT ON video
FOR EACH ROW
	UPDATE user AS u
    SET u.number_of_total_views = 
    (SELECT views FROM video v 
    LEFT JOIN channel c 
    on v.channel_id = c.id
    LEFT JOIN user us 
    on c.user_id = us.id
    )  WHERE NEW.Id = u.id;
    
CREATE TRIGGER update_number_of_views
AFTER UPDATE ON video
FOR EACH ROW
	UPDATE user AS u
    SET u.number_of_total_views = 
    (SELECT views FROM video v 
    LEFT JOIN channel c 
    on v.channel_id = c.id
    LEFT JOIN user us 
    on c.user_id = us.id
    )  WHERE NEW.Id = u.id;


CREATE TRIGGER update_DELETE_number_of_views
AFTER DELETE ON video
FOR EACH ROW
	UPDATE user AS u
    SET u.number_of_total_views = 
    (SELECT views FROM video v 
    LEFT JOIN channel c 
    on v.channel_id = c.id
    LEFT JOIN user us 
    on c.user_id = us.id
    )  WHERE OLD.Id = u.id;
    
SELECT *FROM user;
SELECT v.name as 'Video Name', v.views as'Video Views',u.username as'User name', c.name as'Channel name' FROM video v
LEFT JOIN channel c 
ON v.channel_id =c.id
LEFT JOIN user u
ON u.Id = c.user_id;

SELECT c.name as'Channel name' FROM channel c
LEFT JOIN video v 
ON v.channel_id =c.id
WHERE v.channel_id
GROUP BY  c.id;

SELECT u.name as'Name of user', u.username  as 'Username', u.number_of_total_views as 'number of views' FROM user u
LEFT JOIN channel c 
ON c.user_id =u.id
LEFT JOIN video v 
ON v.channel_id = c.id
WHERE v.channel_id
GROUP BY  u.id;





