USE GOT;


INSERT INTO house(name) VALUES('Grifindor');
INSERT INTO house(name) VALUES('Huffelpuff');
INSERT INTO house(name) VALUES('Sliderin');

INSERT INTO person(name, house_id) VALUES('Gosho', 1);
INSERT INTO person(name, house_id) VALUES('Pesho', 1);

INSERT INTO person(name, house_id) VALUES('Ivan', 2);
INSERT INTO person(name, house_id) VALUES('Dragan', 2);

INSERT INTO person(name, house_id) VALUES('Mitio', 3);
INSERT INTO person(name, house_id) VALUES('Grisho', 3);


INSERT INTO battle(winner_id, loser_id) VALUES(1,3);

INSERT INTO battle(winner_id, loser_id) VALUES(2,4);

INSERT INTO battle(winner_id, loser_id) VALUES(4,6);

INSERT INTO battle(winner_id, loser_id) VALUES(5,3);