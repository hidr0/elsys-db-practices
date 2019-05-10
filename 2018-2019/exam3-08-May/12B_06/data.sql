insert into user(username) values
('Daniel'), ('Ivona'), ('Pesho');

insert into post(name, user_id) values
('food', 1), ('games', 1), 
('nails', 2), ('cooking', 2), 
('fortnite', 3), ('hairstyle', 3);

insert into likes(user_id, post_id) values
(1, 1), (1, 3), (1, 5), (1, 2), (2, 4), (2, 3), 
(2, 5), (2, 1), (3, 2), (3, 4), (3, 3), (3, 6);