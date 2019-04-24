USE GOT;

CREATE TRIGGER insert_battle AFTER INSERT ON battle
FOR EACH ROW 
	UPDATE house as h SET h.number_of_wins = h.number_of_wins + 1
    WHERE h.id = (SELECT house_id from person as p WHERE p.id = NEW.winner_id);
    
CREATE TRIGGER delete_battle BEFORE DELETE ON battle
FOR EACH ROW 
	UPDATE house as h SET h.number_of_wins = h.number_of_wins - 1
    WHERE h.id = (SELECT house_id from person as p WHERE p.id = OLD.winner_id);
    
CREATE TRIGGER update_battle AFTER UPDATE ON battle
FOR EACH ROW 
	UPDATE house as h SET h.number_of_wins = h.number_of_wins + 1
    WHERE h.id = (SELECT house_id from person as p WHERE p.id = NEW.winner_id);
    
	UPDATE house as h SET h.number_of_wins = h.number_of_wins - 1
    WHERE h.id = (SELECT house_id from person as p WHERE p.id = OLD.winner_id);

