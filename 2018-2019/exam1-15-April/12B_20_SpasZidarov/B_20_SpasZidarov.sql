drop database if exists gameoftrones;
create database gameoftrones;
use gameoftrones;

create table House(
	id integer auto_increment primary key,
    name varchar(100),
    number_of_wins integer
);

create table Person(
	id integer auto_increment primary key,
    name varchar(100),
    house_id integer,
	foreign key(house_id) references House(id)
);

create table Battle(
	id integer auto_increment primary key,
    winner_id integer,
    loser_id integer,
   	foreign key(winner_id) references Person(id),
	foreign key(loser_id) references Person(id)
);

delimiter //
CREATE TRIGGER on_insert_into_battle after insert on Battle
       FOR EACH ROW
       BEGIN
			IF Person.id = Battle.winner_id THEN
				if Person.house_id = House.id then
					update House SET number_of_wins = number_of_wins + 1;
                end if;
			END IF;
       END;//
delimiter ;

insert into House(name, number_of_wins) 
values ('house 1', 5);
insert into House(name, number_of_wins) 
values ('house 2', 4);
insert into House(name, number_of_wins) 
values ('house 3', 3);

insert into Person(name, house_id)
values('Spas', 1);
insert into Person(name, house_id)
values('Phillip', 1);
insert into Person(name, house_id)
values('Toma', 2);
insert into Person(name, house_id)
values('Zojko', 2);
insert into Person(name, house_id)
values('Kris', 3);
insert into Person(name, house_id)
values('RythmBot', 3);

insert into Battle(winner_id, loser_id)
values(1, 4);
insert into Battle(winner_id, loser_id)
values(3, 6);
insert into Battle(winner_id, loser_id)
values(2, 5);

select p.name from Person as p
inner join Battle as b
on p.id = b.winner_id;

select h.name from House as h
inner join Person as p
on h.id = p.house_id
inner join Battle as b
on p.id = b.loser_id;

