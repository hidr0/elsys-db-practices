DROP DATABASE IF EXISTS tumblr;

CREATE DATABASE tumblr;

USE tumblr;

CREATE TABLE blog(
	id INTEGER AUTO_INCREMENT,
    name VARCHAR(20),
    number_of_likes INTEGER DEFAULT 0
);

CREATE TABLE blog_post(
	id INTEGER AUTO_INCREMENT,
    name VARCHAR(20),
    blog_id INTEGER,
    FOREIGN KEY(blog_id) REFERENCES blog(id)
);
CREATE TABLE user(
	id INTEGER AUTO_INCREMENT,
    name VARCHAR(20)
);

CREATE TABLE likes(
	id INTEGER AUTO_INCREMENT,
    user_id INTEGER,
    blog_post_id INTEGER,
    FOREIGN KEY(user_id) REFERENCES user(id),
    FOREIGN KEY(blog_post_id) REFERENCES blog_post(id)
);