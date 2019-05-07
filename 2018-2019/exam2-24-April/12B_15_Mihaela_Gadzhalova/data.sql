INSERT INTO Blog(Name, Number_of_likes) VALUES ('Animals', 1),
	('Sports', 3),
    ('School', 1);
    
INSERT INTO BlogPost (Name, Blog_id) VALUES ('Lion', 1),
	('Football', 2),
    ('Monkey', 1),
    ('Math', 3);
    
INSERT INTO User (Name) VALUES ('Pesho'),
	('Dani'),
    ('Toshko');
    
INSERT INTO Likes (User_id, Blog_post_id) VALUES (3,1),
	(2,2),
    (1,3),
    (3,2),
    (1,1);
