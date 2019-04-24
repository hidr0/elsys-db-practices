INSERT INTO User(id, name, username, number_of_total_views) VALUES(1, 'Toni', 'tonyut', 0),
	(2,'Ani', 'anna', 0),
    (3,'Mimi', 'mims5059', 0);


INSERT INTO Channel (id, c_name, user_id)VALUES(1,'Channel1', 1),
	(2,'Channel2', 2),
    (3,'Channel3', 3);

INSERT INTO Video (id, v_name, channel_id, views)VALUES(1, 'T', 1, 5),
	(2, 'A', 2, 8),
    (3, 'AA', 2, 1);