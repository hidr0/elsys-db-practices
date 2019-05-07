USE db;

INSERT INTO Blog (id, name, number_of_likes) VALUES (1, 'PeshoBlog', 3);
INSERT INTO Blog (id, name, number_of_likes) VALUES (2, 'GoshoBlog', 7);
INSERT INTO Blog (id, name, number_of_likes) VALUES (3, 'ToshoBlog', 20);

INSERT INTO BlogPost (id, name, blog_id)VALUES (1, 'BlogPost1', 1);
INSERT INTO BlogPost (id, name, blog_id)VALUES (2, 'BlogPost2', 1);
INSERT INTO BlogPost (id, name, blog_id)VALUES (3, 'BlogPost3', 2);
INSERT INTO BlogPost (id, name, blog_id)VALUES (4, 'BlogPost4', 2);
INSERT INTO BlogPost (id, name, blog_id)VALUES (5, 'BlogPost5', 3);
INSERT INTO BlogPost (id, name, blog_id)VALUES (6, 'BlogPost6', 3);

INSERT INTO User (id, user) VALUES (1, 'Pesho');
INSERT INTO User (id, user) VALUES (2, 'Gosho');
INSERT INTO User (id, user) VALUES (3, 'Tosho');

INSERT INTO Likes (id, user_id, blog_post) VALUES (1, 1, 1);
INSERT INTO Likes (id, user_id, blog_post) VALUES (2, 1, 2);
INSERT INTO Likes (id, user_id, blog_post) VALUES (3, 2, 3);
INSERT INTO Likes (id, user_id, blog_post) VALUES (4, 3, 2);
INSERT INTO Likes (id, user_id, blog_post) VALUES (5, 3, 2);