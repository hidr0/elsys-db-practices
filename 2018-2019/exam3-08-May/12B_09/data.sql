insert into User(username) values
("Bob"),
("Mike"),
("Cooper");

insert into Post(name, user_id) values
("BobPost1",1),
("BobPost2",1),
("MikePost1",2),
("MikePost2",2),
("CooperPost1",3),
("CooperPost2",3);

insert into Likes(user_id, post_id) values
(1,1),
(1,2),
(1,3),
(1,4),
(2,5),
(2,6),
(2,1),
(2,2),
(3,5),
(3,6),
(3,3),
(3,4);