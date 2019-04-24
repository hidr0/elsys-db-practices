USE game_of_thrones;

INSERT INTO Houses (id, name) VALUES (1, 'aba');
INSERT INTO Houses (name) VALUES ('daba');
INSERT INTO Houses (name) VALUES ('caba');

INSERT INTO Persons VALUES (1, 'pesho', 1);
INSERT INTO Persons (name, house_id) VALUES ('iva', 1);
INSERT INTO Persons (name, house_id) VALUES ('a', 2);
INSERT INTO Persons (name, house_id) VALUES ('c', 2);
INSERT INTO Persons (name, house_id) VALUES ('d', 3);
INSERT INTO Persons (name, house_id) VALUES ('c', 3);

INSERT INTO Battles VALUES (1, 1, 3);
INSERT INTO Battles VALUES (2, 4, 6);
INSERT INTO Battles VALUES (3, 2, 6);
INSERT INTO Battles VALUES (4, 5, 2);

INSERT INTO PersonBattles VALUES (1, 1, 1);
INSERT INTO PersonBattles VALUES (2, 3, 1);
INSERT INTO PersonBattles VALUES (3, 4, 2);
INSERT INTO PersonBattles VALUES (4, 5, 2);
INSERT INTO PersonBattles VALUES (5, 6, 2);
INSERT INTO PersonBattles VALUES (6, 2, 3);
INSERT INTO PersonBattles VALUES (7, 6, 3);
INSERT INTO PersonBattles VALUES (8, 5, 4);
INSERT INTO PersonBattles VALUES (9, 2, 4);
