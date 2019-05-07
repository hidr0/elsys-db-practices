INSERT INTO blog(name) VALUES('kon');
INSERT INTO blog(name) VALUES('nok');
INSERT INTO blog(name) VALUES('onk');

INSERT INTO blog_post(name,blog_id) VALUES('gotin kon', 1);
INSERT INTO blog_post(name,blog_id) VALUES('goin nok', 2);
INSERT INTO blog_post(name,blog_id) VALUES('goin onk', 3);

INSERT INTO user(name) VALUES('ivan');
INSERT INTO user(name) VALUES('dragan');
INSERT INTO user(name) VALUES('petkan');

INSERT INTO likes(user_id, blog_post_id) VALUES(1,1);
INSERT INTO likes(user_id, blog_post_id) VALUES(2,1);

INSERT INTO likes(user_id, blog_post_id) VALUES(3,2);
INSERT INTO likes(user_id, blog_post_id) VALUES(1,2);

INSERT INTO likes(user_id, blog_post_id) VALUES(3,3);