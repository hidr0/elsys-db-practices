DROP DATABASE IF EXISTS Instagram;
CREATE DATABASE Instagram;
USE Instagram;

CREATE TABLE User(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    number_of_likes_on_own_post INT DEFAULT 0
);

CREATE TABLE Post(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES User(id)
);

CREATE TABLE Likes(
	id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    
    FOREIGN KEY(post_id) REFERENCES Post(id),
    FOREIGN KEY(user_id) REFERENCES User(id)
);