DROP DATABASE IF EXISTS instagram_db;
CREATE DATABASE instagram_db;
USE instagram_db;

CREATE TABLE User (
	id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE, 
    number_of_likes_on_own_posts int default 0
);

CREATE TABLE POST(
	id INTEGER AUTO_INCREMENT NOT NULL,
	name VARCHAR(100) not null,
    user_id int,
    
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES User(id)
);

CREATE TABLE Likes (
	id INTEGER AUTO_INCREMENT NOT NULL,
	user_id int,
    post_id int,
    
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES User(id),
    FOREIGN KEY(post_id) REFERENCES Post(id)
);