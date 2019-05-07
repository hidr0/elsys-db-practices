INSERT Blog(name) values("BLog1");
INSERT Blog(name) values("BLog2");
INSERT Blog(name) values("BLog3");

INSERT BlogPost(name, blog_id) values("BlogPost1", 1);
INSERT BlogPost(name, blog_id) values("BlogPost2", 2);
INSERT BlogPost(name, blog_id) values("BlogPost3", 3);

INSERT User(name) values("Pesho");
INSERT User(name) values("Gosho");
INSERT User(name) values("Tosho");

Insert Likes(user_id, blog_post_id) values(1, 1);
Insert Likes(user_id, blog_post_id) values(1, 2);
Insert Likes(user_id, blog_post_id) values(1, 3);
Insert Likes(user_id, blog_post_id) values(2, 1);
Insert Likes(user_id, blog_post_id) values(2, 2);
Insert Likes(user_id, blog_post_id) values(3, 1);

