create table user(
	id int auto_increment primary key,
    name varchar(20) not null
);

create table blog(
	id int auto_increment primary key,
    name varchar(50) not null,
    number_of_likes int default 0
);

create table blogpost(
	id int auto_increment primary key,
    name varchar(100) not null,
    blog_id int not null,
    
    foreign key (blog_id) references blog(id)
);

create table likes(
    user_id int not null,
    blog_post_id int not null,
    
    foreign key (user_id) references user(id),
    foreign key (blog_post_id) references blogpost(id)
);