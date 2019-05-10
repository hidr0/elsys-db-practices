DROP DATABASE IF EXISTS tumblr_db;
CREATE DATABASE tumblr_db;
USE tumblr_db;

CREATE TABLE Blog (
	id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    number_of_like int DEFAULT 0
);

CREATE TABLE User (
	id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE BlogPost (
	id INTEGER AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    blog_id int,
    
    PRIMARY KEY(id),
    FOREIGN KEY(blog_id) REFERENCES Blog(id)
);

CREATE TABLE Likes (
	id INTEGER AUTO_INCREMENT NOT NULL,
    user_id int NOT NULL,
    blog_post_id int NOT NULL,
    
    PRIMARY KEY(id),
    FOREIGN KEY(blog_post_id) REFERENCES BlogPost(id),
    FOREIGN KEY(user_id) REFERENCES User(id)
);

DELIMITER $

CREATE TRIGGER InsertLike
AFTER INSERT
ON Likes
FOR EACH ROW
BEGIN
	UPDATE Blog as b
    left join BlogPost bp on new.blog_post_id = bp.id
    SET b.number_of_like = b.number_of_like + 1
where bp.blog_id = b.id;
END$


CREATE TRIGGER deleteLike
AFTER DELETE
ON Likes
FOR EACH ROW
BEGIN
	UPDATE Blog as b
    left join BlogPost bp on OLD.blog_post_id = bp.id
    SET b.number_of_like = b.number_of_like - 1 
where bp.blog_id = b.id;
END$

DELIMITER ;

INSERT Blog(name) values("BLog1");
INSERT Blog(name) values("BLog2");
INSERT Blog(name) values("BLog3");

INSERT BlogPost(name, blog_id) values("BlogPost1", 1);
INSERT BlogPost(name, blog_id) values("BlogPost2", 2);
INSERT BlogPost(name, blog_id) values("BlogPost3", 3);

INSERT User(name) values("Pesho");
INSERT User(name) values("Gosho");
INSERT User(name) values("Tosho");

Insert Likes(user_id, blog_post_id) values(1, 1);
Insert Likes(user_id, blog_post_id) values(1, 2);
Insert Likes(user_id, blog_post_id) values(1, 3);
Insert Likes(user_id, blog_post_id) values(2, 1);
Insert Likes(user_id, blog_post_id) values(2, 2);
Insert Likes(user_id, blog_post_id) values(3, 1);


Select bl.name, bp.name from BlogPost bp
Left join Blog bl on bl.id = bp.blog_id
group by bl.name;

Select u.name, count(l.id) from User u
Left join Likes as l ON l.user_id = u.id
group by u.name;

Select b.name, bp.name, u.name  from User u
Left join Likes l on l.user_id = u.id
Left join BlogPost bp on l.blog_post_id = bp.id
Left join Blog b on bp.blog_id = b.id
group by u.name, bp.name, b.name;

Select b.name, count(u.id) from Blog as b
Left join BlogPost bp on bp.blog_id = b.id
Left join Likes l on l.blog_post_id = bp.id
Left join User u on u.id = l.user_id
group by b.name;

