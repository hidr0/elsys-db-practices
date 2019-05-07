drop database if exists a;

create database a;
use a;

create table User (
	id int primary key not null auto_increment,
    name varchar(255)
);

create table Blog (
	id int primary key not null auto_increment,
    name varchar(255),
    number_of_likes int default 0 not null
);

create table BlogPost (
	id int primary key not null auto_increment,
	name varchar(255),
    blog_id int not null,
    
    foreign key (blog_id) references Blog(id)
);

create table Likes (
	id int primary key not null auto_increment,
    user_id int not null,
    blog_post_id int not null,
    
    foreign key (blog_post_id) references BlogPost(id),
    foreign key (user_id) references User(id)
);
