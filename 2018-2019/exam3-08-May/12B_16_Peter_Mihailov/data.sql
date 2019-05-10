
INSERT USER(username) VALUES("PESHO");
INSERT USER(username) VALUES("Kaloyan");
INSERT USER(username) VALUES("TOSHKO");

INSERT POST(name, user_id) VALUES("POST1", 1);
INSERT POST(name, user_id) VALUES("POST2", 1);
 
INSERT POST(name, user_id) VALUES("POST3", 2); 
INSERT POST(name, user_id) VALUES("POST4", 2);
 
INSERT POST(name, user_id) VALUES("POST5", 3); 
INSERT POST(name, user_id) VALUES("POST6", 3);
 
INSERT Likes(user_id, post_id) VALUES(1, 1);
INSERT Likes(user_id, post_id) VALUES(1, 2);
INSERT Likes(user_id, post_id) VALUES(1, 3);
INSERT Likes(user_id, post_id) VALUES(1, 4);

INSERT Likes(user_id, post_id) VALUES(2, 1);
INSERT Likes(user_id, post_id) VALUES(2, 2);
INSERT Likes(user_id, post_id) VALUES(2, 3);
INSERT Likes(user_id, post_id) VALUES(2, 4);

INSERT Likes(user_id, post_id) VALUES(3, 1);
INSERT Likes(user_id, post_id) VALUES(3, 2);
INSERT Likes(user_id, post_id) VALUES(3, 3);
INSERT Likes(user_id, post_id) VALUES(3, 4);

