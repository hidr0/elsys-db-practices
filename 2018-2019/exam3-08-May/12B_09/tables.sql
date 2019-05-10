create table User (
	id int auto_increment primary key,
    username varchar(100) unique not null,
    number_of_likes_on_own_posts int default 0
);

create table Post (
	id int auto_increment primary key,
    name varchar(100) not null,
    user_id int,
    foreign key (user_id) references User(id)
);

create table Likes (
	id int auto_increment primary key,
	user_id int,
    post_id int,
	foreign key (user_id) references User(id),
    foreign key (post_id) references Post(id)
);
