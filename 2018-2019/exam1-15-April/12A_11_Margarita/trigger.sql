 CREATE TRIGGER battle_res AFTER INSERT ON Battle
 	FOR EACH ROW 
 		UPDATE House SET number_of_wins = (SELECT COUNT(winner_id) FROM Battle b
										RIGHT JOIN Person p ON b.winner_id = p.id
										RIGHT JOIN House h ON h.id = p.house_id
										GROUP BY h.id)
		WHERE House.id = NEW.id;
 
 CREATE TRIGGER battle_res AFTER UPDATE ON Battle
 	FOR EACH ROW 
 		UPDATE House SET number_of_wins = (SELECT COUNT(winner_id) FROM Battle b
										RIGHT JOIN Person p ON b.winner_id = p.id
										RIGHT JOIN House h ON h.id = p.house_id
										GROUP BY h.id)
		WHERE House.id = NEW.id;
        
CREATE TRIGGER battle_res AFTER DELETE ON Battle
 	FOR EACH ROW 
 		UPDATE House SET number_of_wins = (SELECT COUNT(winner_id) FROM Battle b
										RIGHT JOIN Person p ON b.winner_id = p.id
										RIGHT JOIN House h ON h.id = p.house_id
										GROUP BY h.id)
		WHERE House.id = NEW.id;