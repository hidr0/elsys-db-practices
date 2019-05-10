DROP DATABASE IF EXISTS Elsys;
CREATE DATABASE Elsys;

USE Elsys;

CREATE TABLE Users(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    u_name VARCHAR(50) NOT NULL UNIQUE,
    number_of_likes_on_own_posts INT
);

CREATE TABLE Post(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    p_name VARCHAR(50) NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Likes(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES Users(id),
	FOREIGN KEY (post_id) REFERENCES Post(id)
);
delimiter //
CREATE TRIGGER Like_counter AFTER INSERT ON Likes
	FOR EACH ROW 
	Begin
		UPDATE Users SET number_of_likes_on_own_posts = (SELECT COUNT(l.post_id) AS 'number of likes' FROM Post p
													INNER JOIN Likes l ON l.post_id = p.id
                                                    INNER JOIN Users u ON u.id = p.user_id
													GROUP BY p.p_name);
	end ; // 
delimiter ;

delimiter //
CREATE TRIGGER Like_counter AFTER UPDATE ON Likes
	FOR EACH ROW 
	Begin
		UPDATE Users SET number_of_likes_on_own_posts = (SELECT COUNT(l.post_id) AS 'number of likes' FROM Post p
													INNER JOIN Likes l ON l.post_id = p.id
                                                    INNER JOIN Users u ON u.id = p.user_id
													GROUP BY p.p_name);
	end ; // 
delimiter ;

delimiter //
CREATE TRIGGER Like_counter AFTER DELETE ON Likes
	FOR EACH ROW 
	Begin
		UPDATE Users SET number_of_likes_on_own_posts = (SELECT COUNT(l.post_id) AS 'number of likes' FROM Post p
													INNER JOIN Likes l ON l.post_id = p.id
                                                    INNER JOIN Users u ON u.id = p.user_id
													GROUP BY p.p_name);
	end ; // 
delimiter ;

INSERT INTO Users(u_name) VALUES 
	('user1'),
    ('user2'),
    ('user3');

INSERT INTO Post(p_name, user_id) VALUES 
	('post1',1),
    ('post2',1),
    ('post3',2),
    ('post4',2),
    ('post5',3),
    ('post6',3);
    
INSERT INTO Likes(user_id, post_id) VALUES
	(1, 1),
    (1, 2),
    (2, 1),
    (2, 2),
    (1, 3),
    (3, 4),
    (1, 4),
    (2, 4),
    (1, 5),
    (3, 5),
    (1, 6),
    (3, 6);
    
SELECT u.u_name AS 'User name', p.p_name AS 'Post name' FROM Post p
INNER JOIN Users u ON u.id = p.user_id;

SELECT u.u_name AS 'User name', u.number_of_likes_on_own_posts AS 'number of likes' FROM Users u;

SELECT u.u_name AS 'User name', u.u_name AS 'User name' FROM Likes l
LEFT JOIN Users u ON u.id = l.user_id
Left JOIN Post p ON p.user_id = u.id AND p.id = l.post_id;

SELECT p.p_name AS 'Post name', COUNT(l.post_id) AS 'number of likes' FROM Post p
INNER JOIN Likes l ON l.post_id = p.id
GROUP BY p.p_name;
