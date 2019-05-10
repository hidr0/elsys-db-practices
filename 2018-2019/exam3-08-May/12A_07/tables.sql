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

