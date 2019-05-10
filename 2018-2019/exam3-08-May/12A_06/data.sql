INSERT INTO T_User(username) VALUES("Pesho");
INSERT INTO T_User(username) VALUES("Gosho");
INSERT INTO T_User(username) VALUES("Ginka");

INSERT INTO T_Post(post_name, user_id) VALUES("Snimka", 1);
INSERT INTO T_Post(post_name, user_id) VALUES("Filmarsko", 1);
INSERT INTO T_Post(post_name, user_id) VALUES("Screenshot", 2);
INSERT INTO T_Post(post_name, user_id) VALUES("Foto", 2);
INSERT INTO T_Post(post_name, user_id) VALUES("Klip4e", 3);
INSERT INTO T_Post(post_name, user_id) VALUES("tumblr", 3);

INSERT INTO Likes(user_id, post_id) VALUES(1, 1);
INSERT INTO Likes(user_id, post_id) VALUES(2, 2);
INSERT INTO Likes(user_id, post_id) VALUES(3, 3);
INSERT INTO Likes(user_id, post_id) VALUES(1, 4);
INSERT INTO Likes(user_id, post_id) VALUES(2, 5);
INSERT INTO Likes(user_id, post_id) VALUES(3, 6);
INSERT INTO Likes(user_id, post_id) VALUES(1, 1);
INSERT INTO Likes(user_id, post_id) VALUES(2, 2);
INSERT INTO Likes(user_id, post_id) VALUES(3, 3);
INSERT INTO Likes(user_id, post_id) VALUES(1, 4);
INSERT INTO Likes(user_id, post_id) VALUES(2, 5);
INSERT INTO Likes(user_id, post_id) VALUES(3, 6);
INSERT INTO Likes(user_id, post_id) VALUES(3, 6);