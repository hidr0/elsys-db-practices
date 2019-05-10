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