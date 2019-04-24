INSERT INTO User (id, name, username) VALUES (2, 'Destin', 'hey its me');
INSERT INTO User (id, name, username) VALUES (3, 'Michael Stevens', 'hey vsauce michael here');
INSERT INTO User (id, name, username) VALUES (1, 'Derek', 'damn son');

INSERT INTO Channel (id, name, user_id) VALUES (1, 'SmarterEveryDay', 2);
INSERT INTO Channel (id, name, user_id) VALUES (2, 'Vsauce', 3);
INSERT INTO Channel (id, name, user_id) VALUES (3, 'Veritasium', 1);

INSERT INTO Video (name, channel_id, views) VALUES ('Laminar flow', 1, 1000);
INSERT INTO Video (name, channel_id, views) VALUES ('Black hole', 2, 100000);
INSERT INTO Video (name, channel_id, views) VALUES ('Gyroscope magic', 2, 3000);
