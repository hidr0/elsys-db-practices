CREATE TRIGGER insertWon
AFTER INSERT ON Battles
FOR EACH ROW
	UPDATE Houses SET number_of_wins = number_of_wins + 1
    WHERE Houses.id = (SELECT house_id FROM Persons WHERE NEW.winner_id = id);
    
CREATE TRIGGER deleteWon
AFTER DELETE ON Battles
FOR EACH ROW
	UPDATE Houses SET number_of_wins = number_of_wins - 1
    WHERE Houses.id = (SELECT house_id FROM Persons WHERE OLD.winner_id = id);

DELIMITER $$

CREATE TRIGGER updateWon
AFTER UPDATE ON Battles
FOR EACH ROW
	UPDATE Houses SET number_of_wins = number_of_wins - 1
    WHERE Houses.id = (SELECT house_id FROM Persons WHERE OLD.winner_id = id);
    
    UPDATE Houses SET number_of_wins = number_of_wins + 1
    WHERE Houses.id = (SELECT house_id FROM Persons WHERE NEW.winner_id = id)$$
    
DELIMITER ;