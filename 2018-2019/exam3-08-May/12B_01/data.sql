INSERT INTO User(name) VALUES
('Sasho'),
('Deni'),
('Mimi');

INSERT INTO Post(name, user_id) VALUES
('Post1', 1),
('Post2', 1),
('Post3', 2),
('Post4', 2),
('Post5', 3),
('Post6', 3);

INSERT INTO Likes(post_id, user_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 1),
(2, 2),
(2, 3),
(2, 1),
(2, 2),
(3, 3),
(3, 1),
(3, 2),
(3, 3);