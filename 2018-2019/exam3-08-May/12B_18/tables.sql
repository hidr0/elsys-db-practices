create table User (
	Id int not null auto_increment primary key,
    username varchar(100) not null unique,
    number_of_likes_on_own_posts int not null
);

create table Post (
	Id int not null auto_increment primary key,
    name varchar(100) not null,
    user_id int not null,
    foreign key(user_id) references User(Id)
     on update cascade on delete cascade
);

create table Likes (
	Id int not null auto_increment primary key,
    user_id int not null,
    post_id int not null, 
	foreign key(user_id) references User(Id)
    on update cascade on delete cascade,
	foreign key(post_id) references Post(Id)
     on update cascade on delete cascade
);