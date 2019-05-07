drop database if exists tumblr;
create database tumblr;
use tumblr;

create table Blog(
	id int auto_increment primary key,
    name varchar(200) not null,
    number_of_likes int default 0
);

create table BlogPost(
	id int auto_increment primary key,
    name varchar(200) not null,
    blog_id int,
    
    foreign key (blog_id) references Blog(id)
);

create table User(
	id int auto_increment primary key,
    name varchar(200) not null
);

create table Likes(
	id int auto_increment primary key,
    user_id int,
    blog_post_id int,
    
    foreign key (blog_post_id) references BlogPost(id),
    foreign key (user_id) references User(id)
);
