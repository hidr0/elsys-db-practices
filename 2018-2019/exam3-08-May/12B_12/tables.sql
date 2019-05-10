DROP DATABASE IF EXISTS db;
CREATE DATABASE db;
USE db;

create table User(
	id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    username varchar(30) not null,
    number_of_likes_on_own_posts integer not null
);

create table Post(
	id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name varchar(30) not null,
	user_id integer not null,
    
        
    FOREIGN KEY (user_id) REFERENCES User(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

create table Likes(
	id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_id integer not null,
    post_id integer not null,
    
    FOREIGN KEY (user_id) REFERENCES User(id)
    ON DELETE CASCADE
	ON UPDATE CASCADE,
	FOREIGN KEY (post_id) REFERENCES Post(id)
    ON DELETE CASCADE
	ON UPDATE CASCADE
);

