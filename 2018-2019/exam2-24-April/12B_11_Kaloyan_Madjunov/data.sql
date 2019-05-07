INSERT INTO Blog(name) VALUES
('The Bakers'),
('Wallpapers'),
('Outfits');

INSERT INTO BlogPost(name, blog_id) VALUES
('Banana Bread', 1),
('Waffles with Blueberries and Honey', 1),
('Sunset in Bali', 2),
('Spring Leather Jacket Outfit', 3);

INSERT INTO User(name) VALUES
('Kaloyan'),
('Peps'),
('Reti');

INSERT INTO Likes(blog_post, user_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 3);