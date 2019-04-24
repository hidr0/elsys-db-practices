DROP DATABASE IF EXISTS YouTube;

CREATE DATABASE YouTube;

USE YouTube;

# Tables

CREATE TABLE User_(
	id INTEGER NOT NULL AUTO_INCREMENT,
	name_ VARCHAR(30) NOT NULL,
    username VARCHAR(100) UNIQUE NOT NULL,
    number_of_total_views INTEGER NOT NULL,
    
    PRIMARY KEY (id)
);

CREATE TABLE Channel_(
	id INTEGER NOT NULL AUTO_INCREMENT,
	name_ VARCHAR(100) NOT NULL,
    user_id INTEGER NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES User_(id)
);

CREATE TABLE Video(
	id INTEGER NOT NULL AUTO_INCREMENT,
    name_ VARCHAR(30) NOT NULL,
    channel_id INTEGER NOT NULL,
    views INTEGER NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (channel_id) REFERENCES Channel_(id)
);

# Views trigger

CREATE TRIGGER I_VideoViews BEFORE INSERT
ON Video
FOR EACH ROW
UPDATE User_ u
INNER JOIN Channel_ ch
ON ch.user_id = u.id
INNER JOIN Video v
ON v.channel_id = ch.id
SET u.number_of_total_views = u.number_of_total_views + NEW.views;


CREATE TRIGGER U_VideoViews BEFORE UPDATE
ON Video
FOR EACH ROW
UPDATE User_ u
INNER JOIN Channel_ ch
ON ch.user_id = u.id
INNER JOIN Video v
ON v.channel_id = ch.id
SET u.number_of_total_views = u.number_of_total_views + NEW.views;

CREATE TRIGGER D_VideoViews AFTER DELETE
ON Video
FOR EACH ROW
UPDATE User_ u
INNER JOIN Channel_ ch
ON ch.user_id = u.id
INNER JOIN Video v
ON v.channel_id = ch.id
SET u.number_of_total_views = u.number_of_total_views - OLD.views;


# 3 users

INSERT INTO
	User_(name_, username, number_of_total_views)
VALUES ('Felix', 'PewDiePie', 91);

INSERT INTO
	User_(name_, username, number_of_total_views)
VALUES ('Indians', 'T-Series', 90);

INSERT INTO
	User_(name_, username, number_of_total_views)
VALUES ('Americans', 'Good Mythical Morning', 50);

# Channel for each user

INSERT INTO Channel_(name_, user_id) VALUES ('Brofist', 1);
INSERT INTO Channel_(name_, user_id) VALUES ('Movies', 2);
INSERT INTO Channel_(name_, user_id) VALUES ('Reviews', 3);

# Videos in each channel

INSERT INTO
	Video(name_, channel_id, views)
VALUES ('24H LIVE STREAM', 1, 50);

INSERT INTO
	Video(name_, channel_id, views)
VALUES ('Newest Episode', 2, 10);

INSERT INTO
	Video(name_, channel_id, views)
VALUES ('Oh what a drama...', 2, 33);


# Queries

# Info for each video
SELECT v.name_ AS video_name, v.views, u.username, ch.name_ AS channel_name
FROM Video v
INNER JOIN Channel_ ch
ON ch.id = v.channel_id
INNER JOIN User_ u
ON ch.user_id = u.id;

# Channels that have at least 1 uploaded video
SELECT DISTINCT ch.name_ AS name_of_channel
FROM Channel_ ch
INNER JOIN Video v
ON ch.id = v.channel_id
GROUP BY name_of_channel;

# User that has videos in his channel
SELECT u.name_ AS name_of_user, u.username, u.number_of_total_views
FROM User_ u
INNER JOIN Channel_ ch
ON u.id = ch.user_id
INNER JOIN Video v
ON ch.id = v.channel_id
GROUP BY name_of_user, u.username, u.number_of_total_views
HAVING COUNT(v.id) != 0;