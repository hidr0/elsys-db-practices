DROP DATABASE IF EXISTS got;
CREATE DATABASE got;

USE got;

CREATE TABLE houses(
	id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    number_of_wins INTEGER DEFAULT 0
);

CREATE TABLE people(
	id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	house_id INTEGER NOT NULL,
    FOREIGN KEY (house_id) REFERENCES houses(id)
);

CREATE TABLE battles(
	id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	winner_id INTEGER NOT NULL,
    loser_id INTEGER NOT NUll,
    FOREIGN KEY (winner_id) REFERENCES people(id),
	FOREIGN KEY (loser_id) REFERENCES people(id)
);

-- CREATE TRIGGER after_battle_insert
-- AFTER INSERT ON battles
-- FOR EACH ROW
-- 	UPDATE houses
--     SET number_of_wins = number_of_wins + 1
--     WHERE id = NEW.winner_id.house_id;

INSERT INTO houses(name) VALUES('House 1');
INSERT INTO houses(name) VALUES('House 2');
INSERT INTO houses(name) VALUES('House 3');

INSERT INTO people(name, house_id) VALUES('Ivan', 1);
INSERT INTO people(name, house_id) VALUES('Gosho', 1);
INSERT INTO people(name, house_id) VALUES('Ivanka', 2);
INSERT INTO people(name, house_id) VALUES('Mariika', 2);
INSERT INTO people(name, house_id) VALUES('Pesho', 3);
INSERT INTO people(name, house_id) VALUES('Stoqn', 3);

INSERT INTO battles(winner_id, loser_id) VALUES(1, 2);
INSERT INTO battles(winner_id, loser_id) VALUES(3, 4);
INSERT INTO battles(winner_id, loser_id) VALUES(5, 6);

SELECT p.name as 'Name of winners' 
FROM people p
RIGHT JOIN battles b
ON p.id = b.winner_id;

SELECT h.name as 'Name of House'
FROM houses h
LEFT JOIN people p
ON h.id = p.house_id
RIGHT JOIN battles b
ON p.id = b.loser_id
GROUP BY h.id, h.name;

SELECT pw.name as 'Name of winner'
FROM people pw
LEFT JOIN battles b
ON b.winner_id = pw.id
UNION ALL
SELECT pl.name as 'Name of loser'
FROM people pl
LEFT JOIN battles b
ON b.loser_id = pl.id;
