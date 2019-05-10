insert into User(username, number_of_likes_on_own_posts)
	values ('User1',1),
			('User2',4),
			('User3',5);
            

insert into Post(name, user_id)
	values ('Post11',1),
			('Post12',1),
			('Post21',2),
			('Post22',2),
            ('Post31',3),
            ('Post32',3),
			('User33',3);
insert into Likes(user_id,post_id)
	values (1,1),
			(1,2),
            (1,3),
            (1,4),
            (1,5),
            (2,1),
            (2,2),
            (2,3),
            (3,7),
            (3,5),
            (3,4),
            (3,1);
