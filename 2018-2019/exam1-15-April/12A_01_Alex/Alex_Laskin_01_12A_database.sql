DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

CREATE TABLE user(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    number_of_total_views INTEGER
);
CREATE TABLE channel(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    user_id INTEGER NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE video(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    channel_id INTEGER NOT NULL,
    views INTEGER NOT NULL DEFAULT 0,
    
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);


DELIMITER //
CREATE TRIGGER video_insert AFTER INSERT ON video
FOR EACH ROW
BEGIN
	UPDATE user u SET number_of_total_views = (SELECT SUM(views) FROM video WHERE channel_id = NEW.channel_id)
    WHERE u.id = (SELECT c.user_id FROM channel c WHERE c.id = NEW.channel_id);  
END//

CREATE TRIGGER video_update AFTER UPDATE ON video
FOR EACH ROW
BEGIN
	UPDATE user u SET number_of_total_views = (SELECT SUM(views) FROM video WHERE channel_id = NEW.channel_id)
    WHERE u.id = (SELECT c.user_id FROM channel c WHERE c.id = NEW.channel_id); 
    
 	UPDATE user u SET number_of_total_views = (SELECT SUM(views) FROM video WHERE channel_id = O.channel_id)
     WHERE u.id = (SELECT c.user_id FROM channel c WHERE c.id = OLD.channel_id); 
END//

CREATE TRIGGER video_delete AFTER DELETE ON video
FOR EACH ROW
BEGIN
	UPDATE user u SET number_of_total_views = (SELECT SUM(views) FROM video WHERE channel_id = OLD.channel_id)
    WHERE u.id = (SELECT c.user_id FROM channel c WHERE c.id = OLD.channel_id);  
END//
DELIMITER ;

