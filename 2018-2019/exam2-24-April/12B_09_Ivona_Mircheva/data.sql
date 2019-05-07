
insert into Blog (name) values 
	('hop'),
	('trop'),
	('drum');

insert into BlogPost (name, blog_id) values
	('hopping is good', 1),
	('tropping is bad', 2),
	('drumming is life', 3)
;

insert into User (name) values
	('Him'),
	('Her'),
	('It')
;

insert into Likes (user_id, blog_post_id) values
	(1, 1),
	(2, 2),
	(1, 3),
    (2, 3),
    (3, 3)
;