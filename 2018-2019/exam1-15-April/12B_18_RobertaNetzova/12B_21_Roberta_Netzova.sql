drop database if exists db;

create database db;

use db;

create table User (
	Id  int auto_increment not null primary key,
    name varchar(50) not null,
    username varchar(50),
    number_of_total_views int,
    unique(username)
);

create table Channel (
	Id int not null auto_increment primary key,
	name varchar(50) not null,
	user_id int not null,
    foreign key (user_id) references User(Id)
);

create table Video (
	Id int not null auto_increment primary key,
	name varchar(50) not null,
    channel_id int not null,
    views int not null,
    foreign key (channel_id) references Channel(Id)
);

insert into User (name, username, number_of_total_views) 
	values ('Name1','Username1',4),
			('Name2','Username2',2),
            ('Name3','Username3',1);

insert into Channel (name, user_id) 
	values ('Channel1',1),
			('Channel2',2),
            ('Channel3',3);
            
insert into Video (name, channel_id, views)
	values ('C1V1',1,8),
			('C2V1',2,50),
            ('C2V2',2,60);
            
select v.name, v.views,u.name, c.name from Video v
inner join Channel c 
on channel_id = c.Id
inner join User u
on c.user_id = u.Id; 

select distinct c.name from Channel c
inner join Video v
on v.channel_id = c.Id;

select distinct u.name, u.username, u.number_of_total_views
from User as u
inner join Channel c
on c.user_id = u.Id
inner join Video v
on v.channel_id = c.Id;
-- select* from User;
-- select* from Channel;
-- select* from Video;