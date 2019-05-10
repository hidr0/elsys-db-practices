USE db;

INSERT User(username, number_of_likes_on_own_posts) value('A',8);
INSERT User(username, number_of_likes_on_own_posts) value('B',6);
INSERT User(username, number_of_likes_on_own_posts) value('C',4);

INSERT Post(name, user_id)value('p1',1);
INSERT Post(name, user_id)value('p2',1);
INSERT Post(name, user_id)value('p1',2);
INSERT Post(name, user_id)value('p2',2);
INSERT Post(name, user_id)value('p1',3);
INSERT Post(name, user_id)value('p2',3);

INSERT Likes(user_id, post_id)value(1,1);
INSERT Likes(user_id, post_id)value(1,2);
INSERT Likes(user_id, post_id)value(1,3);
INSERT Likes(user_id, post_id)value(2,1);
INSERT Likes(user_id, post_id)value(2,2);
INSERT Likes(user_id, post_id)value(2,3);
INSERT Likes(user_id, post_id)value(3,1);
INSERT Likes(user_id, post_id)value(3,2);
INSERT Likes(user_id, post_id)value(3,3);
INSERT Likes(user_id, post_id)value(1,1);
INSERT Likes(user_id, post_id)value(1,2);
INSERT Likes(user_id, post_id)value(1,3);