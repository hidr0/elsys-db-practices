drop database if exists got;

create database got;

use got;

create table house(
	id integer auto_increment primary key,
    name varchar(100),
    number_of_wins integer default 0
);

create table person(
	id integer auto_increment primary key,
    Name varchar(100),
    house_id integer ,
    foreign key(house_id) references house(id)
);

create table battle(
	id integer auto_increment primary key,
    winner_id integer,
    loser_id integer
);