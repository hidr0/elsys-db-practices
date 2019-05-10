create table user(
	id int auto_increment primary key,
    username varchar(50) not null unique,
    number_of_likes_on_own_posts int default 0
    
);

create table post(
	id int auto_increment primary key,
    name varchar(50) not null,
    user_id int not null,
    
    foreign key (user_id) references user(id)
);

create table likes(
	id int auto_increment primary key,
    user_id int not null,
    post_id int not null,
    
    foreign key (user_id) references user(id),
    foreign key (post_id) references post(id)
);