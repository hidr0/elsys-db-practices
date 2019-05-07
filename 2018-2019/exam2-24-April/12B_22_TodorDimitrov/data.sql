INSERT INTO Blog(name, number_of_likes)
VALUES ('Peshom',0);
INSERT INTO BlogPost(name, blog_id)
VALUES ('zdr',1);
INSERT INTO BlogPost(name, blog_id)
VALUES ('sdsd',1);

INSERT INTO Blog(name, number_of_likes)
VALUES ('Danim',0);
INSERT INTO BlogPost(name, blog_id)
VALUES ('rdz',2);

INSERT INTO Blog(name, number_of_likes)
VALUES ('Terim',0);
INSERT INTO BlogPost(name, blog_id)
VALUES ('dzr',3);

INSERT INTO User(name)
VALUES ('Pesho');
INSERT INTO User(name)
VALUES ('Dani');
INSERT INTO User(name)
VALUES ('Teri');

INSERT INTO Likes(user_id, blog_post_id)
VALUES (1,1);
INSERT INTO Likes(user_id, blog_post_id)
VALUES (1,2);
INSERT INTO Likes(user_id, blog_post_id)
VALUES (1,3);
INSERT INTO Likes(user_id, blog_post_id)
VALUES (2,3);
INSERT INTO Likes(user_id, blog_post_id)
VALUES (3,1);