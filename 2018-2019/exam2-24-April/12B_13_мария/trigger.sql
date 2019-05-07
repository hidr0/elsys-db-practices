insert blog(name,number_of_likes) values ('mimi', 50);
insert blog(name,number_of_likes) values ('vladi', 57);
insert blog(name,number_of_likes) values ('bubu', 60);

insert blogpost(name,blog_id) values ('hrana', 1);
insert blogpost(name,blog_id) values ('vreme', 2);
insert blogpost(name,blog_id) values ('nebe', 3);

insert user(name) values ('mimi1');
insert user(name) values ('mimi5');
insert user(name) values ('mimi7');

insert likes(user_id,blog_post_id) values (1, 1);
insert likes(user_id,blog_post_id) values (1, 2);
insert likes(user_id,blog_post_id) values (1, 3);
insert likes(user_id,blog_post_id) values (2, 1);
insert likes(user_id,blog_post_id) values (3, 1);