create database youtube;
use youtube;

create table user(
	id int auto_increment not null primary key ,
    name char(20),
    username varchar(20) ,
	number_of_total_views int 

);

create table channel(
	id int auto_increment not null primary key,
	name char(20),
	user_id int not null,
	foreign key (user_id) references user(id)

);

create table video(
	id int auto_increment not null primary key,
	name char(20),
    channel_id int not null,
    views int,
    foreign key (channel_id) references channel(id)
);

insert into user(name,username) values('sasho', 'sashko32');
insert into user(name,username) values('toni', 'mangoto');
insert into user(name,username) values('bibi', 'maznoto');

insert into channel(name,user_id) values('bnt', 1);
insert into channel(name,user_id) values('btv', 2);
insert into channel(name,user_id) values('nova', 3);

insert into video(name,channel_id,views) values('n', 1,50);
insert into video(name,channel_id,views) values('t', 2,150);
insert into video(name,channel_id,views) values('y', 2,250);

select v.name as 'Video Name', v.views as 'Video views', u.name as 'User name',ch.name as 'Channel name' from user u
left join channel ch
on u.id = ch.user_id
left join video v
on ch.id = v.channel_id;

select ch.name from channel ch
left join video v
on ch.id = v.channel_id
group by ch.name;

select u.name, u.username,u.number_of_total_views from user u
left join channel ch
on u.id = ch.user_id
left join video v
on ch.id = v.channel_id;





