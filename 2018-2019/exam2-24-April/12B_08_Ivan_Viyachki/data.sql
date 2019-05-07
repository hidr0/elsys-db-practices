
INSERT INTO Blog(name,number_of_likes) VALUES('50cent',10);
INSERT INTO Blog(name,number_of_likes) VALUES('cent',4);
INSERT INTO Blog(name,number_of_likes) VALUES('ent',500);

INSERT INTO BlogPost(name,blog_id) VALUES('da',1);
INSERT INTO BlogPost(name,blog_id) VALUES('daa',2);
INSERT INTO BlogPost(name,blog_id) VALUES('daaa',3);

INSERT INTO User(name) VALUES('pesho');
INSERT INTO User(name) VALUES('dragan');
INSERT INTO User(name) VALUES('vazov');

INSERT INTO Likes(user_id,blog_id) VALUES(1,1);
INSERT INTO Likes(user_id,blog_id) VALUES(1,3);
INSERT INTO Likes(user_id,blog_id) VALUES(3,1);
INSERT INTO Likes(user_id,blog_id) VALUES(2,2);
INSERT INTO Likes(user_id,blog_id) VALUES(3,2);
