INSERT INTO Blog(name, number_of_likes) VALUES("Book review", 5);
INSERT INTO Blog(name, number_of_likes) VALUES("Tools and Hacks", 8);
INSERT INTO Blog(name, number_of_likes) VALUES("Good manners", 25);

INSERT INTO BlogPost(blog_id, name) VALUES(1, "Harry Potter");
INSERT INTO BlogPost(blog_id, name) VALUES(2, "Hacking Google Chrome");
INSERT INTO BlogPost(blog_id, name) VALUES(3, "Discipline");

INSERT INTO User(name) VALUES("Pencho");
INSERT INTO User(name) VALUES("Gosho");
INSERT INTO User(name) VALUES("Atanas");

INSERT INTO Likes(user_id, blog_post_id) VALUES(1, 2);
INSERT INTO Likes(user_id, blog_post_id) VALUES(2, 3);
INSERT INTO Likes(user_id, blog_post_id) VALUES(3, 1);
