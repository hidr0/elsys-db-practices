drop database if exists tumblr;

create database tumblr;

use tumblr;

create table blog(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	name varchar(100), 
    number_of_likes integer default 0
);

create table blogpost(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	name varchar(100), 
    blog_id integer,
    foreign key (blog_id) references blog(id)
);

create table user(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	name varchar(100)
);

create table likes(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	user_id integer, 
    blog_post_id integer,
    foreign key (user_id) references user(id),
    foreign key (blog_post_id) references blogpost(id)
);





