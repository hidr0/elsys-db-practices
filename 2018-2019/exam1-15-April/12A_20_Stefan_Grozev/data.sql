USE School;

INSERT INTO House(name)
	VALUES('drujba'),
		  ('mladost'),
          ('lulin');
          
INSERT INTO Person(name, house_id)
	VALUES('George', 1),
		  ('Mike', 1),
          ('Maria', 2),
          ('Nina', 2),
          ('Steven', 3),
          ('Simeon', 3);
          
INSERT INTO Battle(winner_id, loser_id)
	VALUES(1,6),
		  (2,5),
		  (3,4);