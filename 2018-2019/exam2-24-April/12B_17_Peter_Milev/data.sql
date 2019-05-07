INSERT INTO Blog (name)
	VALUES ('Hardware'),
		('Software'),
		('Monitori');

INSERT INTO BlogPost (name, blog_id)
	VALUES ('PostZaHardware', 1),
		('PostZaSoftware', 2),
		('PostZaMonitori1', 3),
        ('PostZaMonitori2', 3);
      
INSERT INTO User (name)
	VALUES ('Pesho'),
		('Gosho'),
        ('Vladi');

INSERT INTO Likes (user_id, blog_post_id)
	VALUES (1, 1),
		(1, 2),
		(1, 3),
		(2, 2),
        (2, 2),
		(3, 3);