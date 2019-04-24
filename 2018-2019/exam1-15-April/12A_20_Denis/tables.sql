drop database if exists a;

create database a;
use a;

create table House (
	id int primary key not null auto_increment,
    name varchar(256),
    number_of_wins int default 0
);

create table Person (
	id int primary key not null auto_increment,
	name varchar(256),
    house_id int,
    
    foreign key (house_id) references House(id)
);

create table Battle (
	id int primary key not null auto_increment,
	winner_id int not null,
    loser_id int not null,
);
