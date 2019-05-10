drop database if exists instagram;

create database instagram;

use  instagram;

create table Users (
	id int primary key not null auto_increment,
    name varchar(255),
    number_of_likes int default 0 not null
);

create table Posts(
	id int primary key not null auto_increment,
    name varchar(255),
    user_id int not null,
    
    foreign key (user_id) references Users(id)
);

create table Likes (
	id int primary key not null auto_increment,
    user_id int not null,
    post_id int not null,
    
    foreign key (post_id) references Posts(id),
    foreign key (user_id) references Users(id)
);

delimiter &

create trigger ILikes after insert on Likes for each row
begin
	update Users u
    set u.number_of_likes = u.number_of_likes + 1
    where u.id = new.user_id;
end&

create trigger ULikes after update on Likes for each row
begin
	update Users u
    set u.number_of_likes = u.number_of_likes + 1
    where u.id = new.user_id;
    
    update Users u
    set u.number_of_likes = u.number_of_likes - 1
    where u.id = old.user_id;
end&

create trigger DLikes after update on Likes for each row
begin
	update Users u
    set u.number_of_likes = u.number_of_likes -1
    where u.id = new.user_id;
end&

delimiter ;

insert into Users values (null, "Gosho1", 0);
insert into Users values (null, "Pesho2", 0);
insert into Users values (null, "Maria3", 0);

insert into Posts values (null, "pos1", 1);
insert into Posts values (null, "pos2", 1);
insert into Posts values (null, "pos3", 2);
insert into Posts values (null, "pos4", 2);
insert into Posts values (null, "pos5", 3);
insert into Posts values (null, "pos6", 3);

insert into Likes values(null, 1, 1);
insert into Likes values(null, 1, 1);
insert into Likes values(null, 1, 2);
insert into Likes values(null, 1, 2);
insert into Likes values(null, 2, 1);
insert into Likes values(null, 2, 1);
insert into Likes values(null, 2, 1);
insert into Likes values(null, 2, 1);
insert into Likes values(null, 3, 1);
insert into Likes values(null, 3, 1);
insert into Likes values(null, 3, 1);
insert into Likes values(null, 3, 1);

select u.name, p.name from Posts p 
left join Users u on p.user_id = u.id;

select u.name, u.number_of_likes from Users u;